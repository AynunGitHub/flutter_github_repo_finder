// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RepositoryModelAdapter extends TypeAdapter<RepositoryModel> {
  @override
  final int typeId = 0;

  @override
  RepositoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RepositoryModel(
      id: fields[0] as int,
      name: fields[1] as String,
      fullName: fields[2] as String,
      description: fields[3] as String?,
      ownerLogin: fields[4] as String,
      ownerAvatarUrl: fields[5] as String,
      stargazersCount: fields[6] as int,
      forksCount: fields[7] as int,
      language: fields[8] as String?,
      updatedAt: fields[9] as DateTime,
      createdAt: fields[10] as DateTime,
      htmlUrl: fields[11] as String,
      watchersCount: fields[12] as int,
      openIssuesCount: fields[13] as int,
      homepage: fields[14] as String?,
      isPrivate: fields[15] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, RepositoryModel obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.fullName)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.ownerLogin)
      ..writeByte(5)
      ..write(obj.ownerAvatarUrl)
      ..writeByte(6)
      ..write(obj.stargazersCount)
      ..writeByte(7)
      ..write(obj.forksCount)
      ..writeByte(8)
      ..write(obj.language)
      ..writeByte(9)
      ..write(obj.updatedAt)
      ..writeByte(10)
      ..write(obj.createdAt)
      ..writeByte(11)
      ..write(obj.htmlUrl)
      ..writeByte(12)
      ..write(obj.watchersCount)
      ..writeByte(13)
      ..write(obj.openIssuesCount)
      ..writeByte(14)
      ..write(obj.homepage)
      ..writeByte(15)
      ..write(obj.isPrivate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RepositoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
