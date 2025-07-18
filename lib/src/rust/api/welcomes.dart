// This file is automatically generated, so please do not edit it.
// @generated by `flutter_rust_bridge`@ 2.11.1.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

import '../api.dart';
import '../frb_generated.dart';
import 'accounts.dart';

// These function are ignored because they are on traits that is not defined in current crate (put an empty `#[frb]` on it to unignore): `clone`, `clone`, `fmt`, `fmt`

Future<WelcomeData> convertWelcomeToData({required Welcome welcome}) =>
    RustLib.instance.api.crateApiWelcomesConvertWelcomeToData(welcome: welcome);

/// Fetches all welcome invitations for a given public key.
///
/// Welcome invitations are group membership invitations that have been sent to the user
/// but may not yet have been processed (accepted, declined, or ignored).
///
/// # Arguments
///
/// * `pubkey` - The public key of the account to fetch welcomes for
///
/// # Returns
///
/// Returns a `Result` containing:
/// * `Ok(Vec<WelcomeData>)` - A vector of welcome invitation data if successful
/// * `Err(WhitenoiseError)` - An error if the operation fails
///
/// # Errors
///
/// This function will return an error if:
/// * The Whitenoise instance cannot be retrieved
/// * The network request to fetch welcomes fails
/// * The account associated with the public key is not found
Future<List<WelcomeData>> fetchWelcomes({required PublicKey pubkey}) =>
    RustLib.instance.api.crateApiWelcomesFetchWelcomes(pubkey: pubkey);

/// Fetches a specific welcome invitation by its event ID.
///
/// This method retrieves detailed information about a single welcome invitation,
/// including group details, admin information, and current state.
///
/// # Arguments
///
/// * `pubkey` - The public key of the account that received the welcome
/// * `welcome_event_id` - The unique event ID of the welcome invitation to fetch
///
/// # Returns
///
/// Returns a `Result` containing:
/// * `Ok(WelcomeData)` - The welcome invitation data if found
/// * `Err(WhitenoiseError)` - An error if the operation fails
///
/// # Errors
///
/// This function will return an error if:
/// * The Whitenoise instance cannot be retrieved
/// * The welcome with the specified event ID is not found
/// * The account associated with the public key is not found
/// * Network connectivity issues occur
Future<WelcomeData> fetchWelcome({
  required PublicKey pubkey,
  required String welcomeEventId,
}) => RustLib.instance.api.crateApiWelcomesFetchWelcome(
  pubkey: pubkey,
  welcomeEventId: welcomeEventId,
);

/// Accepts a group welcome invitation.
///
/// This method processes a welcome invitation by accepting it, which typically involves:
/// * Joining the MLS group
/// * Updating the welcome state to "Accepted"
/// * Synchronizing with the group's message history
///
/// # Arguments
///
/// * `pubkey` - The public key of the account accepting the welcome
/// * `welcome_event_id` - The unique event ID of the welcome invitation to accept
///
/// # Returns
///
/// Returns a `Result` containing:
/// * `Ok(())` - Success indicator if the welcome was accepted
/// * `Err(WhitenoiseError)` - An error if the operation fails
///
/// # Errors
///
/// This function will return an error if:
/// * The Whitenoise instance cannot be retrieved
/// * The account associated with the public key is not found
/// * The welcome with the specified event ID is not found
/// * The welcome has already been processed (accepted/declined)
/// * MLS group joining fails
/// * Network connectivity issues occur
Future<void> acceptWelcome({
  required PublicKey pubkey,
  required String welcomeEventId,
}) => RustLib.instance.api.crateApiWelcomesAcceptWelcome(
  pubkey: pubkey,
  welcomeEventId: welcomeEventId,
);

/// Declines a group welcome invitation.
///
/// This method processes a welcome invitation by declining it, which:
/// * Updates the welcome state to "Declined"
/// * Prevents the user from joining the associated group
/// * May send a decline notification to the group admin (implementation dependent)
///
/// # Arguments
///
/// * `pubkey` - The public key of the account declining the welcome
/// * `welcome_event_id` - The unique event ID of the welcome invitation to decline
///
/// # Returns
///
/// Returns a `Result` containing:
/// * `Ok(())` - Success indicator if the welcome was declined
/// * `Err(WhitenoiseError)` - An error if the operation fails
///
/// # Errors
///
/// This function will return an error if:
/// * The Whitenoise instance cannot be retrieved
/// * The account associated with the public key is not found
/// * The welcome with the specified event ID is not found
/// * The welcome has already been processed (accepted/declined)
/// * Network connectivity issues occur
Future<void> declineWelcome({
  required PublicKey pubkey,
  required String welcomeEventId,
}) => RustLib.instance.api.crateApiWelcomesDeclineWelcome(
  pubkey: pubkey,
  welcomeEventId: welcomeEventId,
);

// Rust type: RustOpaqueMoi<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<Welcome>>
abstract class Welcome implements RustOpaqueInterface {}

class WelcomeData {
  final String id;
  final String mlsGroupId;
  final String nostrGroupId;
  final String groupName;
  final String groupDescription;
  final List<String> groupAdminPubkeys;
  final List<String> groupRelays;
  final String welcomer;
  final int memberCount;
  final WelcomeState state;
  final BigInt createdAt;

  const WelcomeData({
    required this.id,
    required this.mlsGroupId,
    required this.nostrGroupId,
    required this.groupName,
    required this.groupDescription,
    required this.groupAdminPubkeys,
    required this.groupRelays,
    required this.welcomer,
    required this.memberCount,
    required this.state,
    required this.createdAt,
  });

  @override
  int get hashCode =>
      id.hashCode ^
      mlsGroupId.hashCode ^
      nostrGroupId.hashCode ^
      groupName.hashCode ^
      groupDescription.hashCode ^
      groupAdminPubkeys.hashCode ^
      groupRelays.hashCode ^
      welcomer.hashCode ^
      memberCount.hashCode ^
      state.hashCode ^
      createdAt.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WelcomeData &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          mlsGroupId == other.mlsGroupId &&
          nostrGroupId == other.nostrGroupId &&
          groupName == other.groupName &&
          groupDescription == other.groupDescription &&
          groupAdminPubkeys == other.groupAdminPubkeys &&
          groupRelays == other.groupRelays &&
          welcomer == other.welcomer &&
          memberCount == other.memberCount &&
          state == other.state &&
          createdAt == other.createdAt;
}

enum WelcomeState {
  pending,
  accepted,
  declined,
  ignored,
}
