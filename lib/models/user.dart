import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// A class that represents a user entity.
/// It holds information such as the user's unique
/// identifier, full name, photo, registration date, and online status.
@immutable
class User extends Equatable {
  final String id;
  final String fullName;
  final String photo;
  final String registrationDate;
  final bool isOnline;

  const User({
    required this.id,
    required this.fullName,
    required this.photo,
    required this.registrationDate,
    required this.isOnline,
  });

  User copyWith({
    String? id,
    String? fullName,
    String? photo,
    String? registrationDate,
    bool? isOnline,
  }) {
    return User(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      photo: photo ?? this.photo,
      registrationDate: registrationDate ?? this.registrationDate,
      isOnline: isOnline ?? this.isOnline,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      fullName,
      photo,
      registrationDate,
      isOnline,
    ];
  }
}
