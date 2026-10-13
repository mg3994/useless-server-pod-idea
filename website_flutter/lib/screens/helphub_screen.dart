import 'package:flutter/material.dart';
import 'package:website_client/website_client.dart';
import '../client.dart';

class HelpHubScreen extends StatefulWidget {
  const HelpHubScreen({super.key});

  @override
  State<HelpHubScreen> createState() => _HelpHubScreenState();
}

class _HelpHubScreenState extends State<HelpHubScreen> {
  List<HelpRequest> _requests = [];
  List<UserProfile> _leaderboard = [];
  UserProfile? _profile;
  bool _isLoading = true;

  String _selectedCategory = 'All';
  String _selectedStatus = 'All';
  String _searchQuery = '';

  final _searchController = TextEditingController();

  final List<String> _categories = [
    'All',
    'Borrow Item',
    'Errand & Delivery',
    'Tutoring & Study',
    'Pet & Plant Care',
    'Tech & Rides',
  ];

  final List<String> _statuses = ['All', 'Open', 'In Progress', 'Completed'];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    try {
      const userEmail = 'user@helphub.com';

      final requests = await client.helpRequest.getHelpRequests(
        category: _selectedCategory,
        status: _selectedStatus,
        searchQuery: _searchQuery,
      );

      final profile = await client.helpRequest.getUserProfile(email: userEmail);
      final leaderboard = await client.helpRequest.getLeaderboard();

      setState(() {
        _requests = requests;
        _profile = profile;
        _leaderboard = leaderboard;
        _isLoading = false;
      });
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _showCommentsBottomSheet(HelpRequest req) async {
    final commentController = TextEditingController();
    List<RequestComment> comments = [];
    bool isLoadingComments = true;

    Future<void> fetchComments(StateSetter setModalState) async {
      setModalState(() => isLoadingComments = true);
      try {
        final result = await client.helpRequest.getComments(requestId: req.id!);
        setModalState(() {
          comments = result;
          isLoadingComments = false;
        });
      } catch (e) {
        setModalState(() => isLoadingComments = false);
      }
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (bottomSheetContext) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            if (isLoadingComments) {
              fetchComments(setModalState);
            }

            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(bottomSheetContext).viewInsets.bottom,
                left: 16,
                right: 16,
                top: 16,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '💬 Q&A: ${req.title}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(bottomSheetContext),
                      ),
                    ],
                  ),
                  const Divider(),
                  SizedBox(
                    height: 250,
                    child: isLoadingComments
                        ? const Center(child: CircularProgressIndicator())
                        : comments.isEmpty
                        ? const Center(
                            child: Text(
                              'No comments yet. Be the first to ask!',
                            ),
                          )
                        : ListView.builder(
                            itemCount: comments.length,
                            itemBuilder: (context, index) {
                              final c = comments[index];
                              return ListTile(
                                dense: true,
                                title: Text(
                                  c.authorEmail,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Colors.indigo,
                                  ),
                                ),
                                subtitle: Text(
                                  c.content,
                                  style: const TextStyle(fontSize: 13),
                                ),
                              );
                            },
                          ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: commentController,
                          decoration: const InputDecoration(
                            hintText: 'Type a question or comment...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        icon: const Icon(Icons.send, color: Colors.indigo),
                        onPressed: () async {
                          final text = commentController.text.trim();
                          if (text.isEmpty) return;

                          await client.helpRequest.addComment(
                            requestId: req.id!,
                            content: text,
                            authorEmail: 'user@helphub.com',
                          );

                          commentController.clear();
                          await fetchComments(setModalState);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _showCreateRequestDialog() async {
    final titleController = TextEditingController();
    final locationController = TextEditingController();
    final pointsController = TextEditingController(text: '25');
    final descriptionController = TextEditingController();

    String category = 'Borrow Item';
    String urgency = 'Normal';

    return showDialog(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: const Text(
                'Post a Help Request',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        labelText: 'Title',
                        hintText: 'e.g. Borrow a ladder',
                      ),
                    ),
                    const SizedBox(height: 12),
                    DropdownButtonFormField<String>(
                      initialValue: category,
                      decoration: const InputDecoration(labelText: 'Category'),
                      items: _categories
                          .where((c) => c != 'All')
                          .map(
                            (c) => DropdownMenuItem(value: c, child: Text(c)),
                          )
                          .toList(),
                      onChanged: (val) {
                        if (val != null) setDialogState(() => category = val);
                      },
                    ),
                    const SizedBox(height: 12),
                    DropdownButtonFormField<String>(
                      initialValue: urgency,
                      decoration: const InputDecoration(labelText: 'Urgency'),
                      items: const [
                        DropdownMenuItem(
                          value: 'Normal',
                          child: Text('Normal'),
                        ),
                        DropdownMenuItem(
                          value: 'Urgent',
                          child: Text('⚡ Urgent'),
                        ),
                        DropdownMenuItem(value: 'Low', child: Text('Low')),
                      ],
                      onChanged: (val) {
                        if (val != null) setDialogState(() => urgency = val);
                      },
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: locationController,
                      decoration: const InputDecoration(
                        labelText: 'Location',
                        hintText: 'e.g. Dorm A, Room 101',
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: pointsController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Reward Points',
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: descriptionController,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        labelText: 'Description',
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(dialogContext),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () async {
                    if (titleController.text.trim().isEmpty ||
                        locationController.text.trim().isEmpty) {
                      return;
                    }

                    final points =
                        int.tryParse(pointsController.text.trim()) ?? 25;

                    await client.helpRequest.createHelpRequest(
                      title: titleController.text.trim(),
                      description: descriptionController.text.trim(),
                      category: category,
                      location: locationController.text.trim(),
                      urgency: urgency,
                      rewardPoints: points,
                      creatorEmail: 'user@helphub.com',
                    );

                    if (dialogContext.mounted) {
                      Navigator.pop(dialogContext);
                    }
                    _loadData();
                  },
                  child: const Text('Post'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.handshake_outlined, color: Colors.indigoAccent),
            SizedBox(width: 8),
            Text('HelpHub', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadData,
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _loadData,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Profile Header Card
              if (_profile != null) ...[
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.indigo.shade100,
                          child: Text(
                            _profile!.displayName.isNotEmpty
                                ? _profile!.displayName[0].toUpperCase()
                                : '👤',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.indigo,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _profile!.displayName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                _profile!.avatarBadge,
                                style: const TextStyle(
                                  color: Colors.indigo,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '🪙 ${_profile!.points} pts',
                              style: const TextStyle(
                                color: Colors.amber,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              '${_profile!.completedCount} done • ${_profile!.requestedCount} requested',
                              style: const TextStyle(
                                fontSize: 11,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],

              // Leaderboard Card
              if (_leaderboard.isNotEmpty) ...[
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.indigo.shade900.withAlpha(20),
                        Colors.purple.shade900.withAlpha(20),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.indigo.shade100),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Text('🏆 ', style: TextStyle(fontSize: 18)),
                          Text(
                            'Top Community Helpers',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 70,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _leaderboard.length,
                          itemBuilder: (context, index) {
                            final user = _leaderboard[index];
                            return Container(
                              margin: const EdgeInsets.only(right: 8),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: isDark
                                    ? Colors.grey.shade900
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    '#${index + 1} ',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.amber,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        user.displayName,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                      Text(
                                        '${user.points} pts',
                                        style: const TextStyle(
                                          fontSize: 10,
                                          color: Colors.indigo,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],

              // Filter Bar
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search requests...',
                        prefixIcon: const Icon(Icons.search, size: 20),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 12,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onChanged: (val) {
                        _searchQuery = val;
                        _loadData();
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  DropdownButton<String>(
                    value: _selectedCategory,
                    underline: const SizedBox(),
                    items: _categories
                        .map(
                          (c) => DropdownMenuItem(
                            value: c,
                            child: Text(
                              c,
                              style: const TextStyle(fontSize: 12),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (val) {
                      if (val != null) {
                        setState(() => _selectedCategory = val);
                        _loadData();
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Status Selector Chips
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _statuses.map((status) {
                    final isSelected = _selectedStatus == status;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ChoiceChip(
                        label: Text(status),
                        selected: isSelected,
                        selectedColor: Colors.indigo,
                        labelStyle: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : (isDark ? Colors.white70 : Colors.black87),
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                        onSelected: (selected) {
                          if (selected) {
                            setState(() => _selectedStatus = status);
                            _loadData();
                          }
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 16),

              // Request Cards List
              if (_isLoading)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(32),
                    child: CircularProgressIndicator(),
                  ),
                )
              else if (_requests.isEmpty)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(32),
                    child: Column(
                      children: [
                        Icon(Icons.search_off, size: 48, color: Colors.grey),
                        SizedBox(height: 8),
                        Text(
                          'No help requests found.',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                )
              else
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _requests.length,
                  itemBuilder: (context, index) {
                    final req = _requests[index];
                    return _buildRequestCard(req);
                  },
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.indigo,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          'Post Request',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        onPressed: _showCreateRequestDialog,
      ),
    );
  }

  Widget _buildRequestCard(HelpRequest req) {
    Color urgencyColor = Colors.orange;
    if (req.urgency == 'Urgent') urgencyColor = Colors.red;
    if (req.urgency == 'Low') urgencyColor = Colors.grey;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  label: Text(
                    req.category,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                  backgroundColor: Colors.indigo.shade50,
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: urgencyColor.withAlpha(30),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        req.urgency,
                        style: TextStyle(
                          color: urgencyColor,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.withAlpha(30),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        req.status,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              req.title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  size: 14,
                  color: Colors.grey,
                ),
                const SizedBox(width: 4),
                Text(
                  req.location,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              req.description,
              style: const TextStyle(fontSize: 13),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            TextButton.icon(
              icon: const Icon(Icons.chat_bubble_outline, size: 16),
              label: const Text(
                'Comments / Q&A',
                style: TextStyle(fontSize: 12),
              ),
              onPressed: () => _showCommentsBottomSheet(req),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '🪙 +${req.rewardPoints} pts',
                  style: const TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (req.status == 'Open')
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      foregroundColor: Colors.white,
                      visualDensity: VisualDensity.compact,
                    ),
                    onPressed: () async {
                      await client.helpRequest.claimHelpRequest(
                        requestId: req.id!,
                        helperEmail: 'helper@helphub.com',
                      );
                      _loadData();
                    },
                    child: const Text('Claim'),
                  )
                else if (req.status == 'In Progress')
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                      visualDensity: VisualDensity.compact,
                    ),
                    onPressed: () async {
                      await client.helpRequest.completeHelpRequest(
                        requestId: req.id!,
                      );
                      _loadData();
                    },
                    child: const Text('Complete'),
                  )
                else
                  const Text(
                    'Completed ✓',
                    style: TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
