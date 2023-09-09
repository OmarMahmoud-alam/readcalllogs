part of 'logcontrol_cubit.dart';

@immutable
sealed class LogcontrolState {}

final class LogcontrolInitial extends LogcontrolState {}

final class SucessGetAllLogstate extends LogcontrolState {}

final class TryGetAllLogstate extends LogcontrolState {}
