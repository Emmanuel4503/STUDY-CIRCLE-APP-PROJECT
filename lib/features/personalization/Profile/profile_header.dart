import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:studycycle/utils/constants/colors.dart';
import 'package:studycycle/utils/constants/sizes.dart';

class ProfileHeader extends StatefulWidget {
  final String? initialImageUrl;
  final Future<String?> Function(Uint8List imageBytes)? onImageUpload;

  const ProfileHeader({
    super.key,
    this.initialImageUrl,
    this.onImageUpload,
  });

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  static const _defaultProfileImage = 'assets/images/profile_default.jpg';

  Uint8List? _selectedImageBytes;
  String? _imageUrl;
  bool _isUploading = false;

  @override
  void initState() {
    super.initState();
    _imageUrl = widget.initialImageUrl;
  }

  Future<void> _changeProfileImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      withData: true,
    );

    final imageBytes = result?.files.single.bytes;
    if (imageBytes == null || !mounted) return;

    setState(() {
      _selectedImageBytes = imageBytes;
      _isUploading = widget.onImageUpload != null;
    });

    if (widget.onImageUpload == null) return;

    final uploadedImageUrl = await widget.onImageUpload!(imageBytes);
    if (!mounted) return;

    setState(() {
      _isUploading = false;
      if (uploadedImageUrl != null && uploadedImageUrl.isNotEmpty) {
        _imageUrl = uploadedImageUrl;
        _selectedImageBytes = null;
      }
    });
  }

  Widget _buildProfileImage() {
    if (_selectedImageBytes != null) {
      return Image.memory(_selectedImageBytes!, fit: BoxFit.cover);
    }

    if (_imageUrl != null && _imageUrl!.isNotEmpty) {
      return Image.network(
        _imageUrl!,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) =>
            Image.asset(_defaultProfileImage, fit: BoxFit.cover),
      );
    }

    return Image.asset(_defaultProfileImage, fit: BoxFit.cover);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(SSizes.defaultSpace, 12, SSizes.defaultSpace, 18),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            SColors.primary,
            SColors.primaryDark,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(36),
          bottomRight: Radius.circular(36),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'My Profile',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.16),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.verified_rounded, color: Colors.white, size: 15),
                    SizedBox(width: 5),
                    Text(
                      'Member',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: SizedBox(
                        width: 64,
                        height: 64,
                        child: _buildProfileImage(),
                      ),
                    ),
                  ),
                  Positioned(
                    right: -4,
                    bottom: -4,
                    child: Material(
                      color: SColors.primary,
                      shape: const CircleBorder(),
                      child: InkWell(
                        onTap: _isUploading ? null : _changeProfileImage,
                        customBorder: const CircleBorder(),
                        child: Padding(
                          padding: const EdgeInsets.all(7),
                          child: _isUploading
                              ? const SizedBox(
                                  width: 15,
                                  height: 15,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                              : const Icon(Icons.camera_alt_outlined,
                                  color: Colors.white, size: 15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: SSizes.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Feranmi Emmanuel',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'feranmiemmanuel01@gmail.com',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.white.withValues(alpha: 0.78),
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            'Keep your profile current so your circle can recognize you.',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.white.withValues(alpha: 0.82),
                  height: 1.4,
                ),
          ),
        ],
      ),
    );
  }
}
