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
  List<CommunityAnnouncement> _announcements = [];
  List<UserNotification> _notifications = [];
  List<UserNotification> _activityStream = [];
  Map<String, int> _communityStats = {};
  UserProfile? _profile;
  bool _isLoading = true;

  String _selectedCategory = 'All';
  String _selectedStatus = 'All';
  String _selectedZone = 'All';
  String _selectedSort = 'newest';
  String _selectedActivityMode = 'all'; // 'all', 'posted', 'claimed', 'saved'
  String _searchQuery = '';
  bool _emergencyOnly = false;

  final _searchController = TextEditingController();

  final List<String> _categories = [
    'All',
    'Borrow Item',
    'Errand & Delivery',
    'Tutoring & Study',
    'Pet & Plant Care',
    'Tech & Rides',
  ];

  final List<String> _zones = [
    'All',
    'North Campus',
    'South Quad',
    'West Village',
    'Downtown East',
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

  String _getUserEmail() {
    return 'user@helphub.com';
  }

  void _resetFilters() {
    setState(() {
      _selectedCategory = 'All';
      _selectedStatus = 'All';
      _selectedZone = 'All';
      _selectedSort = 'newest';
      _selectedActivityMode = 'all';
      _searchQuery = '';
      _emergencyOnly = false;
      _searchController.clear();
    });
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    try {
      final userEmail = _getUserEmail();

      final requests = await client.helpRequest.getHelpRequests(
        category: _selectedCategory,
        status: _selectedStatus,
        neighborhoodZone: _selectedZone,
        isEmergency: _emergencyOnly ? true : null,
        searchQuery: _searchQuery,
        sortBy: _selectedSort,
        myEmailFilter: _selectedActivityMode != 'all' ? userEmail : null,
        myActivityMode: _selectedActivityMode != 'all' ? _selectedActivityMode : null,
      );

      final profile = await client.helpRequest.getUserProfile(email: userEmail);
      final leaderboard = await client.helpRequest.getLeaderboard();
      final announcements = await client.helpRequest.getAnnouncements();
      final notifications = await client.helpRequest.getUserNotifications(userEmail: userEmail);
      final stats = await client.helpRequest.getCommunityStats();
      final activityStream = await client.helpRequest.getCommunityActivityStream();

      setState(() {
        _requests = requests;
        _profile = profile;
        _leaderboard = leaderboard;
        _announcements = announcements;
        _notifications = notifications;
        _communityStats = stats;
        _activityStream = activityStream;
        _isLoading = false;
      });
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _showChatBottomSheet(HelpRequest req) async {
    final chatMsgController = TextEditingController();
    List<FavorChatMessage> messages = [];
    bool isLoadingChat = true;

    Future<void> fetchMessages(StateSetter setModalState) async {
      setModalState(() => isLoadingChat = true);
      try {
        final result = await client.helpRequest.getChatMessages(requestId: req.id!);
        setModalState(() {
          messages = result;
          isLoadingChat = false;
        });
      } catch (e) {
        setModalState(() => isLoadingChat = false);
      }
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (bottomCtx) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            if (isLoadingChat) {
              fetchMessages(setModalState);
            }

            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(bottomCtx).viewInsets.bottom,
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
                        '💬 Direct Chat: ${req.title}',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(bottomCtx),
                      ),
                    ],
                  ),
                  const Divider(),
                  SizedBox(
                    height: 250,
                    child: isLoadingChat
                        ? const Center(child: CircularProgressIndicator())
                        : messages.isEmpty
                            ? const Center(child: Text('No messages yet. Coordinate details here!'))
                            : ListView.builder(
                                itemCount: messages.length,
                                itemBuilder: (context, index) {
                                  final m = messages[index];
                                  final isMe = m.senderEmail == _getUserEmail();
                                  return Align(
                                    alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                                    child: Container(
                                      margin: const EdgeInsets.only(bottom: 8),
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                      decoration: BoxDecoration(
                                        color: isMe ? Colors.indigo.shade600 : Colors.grey.shade200,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Column(
                                        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                                        children: [
                                          Text(m.senderEmail, style: TextStyle(fontSize: 10, color: isMe ? Colors.white70 : Colors.black54, fontWeight: FontWeight.bold)),
                                          const SizedBox(height: 2),
                                          Text(m.message, style: TextStyle(fontSize: 13, color: isMe ? Colors.white : Colors.black87)),
                                        ],
                                      ),
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
                          controller: chatMsgController,
                          decoration: const InputDecoration(
                            hintText: 'Type a message...',
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        icon: const Icon(Icons.send, color: Colors.indigo),
                        onPressed: () async {
                          final text = chatMsgController.text.trim();
                          if (text.isEmpty) return;

                          await client.helpRequest.sendChatMessage(
                            requestId: req.id!,
                            message: text,
                            senderEmail: _getUserEmail(),
                          );

                          chatMsgController.clear();
                          await fetchMessages(setModalState);
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

  Future<void> _showCompletionProofDialog(HelpRequest req) async {
    final noteController = TextEditingController();

    return showDialog(
      context: context,
      builder: (dialogCtx) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Row(
            children: [
              Text('🎉 ', style: TextStyle(fontSize: 22)),
              Text('Complete Favor', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Add an optional completion note or proof detail:'),
              const SizedBox(height: 12),
              TextField(
                controller: noteController,
                maxLines: 2,
                decoration: const InputDecoration(
                  labelText: 'Proof Note / Comments',
                  hintText: 'e.g. Left items at reception desk!',
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogCtx),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal, foregroundColor: Colors.white),
              onPressed: () async {
                final note = noteController.text.trim();
                await client.helpRequest.completeHelpRequestWithProof(
                  requestId: req.id!,
                  proofNote: note.isNotEmpty ? note : 'Favor completed successfully.',
                );
                if (mounted && dialogCtx.mounted) {
                  Navigator.pop(dialogCtx);
                }
                _loadData();
              },
              child: const Text('Confirm Completion'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showSOSBroadcastDialog() async {
    final titleController = TextEditingController();
    final locationController = TextEditingController();
    final descController = TextEditingController();

    return showDialog(
      context: context,
      builder: (dialogCtx) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: const BorderSide(color: Colors.redAccent, width: 2)),
          title: const Row(
            children: [
              Text('🚨 ', style: TextStyle(fontSize: 22)),
              Text('Broadcast Emergency SOS', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.redAccent, fontSize: 16)),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Immediately notifies available top helpers nearby.', style: TextStyle(fontSize: 12)),
              const SizedBox(height: 12),
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Emergency Title', hintText: 'e.g. Dead car battery at Lot C'),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: locationController,
                decoration: const InputDecoration(labelText: 'Location', hintText: 'e.g. Parking Lot C, Slot 12'),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: descController,
                maxLines: 2,
                decoration: const InputDecoration(labelText: 'Details'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogCtx),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent, foregroundColor: Colors.white),
              onPressed: () async {
                if (titleController.text.trim().isEmpty || locationController.text.trim().isEmpty) return;

                await client.helpRequest.broadcastEmergencySOS(
                  title: titleController.text.trim(),
                  description: descController.text.trim(),
                  location: locationController.text.trim(),
                  creatorEmail: _getUserEmail(),
                );

                if (mounted && dialogCtx.mounted) {
                  Navigator.pop(dialogCtx);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('⚡ Emergency SOS Broadcast Dispatched!')),
                  );
                }
                _loadData();
              },
              child: const Text('DISPATCH SOS'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showEditProfileDialog() async {
    if (_profile == null) return;

    final nameController = TextEditingController(text: _profile!.displayName);
    final skillsController = TextEditingController(text: _profile!.skills ?? 'General');

    return showDialog(
      context: context,
      builder: (dialogCtx) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text('Edit Profile & Skills', style: TextStyle(fontWeight: FontWeight.bold)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Display Name',
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: skillsController,
                decoration: const InputDecoration(
                  labelText: 'Skills / Specialties (comma separated)',
                  hintText: 'e.g. Errands, Tutoring, Tech',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogCtx),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo, foregroundColor: Colors.white),
              onPressed: () async {
                await client.helpRequest.updateUserProfile(
                  email: _getUserEmail(),
                  displayName: nameController.text.trim(),
                  skills: skillsController.text.trim(),
                );
                if (dialogCtx.mounted) {
                  Navigator.pop(dialogCtx);
                }
                _loadData();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showNotificationsBottomSheet() async {
    final unreadList = _notifications.where((n) => !n.isRead).toList();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(ctx).viewInsets.bottom,
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
                  const Row(
                    children: [
                      Icon(Icons.notifications_active, color: Colors.indigo),
                      SizedBox(width: 8),
                      Text(
                        'Notifications Feed',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(ctx),
                  ),
                ],
              ),
              const Divider(),
              SizedBox(
                height: 280,
                child: _notifications.isEmpty
                    ? const Center(child: Text('No notifications yet.'))
                    : ListView.builder(
                        itemCount: _notifications.length,
                        itemBuilder: (context, index) {
                          final n = _notifications[index];
                          return Card(
                            elevation: n.isRead ? 0 : 1,
                            color: n.isRead ? Colors.grey.shade50 : Colors.indigo.shade50,
                            margin: const EdgeInsets.only(bottom: 8),
                            child: ListTile(
                              dense: true,
                              title: Text(
                                n.title,
                                style: TextStyle(
                                  fontWeight: n.isRead ? FontWeight.normal : FontWeight.bold,
                                  color: Colors.indigo.shade900,
                                ),
                              ),
                              subtitle: Text(n.message, style: const TextStyle(fontSize: 12)),
                            ),
                          );
                        },
                      ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        );
      },
    );

    for (final notif in unreadList) {
      if (notif.id != null) {
        await client.helpRequest.markNotificationRead(notificationId: notif.id!);
      }
    }
    _loadData();
  }

  Future<void> _showRatingDialog(int requestId, int helperUserId) async {
    int rating = 5;
    final feedbackController = TextEditingController();

    return showDialog(
      context: context,
      builder: (dialogCtx) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              title: const Row(
                children: [
                  Icon(Icons.star, color: Colors.amber),
                  SizedBox(width: 8),
                  Text('Rate Helper', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('How was your helper\'s performance?', style: TextStyle(fontSize: 12)),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      final starNum = index + 1;
                      return IconButton(
                        icon: Icon(
                          starNum <= rating ? Icons.star : Icons.star_border,
                          color: Colors.amber,
                          size: 32,
                        ),
                        onPressed: () => setDialogState(() => rating = starNum),
                      );
                    }),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: feedbackController,
                    decoration: const InputDecoration(
                      labelText: 'Feedback / Comment',
                      hintText: 'e.g. Prompt, friendly and very helpful!',
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(dialogCtx),
                  child: const Text('Skip'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo, foregroundColor: Colors.white),
                  onPressed: () async {
                    await client.helpRequest.submitRating(
                      requestId: requestId,
                      toUserId: helperUserId,
                      rating: rating,
                      feedback: feedbackController.text.trim(),
                    );
                    if (mounted && dialogCtx.mounted) {
                      Navigator.pop(dialogCtx);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Rating submitted! Thank you ⭐')),
                      );
                    }
                    _loadData();
                  },
                  child: const Text('Submit'),
                ),
              ],
            );
          },
        );
      },
    );
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
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                            ? const Center(child: Text('No comments yet. Be the first to ask!'))
                            : ListView.builder(
                                itemCount: comments.length,
                                itemBuilder: (context, index) {
                                  final c = comments[index];
                                  return ListTile(
                                    dense: true,
                                    title: Text(c.authorEmail, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.indigo)),
                                    subtitle: Text(c.content, style: const TextStyle(fontSize: 13)),
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
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
                            authorEmail: _getUserEmail(),
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
    String zone = 'North Campus';
    String duration = '15-30 mins';
    bool isEmergency = false;

    return showDialog(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
                          .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                          .toList(),
                      onChanged: (val) {
                        if (val != null) setDialogState(() => category = val);
                      },
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            initialValue: zone,
                            decoration: const InputDecoration(labelText: 'Zone'),
                            items: _zones
                                .where((z) => z != 'All')
                                .map((z) => DropdownMenuItem(value: z, child: Text(z, style: const TextStyle(fontSize: 12))))
                                .toList(),
                            onChanged: (val) {
                              if (val != null) setDialogState(() => zone = val);
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            initialValue: duration,
                            decoration: const InputDecoration(labelText: 'Est. Duration'),
                            items: const [
                              DropdownMenuItem(value: '15-30 mins', child: Text('15-30 mins', style: TextStyle(fontSize: 12))),
                              DropdownMenuItem(value: '1 hour', child: Text('1 hour', style: TextStyle(fontSize: 12))),
                              DropdownMenuItem(value: '2+ hours', child: Text('2+ hours', style: TextStyle(fontSize: 12))),
                            ],
                            onChanged: (val) {
                              if (val != null) setDialogState(() => duration = val);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    DropdownButtonFormField<String>(
                      initialValue: urgency,
                      decoration: const InputDecoration(labelText: 'Urgency'),
                      items: const [
                        DropdownMenuItem(value: 'Normal', child: Text('Normal')),
                        DropdownMenuItem(value: 'Urgent', child: Text('⚡ Urgent')),
                        DropdownMenuItem(value: 'Low', child: Text('Low')),
                      ],
                      onChanged: (val) {
                        if (val != null) {
                          setDialogState(() {
                            urgency = val;
                            if (val == 'Urgent') isEmergency = true;
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 8),
                    SwitchListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      title: const Text('⚡ SOS Emergency Mode', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.redAccent)),
                      value: isEmergency,
                      onChanged: (val) => setDialogState(() => isEmergency = val),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: locationController,
                      decoration: const InputDecoration(
                        labelText: 'Location Detail',
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
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () async {
                    if (titleController.text.trim().isEmpty ||
                        locationController.text.trim().isEmpty) {
                      return;
                    }

                    final points = int.tryParse(pointsController.text.trim()) ?? 25;

                    await client.helpRequest.createHelpRequest(
                      title: titleController.text.trim(),
                      description: descriptionController.text.trim(),
                      category: category,
                      location: locationController.text.trim(),
                      urgency: urgency,
                      rewardPoints: points,
                      isEmergency: isEmergency,
                      creatorEmail: _getUserEmail(),
                      neighborhoodZone: zone,
                      estimatedDuration: duration,
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
    final unreadNotifsCount = _notifications.where((n) => !n.isRead).length;

    int targetMilestone = 5;
    if ((_profile?.completedCount ?? 0) >= 10) {
      targetMilestone = 25;
    } else if ((_profile?.completedCount ?? 0) >= 5) {
      targetMilestone = 10;
    }
    final milestonePct = (((_profile?.completedCount ?? 0) / targetMilestone)).clamp(0.05, 1.0);

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
            icon: const Icon(Icons.warning_amber_rounded, color: Colors.redAccent),
            tooltip: 'Dispatch Emergency SOS',
            onPressed: _showSOSBroadcastDialog,
          ),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_outlined),
                onPressed: _showNotificationsBottomSheet,
              ),
              if (unreadNotifsCount > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.redAccent,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '$unreadNotifsCount',
                      style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
            ],
          ),
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
              // Community Stats Banner Card
              if (_communityStats.isNotEmpty) ...[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: isDark ? Colors.indigo.shade900.withAlpha(100) : Colors.indigo.shade50,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.indigo.shade100),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStatItem('Open', '${_communityStats['openCount'] ?? 0}', Colors.teal),
                      _buildStatItem('In Progress', '${_communityStats['inProgressCount'] ?? 0}', Colors.amber.shade800),
                      _buildStatItem('Completed', '${_communityStats['completedCount'] ?? 0}', Colors.indigo),
                      _buildStatItem('Pts Exchanged', '${_communityStats['totalPointsAwarded'] ?? 0}', Colors.amber),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
              ],

              // Community Announcement Card
              if (_announcements.isNotEmpty) ...[
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.indigo.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.indigo.shade100),
                  ),
                  child: Row(
                    children: [
                      const Text('📢 ', style: TextStyle(fontSize: 20)),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(_announcements.first.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.indigo)),
                            Text(_announcements.first.content, style: const TextStyle(fontSize: 11, color: Colors.black87), maxLines: 2, overflow: TextOverflow.ellipsis),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
              ],

              // User Profile Header Card
              if (_profile != null) ...[
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 24,
                              backgroundColor: Colors.indigo.shade100,
                              child: Text(
                                _profile!.displayName.isNotEmpty
                                    ? _profile!.displayName[0].toUpperCase()
                                    : '👤',
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.indigo),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        _profile!.displayName,
                                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                      ),
                                      const SizedBox(width: 6),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                        decoration: BoxDecoration(
                                          color: Colors.amber.shade50,
                                          borderRadius: BorderRadius.circular(6),
                                          border: Border.all(color: Colors.amber.shade300),
                                        ),
                                        child: Text(
                                          '⭐ ${(_profile!.ratingAverage ?? 5.0).toStringAsFixed(1)}',
                                          style: const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 10),
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      InkWell(
                                        onTap: _showEditProfileDialog,
                                        child: const Icon(Icons.edit_outlined, size: 16, color: Colors.indigo),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    _profile!.avatarBadge,
                                    style: const TextStyle(color: Colors.indigo, fontSize: 12, fontWeight: FontWeight.w600),
                                  ),
                                  if (_profile!.unlockedBadges != null) ...[
                                    const SizedBox(height: 4),
                                    Wrap(
                                      spacing: 4,
                                      children: _profile!.unlockedBadges!.split(',').map((b) {
                                        return Chip(
                                          label: Text(b.trim(), style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: Colors.amber)),
                                          backgroundColor: Colors.amber.shade50,
                                          visualDensity: VisualDensity.compact,
                                          padding: EdgeInsets.zero,
                                        );
                                      }).toList(),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '🪙 ${_profile!.points} pts',
                                  style: const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                                Text(
                                  '${_profile!.completedCount} done • ${_profile!.requestedCount} requested',
                                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Milestone Progress', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.grey)),
                                Text('${_profile!.completedCount} / $targetMilestone Favors', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.indigo)),
                              ],
                            ),
                            const SizedBox(height: 4),
                            LinearProgressIndicator(
                              value: milestonePct,
                              borderRadius: BorderRadius.circular(8),
                              backgroundColor: Colors.grey.shade200,
                              color: Colors.indigo,
                              minHeight: 6,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],

              // Leaderboard & Live Activity Stream Column
              if (_leaderboard.isNotEmpty || _activityStream.isNotEmpty) ...[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (_leaderboard.isNotEmpty)
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.indigo.shade900.withAlpha(20), Colors.purple.shade900.withAlpha(20)],
                            ),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.indigo.shade100),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('🏆 Top Helpers', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                              const SizedBox(height: 6),
                              SizedBox(
                                height: 60,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: _leaderboard.length,
                                  itemBuilder: (context, index) {
                                    final user = _leaderboard[index];
                                    return Container(
                                      margin: const EdgeInsets.only(right: 6),
                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                      decoration: BoxDecoration(
                                        color: isDark ? Colors.grey.shade900 : Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Colors.grey.shade300),
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(user.displayName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
                                          Text('${user.points} pts', style: const TextStyle(fontSize: 9, color: Colors.indigo)),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 16),
              ],

              // Activity Mode Chips (All, My Posted, My Claimed, Saved)
              Row(
                children: [
                  ChoiceChip(
                    label: const Text('🌐 All', style: TextStyle(fontSize: 11)),
                    selected: _selectedActivityMode == 'all',
                    selectedColor: Colors.indigo,
                    labelStyle: TextStyle(color: _selectedActivityMode == 'all' ? Colors.white : Colors.black87),
                    onSelected: (selected) {
                      if (selected) {
                        setState(() => _selectedActivityMode = 'all');
                        _loadData();
                      }
                    },
                  ),
                  const SizedBox(width: 4),
                  ChoiceChip(
                    label: const Text('📝 Posted', style: TextStyle(fontSize: 11)),
                    selected: _selectedActivityMode == 'posted',
                    selectedColor: Colors.indigo,
                    labelStyle: TextStyle(color: _selectedActivityMode == 'posted' ? Colors.white : Colors.black87),
                    onSelected: (selected) {
                      if (selected) {
                        setState(() => _selectedActivityMode = 'posted');
                        _loadData();
                      }
                    },
                  ),
                  const SizedBox(width: 4),
                  ChoiceChip(
                    label: const Text('🤝 Claimed', style: TextStyle(fontSize: 11)),
                    selected: _selectedActivityMode == 'claimed',
                    selectedColor: Colors.indigo,
                    labelStyle: TextStyle(color: _selectedActivityMode == 'claimed' ? Colors.white : Colors.black87),
                    onSelected: (selected) {
                      if (selected) {
                        setState(() => _selectedActivityMode = 'claimed');
                        _loadData();
                      }
                    },
                  ),
                  const SizedBox(width: 4),
                  ChoiceChip(
                    label: const Text('🔖 Saved', style: TextStyle(fontSize: 11)),
                    selected: _selectedActivityMode == 'saved',
                    selectedColor: Colors.indigo,
                    labelStyle: TextStyle(color: _selectedActivityMode == 'saved' ? Colors.white : Colors.black87),
                    onSelected: (selected) {
                      if (selected) {
                        setState(() => _selectedActivityMode = 'saved');
                        _loadData();
                      }
                    },
                  ),
                  const Spacer(),
                  TextButton.icon(
                    icon: const Icon(Icons.refresh, size: 14, color: Colors.redAccent),
                    label: const Text('Reset', style: TextStyle(fontSize: 11, color: Colors.redAccent)),
                    onPressed: _resetFilters,
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Filter & Sort Bar
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search requests...',
                        prefixIcon: const Icon(Icons.search, size: 20),
                        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      onChanged: (val) {
                        _searchQuery = val;
                        _loadData();
                      },
                    ),
                  ),
                  const SizedBox(width: 6),
                  DropdownButton<String>(
                    value: _selectedZone,
                    underline: const SizedBox(),
                    items: _zones.map((z) => DropdownMenuItem(value: z, child: Text(z, style: const TextStyle(fontSize: 11)))).toList(),
                    onChanged: (val) {
                      if (val != null) {
                        setState(() => _selectedZone = val);
                        _loadData();
                      }
                    },
                  ),
                  const SizedBox(width: 6),
                  DropdownButton<String>(
                    value: _selectedSort,
                    underline: const SizedBox(),
                    items: const [
                      DropdownMenuItem(value: 'newest', child: Text('🕒 Newest', style: TextStyle(fontSize: 11))),
                      DropdownMenuItem(value: 'reward', child: Text('🪙 Reward', style: TextStyle(fontSize: 11))),
                      DropdownMenuItem(value: 'upvotes', child: Text('👍 Upvotes', style: TextStyle(fontSize: 11))),
                      DropdownMenuItem(value: 'urgency', child: Text('⚡ Urgency', style: TextStyle(fontSize: 11))),
                    ],
                    onChanged: (val) {
                      if (val != null) {
                        setState(() => _selectedSort = val);
                        _loadData();
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Emergency Mode Toggle & Status Chips
              Row(
                children: [
                  FilterChip(
                    avatar: const Text('⚡'),
                    label: const Text('SOS Emergency Only'),
                    selected: _emergencyOnly,
                    selectedColor: Colors.redAccent,
                    labelStyle: TextStyle(
                      color: _emergencyOnly ? Colors.white : Colors.redAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                    onSelected: (val) {
                      setState(() => _emergencyOnly = val);
                      _loadData();
                    },
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: _statuses.map((status) {
                          final isSelected = _selectedStatus == status;
                          return Padding(
                            padding: const EdgeInsets.only(right: 6),
                            child: ChoiceChip(
                              label: Text(status, style: const TextStyle(fontSize: 11)),
                              selected: isSelected,
                              selectedColor: Colors.indigo,
                              labelStyle: TextStyle(
                                color: isSelected ? Colors.white : (isDark ? Colors.white70 : Colors.black87),
                                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
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
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Request Cards List
              if (_isLoading)
                const Center(child: Padding(padding: EdgeInsets.all(32), child: CircularProgressIndicator()))
              else if (_requests.isEmpty)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(32),
                    child: Column(
                      children: [
                        Icon(Icons.search_off, size: 48, color: Colors.grey),
                        SizedBox(height: 8),
                        Text('No help requests found.', style: TextStyle(fontWeight: FontWeight.bold)),
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
        label: const Text('Post Request', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        onPressed: _showCreateRequestDialog,
      ),
    );
  }

  Widget _buildStatItem(String label, String value, Color color) {
    return Column(
      children: [
        Text(value, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16, color: color)),
        Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildRequestCard(HelpRequest req) {
    Color urgencyColor = Colors.orange;
    if (req.urgency == 'Urgent') urgencyColor = Colors.red;
    if (req.urgency == 'Low') urgencyColor = Colors.grey;

    final zoneName = req.neighborhoodZone ?? 'North Campus';
    final duration = req.estimatedDuration ?? '15-30 mins';
    final upvotes = req.upvotes ?? 0;
    final proofNote = req.completionProofNote ?? '';
    final code = req.shareableCode ?? 'HH-FAVOR';

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
                  label: Text(req.category, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                  backgroundColor: Colors.indigo.shade50,
                ),
                Row(
                  children: [
                    if (req.isEmergency) ...[
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          '⚡ SOS',
                          style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(width: 4),
                    ],
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: urgencyColor.withAlpha(30),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        req.urgency,
                        style: TextStyle(color: urgencyColor, fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.grey.withAlpha(30),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        req.status,
                        style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
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
                const Icon(Icons.location_on_outlined, size: 14, color: Colors.grey),
                const SizedBox(width: 4),
                Text('${req.location} ($zoneName)', style: const TextStyle(fontSize: 11, color: Colors.grey)),
                const SizedBox(width: 8),
                const Icon(Icons.timer_outlined, size: 14, color: Colors.grey),
                const SizedBox(width: 2),
                Text(duration, style: const TextStyle(fontSize: 11, color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              req.description,
              style: const TextStyle(fontSize: 13),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            if (proofNote.isNotEmpty && req.status == 'Completed') ...[
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.teal.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.teal.shade200),
                ),
                child: Text('Proof Note: $proofNote', style: TextStyle(fontSize: 11, color: Colors.teal.shade900, fontWeight: FontWeight.w600)),
              ),
            ],
            const SizedBox(height: 8),
            TextButton.icon(
              icon: const Icon(Icons.chat_bubble_outline, size: 16),
              label: const Text('Comments / Q&A', style: TextStyle(fontSize: 12)),
              onPressed: () => _showCommentsBottomSheet(req),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '🪙 +${req.rewardPoints} pts',
                  style: const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold),
                ),
                if (req.status == 'Open')
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.share_outlined, color: Colors.indigo, size: 20),
                        tooltip: 'Share Favor',
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Favor share code copied: $code 🔗')),
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.bookmark_border, color: Colors.indigo, size: 20),
                        tooltip: 'Save Favor',
                        onPressed: () async {
                          final isAdded = await client.helpRequest.bookmarkHelpRequest(
                            requestId: req.id!,
                            userEmail: _getUserEmail(),
                          );
                          if (mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(isAdded ? 'Favor saved to bookmarks! 🔖' : 'Removed from bookmarks.')),
                            );
                          }
                          _loadData();
                        },
                      ),
                      OutlinedButton.icon(
                        icon: const Icon(Icons.thumb_up_alt_outlined, size: 14, color: Colors.teal),
                        label: Text('$upvotes', style: const TextStyle(fontSize: 11)),
                        style: OutlinedButton.styleFrom(visualDensity: VisualDensity.compact),
                        onPressed: () async {
                          await client.helpRequest.upvoteHelpRequest(requestId: req.id!);
                          _loadData();
                        },
                      ),
                      const SizedBox(width: 4),
                      IconButton(
                        icon: const Icon(Icons.cancel_outlined, color: Colors.redAccent, size: 20),
                        tooltip: 'Cancel Request',
                        onPressed: () async {
                          await client.helpRequest.cancelHelpRequest(requestId: req.id!);
                          _loadData();
                        },
                      ),
                      OutlinedButton.icon(
                        icon: const Icon(Icons.flash_on, size: 14, color: Colors.amber),
                        label: const Text('+10', style: TextStyle(fontSize: 11)),
                        style: OutlinedButton.styleFrom(visualDensity: VisualDensity.compact),
                        onPressed: () async {
                          await client.helpRequest.boostRewardPoints(
                            requestId: req.id!,
                            boostAmount: 10,
                          );
                          _loadData();
                        },
                      ),
                      const SizedBox(width: 6),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,
                          foregroundColor: Colors.white,
                          visualDensity: VisualDensity.compact,
                        ),
                        onPressed: () async {
                          await client.helpRequest.claimHelpRequest(
                            requestId: req.id!,
                            helperEmail: _getUserEmail(),
                          );
                          _loadData();
                        },
                        child: const Text('Claim'),
                      ),
                    ],
                  )
                else if (req.status == 'In Progress')
                  Row(
                    children: [
                      OutlinedButton.icon(
                        icon: const Icon(Icons.message_outlined, size: 14, color: Colors.indigo),
                        label: const Text('Chat', style: TextStyle(fontSize: 11)),
                        style: OutlinedButton.styleFrom(visualDensity: VisualDensity.compact),
                        onPressed: () => _showChatBottomSheet(req),
                      ),
                      const SizedBox(width: 6),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          foregroundColor: Colors.white,
                          visualDensity: VisualDensity.compact,
                        ),
                        onPressed: () => _showCompletionProofDialog(req),
                        child: const Text('Complete'),
                      ),
                    ],
                  )
                else if (req.status == 'Completed')
                  Row(
                    children: [
                      if (req.helperUserId != null) ...[
                        OutlinedButton.icon(
                          icon: const Icon(Icons.star, size: 14, color: Colors.amber),
                          label: const Text('Rate', style: TextStyle(fontSize: 11)),
                          style: OutlinedButton.styleFrom(visualDensity: VisualDensity.compact),
                          onPressed: () => _showRatingDialog(req.id!, req.helperUserId!),
                        ),
                        const SizedBox(width: 4),
                        OutlinedButton.icon(
                          icon: const Icon(Icons.card_giftcard, size: 14),
                          label: const Text('Tip', style: TextStyle(fontSize: 11)),
                          style: OutlinedButton.styleFrom(visualDensity: VisualDensity.compact),
                          onPressed: () async {
                            await client.helpRequest.tipHelper(
                              helperUserId: req.helperUserId!,
                              tipAmount: 15,
                            );
                            if (mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Tipped 15 bonus points to helper! 🎁')),
                              );
                            }
                            _loadData();
                          },
                        ),
                      ],
                      const SizedBox(width: 8),
                      const Text('Completed ✓', style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold, fontSize: 12)),
                    ],
                  )
                else
                  const Text('Cancelled', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 12)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
