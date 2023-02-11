import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class User extends Equatable {
  final String id;
  final String firstName;
  final String lastName;
  final String photo;
  final String registrationDate;
  final bool isOnline;

  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.photo,
    required this.registrationDate,
    required this.isOnline,
  });

  User copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? photo,
    String? registrationDate,
    bool? isOnline,
  }) {
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      photo: photo ?? this.photo,
      registrationDate: registrationDate ?? this.registrationDate,
      isOnline: isOnline ?? this.isOnline,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      firstName,
      lastName,
      photo,
      registrationDate,
      isOnline,
    ];
  }
}
