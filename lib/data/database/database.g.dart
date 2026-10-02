// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 300,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _tokenMeta = const VerificationMeta('token');
  @override
  late final GeneratedColumn<String> token = GeneratedColumn<String>(
    'token',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _passwordHashMeta = const VerificationMeta(
    'passwordHash',
  );
  @override
  late final GeneratedColumn<String> passwordHash = GeneratedColumn<String>(
    'password_hash',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<UserFunction, int> function =
      GeneratedColumn<int>(
        'function',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
        defaultValue: Constant(UserFunction.user.index),
      ).withConverter<UserFunction>($UsersTable.$converterfunction);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    email,
    token,
    passwordHash,
    function,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(
    Insertable<User> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('token')) {
      context.handle(
        _tokenMeta,
        token.isAcceptableOrUnknown(data['token']!, _tokenMeta),
      );
    } else if (isInserting) {
      context.missing(_tokenMeta);
    }
    if (data.containsKey('password_hash')) {
      context.handle(
        _passwordHashMeta,
        passwordHash.isAcceptableOrUnknown(
          data['password_hash']!,
          _passwordHashMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_passwordHashMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      token: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}token'],
      )!,
      passwordHash: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}password_hash'],
      )!,
      function: $UsersTable.$converterfunction.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}function'],
        )!,
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<UserFunction, int, int> $converterfunction =
      const EnumIndexConverter<UserFunction>(UserFunction.values);
}

class User extends DataClass implements Insertable<User> {
  final int id;
  final String name;
  final String email;
  final String token;
  final String passwordHash;
  final UserFunction function;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
    required this.passwordHash,
    required this.function,
    this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['email'] = Variable<String>(email);
    map['token'] = Variable<String>(token);
    map['password_hash'] = Variable<String>(passwordHash);
    {
      map['function'] = Variable<int>(
        $UsersTable.$converterfunction.toSql(function),
      );
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      name: Value(name),
      email: Value(email),
      token: Value(token),
      passwordHash: Value(passwordHash),
      function: Value(function),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory User.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String>(json['email']),
      token: serializer.fromJson<String>(json['token']),
      passwordHash: serializer.fromJson<String>(json['passwordHash']),
      function: $UsersTable.$converterfunction.fromJson(
        serializer.fromJson<int>(json['function']),
      ),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String>(email),
      'token': serializer.toJson<String>(token),
      'passwordHash': serializer.toJson<String>(passwordHash),
      'function': serializer.toJson<int>(
        $UsersTable.$converterfunction.toJson(function),
      ),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  User copyWith({
    int? id,
    String? name,
    String? email,
    String? token,
    String? passwordHash,
    UserFunction? function,
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => User(
    id: id ?? this.id,
    name: name ?? this.name,
    email: email ?? this.email,
    token: token ?? this.token,
    passwordHash: passwordHash ?? this.passwordHash,
    function: function ?? this.function,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      email: data.email.present ? data.email.value : this.email,
      token: data.token.present ? data.token.value : this.token,
      passwordHash: data.passwordHash.present
          ? data.passwordHash.value
          : this.passwordHash,
      function: data.function.present ? data.function.value : this.function,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('token: $token, ')
          ..write('passwordHash: $passwordHash, ')
          ..write('function: $function, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    email,
    token,
    passwordHash,
    function,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.name == this.name &&
          other.email == this.email &&
          other.token == this.token &&
          other.passwordHash == this.passwordHash &&
          other.function == this.function &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> email;
  final Value<String> token;
  final Value<String> passwordHash;
  final Value<UserFunction> function;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.token = const Value.absent(),
    this.passwordHash = const Value.absent(),
    this.function = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String email,
    required String token,
    required String passwordHash,
    this.function = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name),
       email = Value(email),
       token = Value(token),
       passwordHash = Value(passwordHash);
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? email,
    Expression<String>? token,
    Expression<String>? passwordHash,
    Expression<int>? function,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (token != null) 'token': token,
      if (passwordHash != null) 'password_hash': passwordHash,
      if (function != null) 'function': function,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  UsersCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? email,
    Value<String>? token,
    Value<String>? passwordHash,
    Value<UserFunction>? function,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
  }) {
    return UsersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      token: token ?? this.token,
      passwordHash: passwordHash ?? this.passwordHash,
      function: function ?? this.function,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (token.present) {
      map['token'] = Variable<String>(token.value);
    }
    if (passwordHash.present) {
      map['password_hash'] = Variable<String>(passwordHash.value);
    }
    if (function.present) {
      map['function'] = Variable<int>(
        $UsersTable.$converterfunction.toSql(function.value),
      );
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('token: $token, ')
          ..write('passwordHash: $passwordHash, ')
          ..write('function: $function, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $FunctionMembersTable extends FunctionMembers
    with TableInfo<$FunctionMembersTable, FunctionMember> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FunctionMembersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descMeta = const VerificationMeta('desc');
  @override
  late final GeneratedColumn<String> desc = GeneratedColumn<String>(
    'desc',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, desc, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'function_members';
  @override
  VerificationContext validateIntegrity(
    Insertable<FunctionMember> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('desc')) {
      context.handle(
        _descMeta,
        desc.isAcceptableOrUnknown(data['desc']!, _descMeta),
      );
    } else if (isInserting) {
      context.missing(_descMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FunctionMember map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FunctionMember(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      desc: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}desc'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $FunctionMembersTable createAlias(String alias) {
    return $FunctionMembersTable(attachedDatabase, alias);
  }
}

class FunctionMember extends DataClass implements Insertable<FunctionMember> {
  final int id;
  final String name;
  final String desc;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  const FunctionMember({
    required this.id,
    required this.name,
    required this.desc,
    this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['desc'] = Variable<String>(desc);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  FunctionMembersCompanion toCompanion(bool nullToAbsent) {
    return FunctionMembersCompanion(
      id: Value(id),
      name: Value(name),
      desc: Value(desc),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory FunctionMember.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FunctionMember(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      desc: serializer.fromJson<String>(json['desc']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'desc': serializer.toJson<String>(desc),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  FunctionMember copyWith({
    int? id,
    String? name,
    String? desc,
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => FunctionMember(
    id: id ?? this.id,
    name: name ?? this.name,
    desc: desc ?? this.desc,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  FunctionMember copyWithCompanion(FunctionMembersCompanion data) {
    return FunctionMember(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      desc: data.desc.present ? data.desc.value : this.desc,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FunctionMember(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('desc: $desc, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, desc, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FunctionMember &&
          other.id == this.id &&
          other.name == this.name &&
          other.desc == this.desc &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class FunctionMembersCompanion extends UpdateCompanion<FunctionMember> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> desc;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  const FunctionMembersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.desc = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  FunctionMembersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String desc,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name),
       desc = Value(desc);
  static Insertable<FunctionMember> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? desc,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (desc != null) 'desc': desc,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  FunctionMembersCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? desc,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
  }) {
    return FunctionMembersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (desc.present) {
      map['desc'] = Variable<String>(desc.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FunctionMembersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('desc: $desc, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $MembersTable extends Members with TableInfo<$MembersTable, Member> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MembersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _birthdateMeta = const VerificationMeta(
    'birthdate',
  );
  @override
  late final GeneratedColumn<DateTime> birthdate = GeneratedColumn<DateTime>(
    'birthdate',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cpfMeta = const VerificationMeta('cpf');
  @override
  late final GeneratedColumn<String> cpf = GeneratedColumn<String>(
    'cpf',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _rgMeta = const VerificationMeta('rg');
  @override
  late final GeneratedColumn<String> rg = GeneratedColumn<String>(
    'rg',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _issuingAgencyMeta = const VerificationMeta(
    'issuingAgency',
  );
  @override
  late final GeneratedColumn<String> issuingAgency = GeneratedColumn<String>(
    'issuing_agency',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _shirtSizeMeta = const VerificationMeta(
    'shirtSize',
  );
  @override
  late final GeneratedColumn<String> shirtSize = GeneratedColumn<String>(
    'shirt_size',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cepMeta = const VerificationMeta('cep');
  @override
  late final GeneratedColumn<String> cep = GeneratedColumn<String>(
    'cep',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _streetMeta = const VerificationMeta('street');
  @override
  late final GeneratedColumn<String> street = GeneratedColumn<String>(
    'street',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<String> number = GeneratedColumn<String>(
    'number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _complementMeta = const VerificationMeta(
    'complement',
  );
  @override
  late final GeneratedColumn<String> complement = GeneratedColumn<String>(
    'complement',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _neighborhoodMeta = const VerificationMeta(
    'neighborhood',
  );
  @override
  late final GeneratedColumn<String> neighborhood = GeneratedColumn<String>(
    'neighborhood',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
    'city',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _stateMeta = const VerificationMeta('state');
  @override
  late final GeneratedColumn<String> state = GeneratedColumn<String>(
    'state',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMotherMeta = const VerificationMeta(
    'nameMother',
  );
  @override
  late final GeneratedColumn<String> nameMother = GeneratedColumn<String>(
    'name_mother',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailMotherMeta = const VerificationMeta(
    'emailMother',
  );
  @override
  late final GeneratedColumn<String> emailMother = GeneratedColumn<String>(
    'email_mother',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _phoneMotherMeta = const VerificationMeta(
    'phoneMother',
  );
  @override
  late final GeneratedColumn<String> phoneMother = GeneratedColumn<String>(
    'phone_mother',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameFatherMeta = const VerificationMeta(
    'nameFather',
  );
  @override
  late final GeneratedColumn<String> nameFather = GeneratedColumn<String>(
    'name_father',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailFatherMeta = const VerificationMeta(
    'emailFather',
  );
  @override
  late final GeneratedColumn<String> emailFather = GeneratedColumn<String>(
    'email_father',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _phoneFatherMeta = const VerificationMeta(
    'phoneFather',
  );
  @override
  late final GeneratedColumn<String> phoneFather = GeneratedColumn<String>(
    'phone_father',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _acceptClubTermMeta = const VerificationMeta(
    'acceptClubTerm',
  );
  @override
  late final GeneratedColumn<bool> acceptClubTerm = GeneratedColumn<bool>(
    'accept_club_term',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("accept_club_term" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _acceptImageTermMeta = const VerificationMeta(
    'acceptImageTerm',
  );
  @override
  late final GeneratedColumn<bool> acceptImageTerm = GeneratedColumn<bool>(
    'accept_image_term',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("accept_image_term" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _clubIdMeta = const VerificationMeta('clubId');
  @override
  late final GeneratedColumn<int> clubId = GeneratedColumn<int>(
    'club_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _functionMemberIdMeta = const VerificationMeta(
    'functionMemberId',
  );
  @override
  late final GeneratedColumn<int> functionMemberId = GeneratedColumn<int>(
    'function_member_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES function_members (id)',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    birthdate,
    cpf,
    rg,
    issuingAgency,
    shirtSize,
    email,
    phone,
    cep,
    street,
    number,
    complement,
    neighborhood,
    city,
    state,
    nameMother,
    emailMother,
    phoneMother,
    nameFather,
    emailFather,
    phoneFather,
    acceptClubTerm,
    acceptImageTerm,
    clubId,
    functionMemberId,
    userId,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'members';
  @override
  VerificationContext validateIntegrity(
    Insertable<Member> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('birthdate')) {
      context.handle(
        _birthdateMeta,
        birthdate.isAcceptableOrUnknown(data['birthdate']!, _birthdateMeta),
      );
    }
    if (data.containsKey('cpf')) {
      context.handle(
        _cpfMeta,
        cpf.isAcceptableOrUnknown(data['cpf']!, _cpfMeta),
      );
    }
    if (data.containsKey('rg')) {
      context.handle(_rgMeta, rg.isAcceptableOrUnknown(data['rg']!, _rgMeta));
    }
    if (data.containsKey('issuing_agency')) {
      context.handle(
        _issuingAgencyMeta,
        issuingAgency.isAcceptableOrUnknown(
          data['issuing_agency']!,
          _issuingAgencyMeta,
        ),
      );
    }
    if (data.containsKey('shirt_size')) {
      context.handle(
        _shirtSizeMeta,
        shirtSize.isAcceptableOrUnknown(data['shirt_size']!, _shirtSizeMeta),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('cep')) {
      context.handle(
        _cepMeta,
        cep.isAcceptableOrUnknown(data['cep']!, _cepMeta),
      );
    }
    if (data.containsKey('street')) {
      context.handle(
        _streetMeta,
        street.isAcceptableOrUnknown(data['street']!, _streetMeta),
      );
    }
    if (data.containsKey('number')) {
      context.handle(
        _numberMeta,
        number.isAcceptableOrUnknown(data['number']!, _numberMeta),
      );
    }
    if (data.containsKey('complement')) {
      context.handle(
        _complementMeta,
        complement.isAcceptableOrUnknown(data['complement']!, _complementMeta),
      );
    }
    if (data.containsKey('neighborhood')) {
      context.handle(
        _neighborhoodMeta,
        neighborhood.isAcceptableOrUnknown(
          data['neighborhood']!,
          _neighborhoodMeta,
        ),
      );
    }
    if (data.containsKey('city')) {
      context.handle(
        _cityMeta,
        city.isAcceptableOrUnknown(data['city']!, _cityMeta),
      );
    }
    if (data.containsKey('state')) {
      context.handle(
        _stateMeta,
        state.isAcceptableOrUnknown(data['state']!, _stateMeta),
      );
    }
    if (data.containsKey('name_mother')) {
      context.handle(
        _nameMotherMeta,
        nameMother.isAcceptableOrUnknown(data['name_mother']!, _nameMotherMeta),
      );
    }
    if (data.containsKey('email_mother')) {
      context.handle(
        _emailMotherMeta,
        emailMother.isAcceptableOrUnknown(
          data['email_mother']!,
          _emailMotherMeta,
        ),
      );
    }
    if (data.containsKey('phone_mother')) {
      context.handle(
        _phoneMotherMeta,
        phoneMother.isAcceptableOrUnknown(
          data['phone_mother']!,
          _phoneMotherMeta,
        ),
      );
    }
    if (data.containsKey('name_father')) {
      context.handle(
        _nameFatherMeta,
        nameFather.isAcceptableOrUnknown(data['name_father']!, _nameFatherMeta),
      );
    }
    if (data.containsKey('email_father')) {
      context.handle(
        _emailFatherMeta,
        emailFather.isAcceptableOrUnknown(
          data['email_father']!,
          _emailFatherMeta,
        ),
      );
    }
    if (data.containsKey('phone_father')) {
      context.handle(
        _phoneFatherMeta,
        phoneFather.isAcceptableOrUnknown(
          data['phone_father']!,
          _phoneFatherMeta,
        ),
      );
    }
    if (data.containsKey('accept_club_term')) {
      context.handle(
        _acceptClubTermMeta,
        acceptClubTerm.isAcceptableOrUnknown(
          data['accept_club_term']!,
          _acceptClubTermMeta,
        ),
      );
    }
    if (data.containsKey('accept_image_term')) {
      context.handle(
        _acceptImageTermMeta,
        acceptImageTerm.isAcceptableOrUnknown(
          data['accept_image_term']!,
          _acceptImageTermMeta,
        ),
      );
    }
    if (data.containsKey('club_id')) {
      context.handle(
        _clubIdMeta,
        clubId.isAcceptableOrUnknown(data['club_id']!, _clubIdMeta),
      );
    }
    if (data.containsKey('function_member_id')) {
      context.handle(
        _functionMemberIdMeta,
        functionMemberId.isAcceptableOrUnknown(
          data['function_member_id']!,
          _functionMemberIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_functionMemberIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Member map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Member(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      birthdate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}birthdate'],
      ),
      cpf: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cpf'],
      ),
      rg: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}rg'],
      ),
      issuingAgency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}issuing_agency'],
      ),
      shirtSize: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}shirt_size'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      cep: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cep'],
      ),
      street: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}street'],
      ),
      number: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}number'],
      ),
      complement: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}complement'],
      ),
      neighborhood: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}neighborhood'],
      ),
      city: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}city'],
      ),
      state: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}state'],
      ),
      nameMother: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_mother'],
      ),
      emailMother: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email_mother'],
      ),
      phoneMother: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone_mother'],
      ),
      nameFather: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_father'],
      ),
      emailFather: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email_father'],
      ),
      phoneFather: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone_father'],
      ),
      acceptClubTerm: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}accept_club_term'],
      )!,
      acceptImageTerm: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}accept_image_term'],
      )!,
      clubId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}club_id'],
      ),
      functionMemberId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}function_member_id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $MembersTable createAlias(String alias) {
    return $MembersTable(attachedDatabase, alias);
  }
}

class Member extends DataClass implements Insertable<Member> {
  final int id;
  final String name;
  final DateTime? birthdate;
  final String? cpf;
  final String? rg;
  final String? issuingAgency;
  final String? shirtSize;
  final String? email;
  final String? phone;
  final String? cep;
  final String? street;
  final String? number;
  final String? complement;
  final String? neighborhood;
  final String? city;
  final String? state;
  final String? nameMother;
  final String? emailMother;
  final String? phoneMother;
  final String? nameFather;
  final String? emailFather;
  final String? phoneFather;
  final bool acceptClubTerm;
  final bool acceptImageTerm;
  final int? clubId;
  final int functionMemberId;
  final int? userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  const Member({
    required this.id,
    required this.name,
    this.birthdate,
    this.cpf,
    this.rg,
    this.issuingAgency,
    this.shirtSize,
    this.email,
    this.phone,
    this.cep,
    this.street,
    this.number,
    this.complement,
    this.neighborhood,
    this.city,
    this.state,
    this.nameMother,
    this.emailMother,
    this.phoneMother,
    this.nameFather,
    this.emailFather,
    this.phoneFather,
    required this.acceptClubTerm,
    required this.acceptImageTerm,
    this.clubId,
    required this.functionMemberId,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || birthdate != null) {
      map['birthdate'] = Variable<DateTime>(birthdate);
    }
    if (!nullToAbsent || cpf != null) {
      map['cpf'] = Variable<String>(cpf);
    }
    if (!nullToAbsent || rg != null) {
      map['rg'] = Variable<String>(rg);
    }
    if (!nullToAbsent || issuingAgency != null) {
      map['issuing_agency'] = Variable<String>(issuingAgency);
    }
    if (!nullToAbsent || shirtSize != null) {
      map['shirt_size'] = Variable<String>(shirtSize);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || cep != null) {
      map['cep'] = Variable<String>(cep);
    }
    if (!nullToAbsent || street != null) {
      map['street'] = Variable<String>(street);
    }
    if (!nullToAbsent || number != null) {
      map['number'] = Variable<String>(number);
    }
    if (!nullToAbsent || complement != null) {
      map['complement'] = Variable<String>(complement);
    }
    if (!nullToAbsent || neighborhood != null) {
      map['neighborhood'] = Variable<String>(neighborhood);
    }
    if (!nullToAbsent || city != null) {
      map['city'] = Variable<String>(city);
    }
    if (!nullToAbsent || state != null) {
      map['state'] = Variable<String>(state);
    }
    if (!nullToAbsent || nameMother != null) {
      map['name_mother'] = Variable<String>(nameMother);
    }
    if (!nullToAbsent || emailMother != null) {
      map['email_mother'] = Variable<String>(emailMother);
    }
    if (!nullToAbsent || phoneMother != null) {
      map['phone_mother'] = Variable<String>(phoneMother);
    }
    if (!nullToAbsent || nameFather != null) {
      map['name_father'] = Variable<String>(nameFather);
    }
    if (!nullToAbsent || emailFather != null) {
      map['email_father'] = Variable<String>(emailFather);
    }
    if (!nullToAbsent || phoneFather != null) {
      map['phone_father'] = Variable<String>(phoneFather);
    }
    map['accept_club_term'] = Variable<bool>(acceptClubTerm);
    map['accept_image_term'] = Variable<bool>(acceptImageTerm);
    if (!nullToAbsent || clubId != null) {
      map['club_id'] = Variable<int>(clubId);
    }
    map['function_member_id'] = Variable<int>(functionMemberId);
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<int>(userId);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  MembersCompanion toCompanion(bool nullToAbsent) {
    return MembersCompanion(
      id: Value(id),
      name: Value(name),
      birthdate: birthdate == null && nullToAbsent
          ? const Value.absent()
          : Value(birthdate),
      cpf: cpf == null && nullToAbsent ? const Value.absent() : Value(cpf),
      rg: rg == null && nullToAbsent ? const Value.absent() : Value(rg),
      issuingAgency: issuingAgency == null && nullToAbsent
          ? const Value.absent()
          : Value(issuingAgency),
      shirtSize: shirtSize == null && nullToAbsent
          ? const Value.absent()
          : Value(shirtSize),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      cep: cep == null && nullToAbsent ? const Value.absent() : Value(cep),
      street: street == null && nullToAbsent
          ? const Value.absent()
          : Value(street),
      number: number == null && nullToAbsent
          ? const Value.absent()
          : Value(number),
      complement: complement == null && nullToAbsent
          ? const Value.absent()
          : Value(complement),
      neighborhood: neighborhood == null && nullToAbsent
          ? const Value.absent()
          : Value(neighborhood),
      city: city == null && nullToAbsent ? const Value.absent() : Value(city),
      state: state == null && nullToAbsent
          ? const Value.absent()
          : Value(state),
      nameMother: nameMother == null && nullToAbsent
          ? const Value.absent()
          : Value(nameMother),
      emailMother: emailMother == null && nullToAbsent
          ? const Value.absent()
          : Value(emailMother),
      phoneMother: phoneMother == null && nullToAbsent
          ? const Value.absent()
          : Value(phoneMother),
      nameFather: nameFather == null && nullToAbsent
          ? const Value.absent()
          : Value(nameFather),
      emailFather: emailFather == null && nullToAbsent
          ? const Value.absent()
          : Value(emailFather),
      phoneFather: phoneFather == null && nullToAbsent
          ? const Value.absent()
          : Value(phoneFather),
      acceptClubTerm: Value(acceptClubTerm),
      acceptImageTerm: Value(acceptImageTerm),
      clubId: clubId == null && nullToAbsent
          ? const Value.absent()
          : Value(clubId),
      functionMemberId: Value(functionMemberId),
      userId: userId == null && nullToAbsent
          ? const Value.absent()
          : Value(userId),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory Member.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Member(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      birthdate: serializer.fromJson<DateTime?>(json['birthdate']),
      cpf: serializer.fromJson<String?>(json['cpf']),
      rg: serializer.fromJson<String?>(json['rg']),
      issuingAgency: serializer.fromJson<String?>(json['issuingAgency']),
      shirtSize: serializer.fromJson<String?>(json['shirtSize']),
      email: serializer.fromJson<String?>(json['email']),
      phone: serializer.fromJson<String?>(json['phone']),
      cep: serializer.fromJson<String?>(json['cep']),
      street: serializer.fromJson<String?>(json['street']),
      number: serializer.fromJson<String?>(json['number']),
      complement: serializer.fromJson<String?>(json['complement']),
      neighborhood: serializer.fromJson<String?>(json['neighborhood']),
      city: serializer.fromJson<String?>(json['city']),
      state: serializer.fromJson<String?>(json['state']),
      nameMother: serializer.fromJson<String?>(json['nameMother']),
      emailMother: serializer.fromJson<String?>(json['emailMother']),
      phoneMother: serializer.fromJson<String?>(json['phoneMother']),
      nameFather: serializer.fromJson<String?>(json['nameFather']),
      emailFather: serializer.fromJson<String?>(json['emailFather']),
      phoneFather: serializer.fromJson<String?>(json['phoneFather']),
      acceptClubTerm: serializer.fromJson<bool>(json['acceptClubTerm']),
      acceptImageTerm: serializer.fromJson<bool>(json['acceptImageTerm']),
      clubId: serializer.fromJson<int?>(json['clubId']),
      functionMemberId: serializer.fromJson<int>(json['functionMemberId']),
      userId: serializer.fromJson<int?>(json['userId']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'birthdate': serializer.toJson<DateTime?>(birthdate),
      'cpf': serializer.toJson<String?>(cpf),
      'rg': serializer.toJson<String?>(rg),
      'issuingAgency': serializer.toJson<String?>(issuingAgency),
      'shirtSize': serializer.toJson<String?>(shirtSize),
      'email': serializer.toJson<String?>(email),
      'phone': serializer.toJson<String?>(phone),
      'cep': serializer.toJson<String?>(cep),
      'street': serializer.toJson<String?>(street),
      'number': serializer.toJson<String?>(number),
      'complement': serializer.toJson<String?>(complement),
      'neighborhood': serializer.toJson<String?>(neighborhood),
      'city': serializer.toJson<String?>(city),
      'state': serializer.toJson<String?>(state),
      'nameMother': serializer.toJson<String?>(nameMother),
      'emailMother': serializer.toJson<String?>(emailMother),
      'phoneMother': serializer.toJson<String?>(phoneMother),
      'nameFather': serializer.toJson<String?>(nameFather),
      'emailFather': serializer.toJson<String?>(emailFather),
      'phoneFather': serializer.toJson<String?>(phoneFather),
      'acceptClubTerm': serializer.toJson<bool>(acceptClubTerm),
      'acceptImageTerm': serializer.toJson<bool>(acceptImageTerm),
      'clubId': serializer.toJson<int?>(clubId),
      'functionMemberId': serializer.toJson<int>(functionMemberId),
      'userId': serializer.toJson<int?>(userId),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  Member copyWith({
    int? id,
    String? name,
    Value<DateTime?> birthdate = const Value.absent(),
    Value<String?> cpf = const Value.absent(),
    Value<String?> rg = const Value.absent(),
    Value<String?> issuingAgency = const Value.absent(),
    Value<String?> shirtSize = const Value.absent(),
    Value<String?> email = const Value.absent(),
    Value<String?> phone = const Value.absent(),
    Value<String?> cep = const Value.absent(),
    Value<String?> street = const Value.absent(),
    Value<String?> number = const Value.absent(),
    Value<String?> complement = const Value.absent(),
    Value<String?> neighborhood = const Value.absent(),
    Value<String?> city = const Value.absent(),
    Value<String?> state = const Value.absent(),
    Value<String?> nameMother = const Value.absent(),
    Value<String?> emailMother = const Value.absent(),
    Value<String?> phoneMother = const Value.absent(),
    Value<String?> nameFather = const Value.absent(),
    Value<String?> emailFather = const Value.absent(),
    Value<String?> phoneFather = const Value.absent(),
    bool? acceptClubTerm,
    bool? acceptImageTerm,
    Value<int?> clubId = const Value.absent(),
    int? functionMemberId,
    Value<int?> userId = const Value.absent(),
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => Member(
    id: id ?? this.id,
    name: name ?? this.name,
    birthdate: birthdate.present ? birthdate.value : this.birthdate,
    cpf: cpf.present ? cpf.value : this.cpf,
    rg: rg.present ? rg.value : this.rg,
    issuingAgency: issuingAgency.present
        ? issuingAgency.value
        : this.issuingAgency,
    shirtSize: shirtSize.present ? shirtSize.value : this.shirtSize,
    email: email.present ? email.value : this.email,
    phone: phone.present ? phone.value : this.phone,
    cep: cep.present ? cep.value : this.cep,
    street: street.present ? street.value : this.street,
    number: number.present ? number.value : this.number,
    complement: complement.present ? complement.value : this.complement,
    neighborhood: neighborhood.present ? neighborhood.value : this.neighborhood,
    city: city.present ? city.value : this.city,
    state: state.present ? state.value : this.state,
    nameMother: nameMother.present ? nameMother.value : this.nameMother,
    emailMother: emailMother.present ? emailMother.value : this.emailMother,
    phoneMother: phoneMother.present ? phoneMother.value : this.phoneMother,
    nameFather: nameFather.present ? nameFather.value : this.nameFather,
    emailFather: emailFather.present ? emailFather.value : this.emailFather,
    phoneFather: phoneFather.present ? phoneFather.value : this.phoneFather,
    acceptClubTerm: acceptClubTerm ?? this.acceptClubTerm,
    acceptImageTerm: acceptImageTerm ?? this.acceptImageTerm,
    clubId: clubId.present ? clubId.value : this.clubId,
    functionMemberId: functionMemberId ?? this.functionMemberId,
    userId: userId.present ? userId.value : this.userId,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  Member copyWithCompanion(MembersCompanion data) {
    return Member(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      birthdate: data.birthdate.present ? data.birthdate.value : this.birthdate,
      cpf: data.cpf.present ? data.cpf.value : this.cpf,
      rg: data.rg.present ? data.rg.value : this.rg,
      issuingAgency: data.issuingAgency.present
          ? data.issuingAgency.value
          : this.issuingAgency,
      shirtSize: data.shirtSize.present ? data.shirtSize.value : this.shirtSize,
      email: data.email.present ? data.email.value : this.email,
      phone: data.phone.present ? data.phone.value : this.phone,
      cep: data.cep.present ? data.cep.value : this.cep,
      street: data.street.present ? data.street.value : this.street,
      number: data.number.present ? data.number.value : this.number,
      complement: data.complement.present
          ? data.complement.value
          : this.complement,
      neighborhood: data.neighborhood.present
          ? data.neighborhood.value
          : this.neighborhood,
      city: data.city.present ? data.city.value : this.city,
      state: data.state.present ? data.state.value : this.state,
      nameMother: data.nameMother.present
          ? data.nameMother.value
          : this.nameMother,
      emailMother: data.emailMother.present
          ? data.emailMother.value
          : this.emailMother,
      phoneMother: data.phoneMother.present
          ? data.phoneMother.value
          : this.phoneMother,
      nameFather: data.nameFather.present
          ? data.nameFather.value
          : this.nameFather,
      emailFather: data.emailFather.present
          ? data.emailFather.value
          : this.emailFather,
      phoneFather: data.phoneFather.present
          ? data.phoneFather.value
          : this.phoneFather,
      acceptClubTerm: data.acceptClubTerm.present
          ? data.acceptClubTerm.value
          : this.acceptClubTerm,
      acceptImageTerm: data.acceptImageTerm.present
          ? data.acceptImageTerm.value
          : this.acceptImageTerm,
      clubId: data.clubId.present ? data.clubId.value : this.clubId,
      functionMemberId: data.functionMemberId.present
          ? data.functionMemberId.value
          : this.functionMemberId,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Member(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('birthdate: $birthdate, ')
          ..write('cpf: $cpf, ')
          ..write('rg: $rg, ')
          ..write('issuingAgency: $issuingAgency, ')
          ..write('shirtSize: $shirtSize, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('cep: $cep, ')
          ..write('street: $street, ')
          ..write('number: $number, ')
          ..write('complement: $complement, ')
          ..write('neighborhood: $neighborhood, ')
          ..write('city: $city, ')
          ..write('state: $state, ')
          ..write('nameMother: $nameMother, ')
          ..write('emailMother: $emailMother, ')
          ..write('phoneMother: $phoneMother, ')
          ..write('nameFather: $nameFather, ')
          ..write('emailFather: $emailFather, ')
          ..write('phoneFather: $phoneFather, ')
          ..write('acceptClubTerm: $acceptClubTerm, ')
          ..write('acceptImageTerm: $acceptImageTerm, ')
          ..write('clubId: $clubId, ')
          ..write('functionMemberId: $functionMemberId, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    name,
    birthdate,
    cpf,
    rg,
    issuingAgency,
    shirtSize,
    email,
    phone,
    cep,
    street,
    number,
    complement,
    neighborhood,
    city,
    state,
    nameMother,
    emailMother,
    phoneMother,
    nameFather,
    emailFather,
    phoneFather,
    acceptClubTerm,
    acceptImageTerm,
    clubId,
    functionMemberId,
    userId,
    createdAt,
    updatedAt,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Member &&
          other.id == this.id &&
          other.name == this.name &&
          other.birthdate == this.birthdate &&
          other.cpf == this.cpf &&
          other.rg == this.rg &&
          other.issuingAgency == this.issuingAgency &&
          other.shirtSize == this.shirtSize &&
          other.email == this.email &&
          other.phone == this.phone &&
          other.cep == this.cep &&
          other.street == this.street &&
          other.number == this.number &&
          other.complement == this.complement &&
          other.neighborhood == this.neighborhood &&
          other.city == this.city &&
          other.state == this.state &&
          other.nameMother == this.nameMother &&
          other.emailMother == this.emailMother &&
          other.phoneMother == this.phoneMother &&
          other.nameFather == this.nameFather &&
          other.emailFather == this.emailFather &&
          other.phoneFather == this.phoneFather &&
          other.acceptClubTerm == this.acceptClubTerm &&
          other.acceptImageTerm == this.acceptImageTerm &&
          other.clubId == this.clubId &&
          other.functionMemberId == this.functionMemberId &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class MembersCompanion extends UpdateCompanion<Member> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime?> birthdate;
  final Value<String?> cpf;
  final Value<String?> rg;
  final Value<String?> issuingAgency;
  final Value<String?> shirtSize;
  final Value<String?> email;
  final Value<String?> phone;
  final Value<String?> cep;
  final Value<String?> street;
  final Value<String?> number;
  final Value<String?> complement;
  final Value<String?> neighborhood;
  final Value<String?> city;
  final Value<String?> state;
  final Value<String?> nameMother;
  final Value<String?> emailMother;
  final Value<String?> phoneMother;
  final Value<String?> nameFather;
  final Value<String?> emailFather;
  final Value<String?> phoneFather;
  final Value<bool> acceptClubTerm;
  final Value<bool> acceptImageTerm;
  final Value<int?> clubId;
  final Value<int> functionMemberId;
  final Value<int?> userId;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  const MembersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.birthdate = const Value.absent(),
    this.cpf = const Value.absent(),
    this.rg = const Value.absent(),
    this.issuingAgency = const Value.absent(),
    this.shirtSize = const Value.absent(),
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.cep = const Value.absent(),
    this.street = const Value.absent(),
    this.number = const Value.absent(),
    this.complement = const Value.absent(),
    this.neighborhood = const Value.absent(),
    this.city = const Value.absent(),
    this.state = const Value.absent(),
    this.nameMother = const Value.absent(),
    this.emailMother = const Value.absent(),
    this.phoneMother = const Value.absent(),
    this.nameFather = const Value.absent(),
    this.emailFather = const Value.absent(),
    this.phoneFather = const Value.absent(),
    this.acceptClubTerm = const Value.absent(),
    this.acceptImageTerm = const Value.absent(),
    this.clubId = const Value.absent(),
    this.functionMemberId = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  MembersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.birthdate = const Value.absent(),
    this.cpf = const Value.absent(),
    this.rg = const Value.absent(),
    this.issuingAgency = const Value.absent(),
    this.shirtSize = const Value.absent(),
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.cep = const Value.absent(),
    this.street = const Value.absent(),
    this.number = const Value.absent(),
    this.complement = const Value.absent(),
    this.neighborhood = const Value.absent(),
    this.city = const Value.absent(),
    this.state = const Value.absent(),
    this.nameMother = const Value.absent(),
    this.emailMother = const Value.absent(),
    this.phoneMother = const Value.absent(),
    this.nameFather = const Value.absent(),
    this.emailFather = const Value.absent(),
    this.phoneFather = const Value.absent(),
    this.acceptClubTerm = const Value.absent(),
    this.acceptImageTerm = const Value.absent(),
    this.clubId = const Value.absent(),
    required int functionMemberId,
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name),
       functionMemberId = Value(functionMemberId);
  static Insertable<Member> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? birthdate,
    Expression<String>? cpf,
    Expression<String>? rg,
    Expression<String>? issuingAgency,
    Expression<String>? shirtSize,
    Expression<String>? email,
    Expression<String>? phone,
    Expression<String>? cep,
    Expression<String>? street,
    Expression<String>? number,
    Expression<String>? complement,
    Expression<String>? neighborhood,
    Expression<String>? city,
    Expression<String>? state,
    Expression<String>? nameMother,
    Expression<String>? emailMother,
    Expression<String>? phoneMother,
    Expression<String>? nameFather,
    Expression<String>? emailFather,
    Expression<String>? phoneFather,
    Expression<bool>? acceptClubTerm,
    Expression<bool>? acceptImageTerm,
    Expression<int>? clubId,
    Expression<int>? functionMemberId,
    Expression<int>? userId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (birthdate != null) 'birthdate': birthdate,
      if (cpf != null) 'cpf': cpf,
      if (rg != null) 'rg': rg,
      if (issuingAgency != null) 'issuing_agency': issuingAgency,
      if (shirtSize != null) 'shirt_size': shirtSize,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      if (cep != null) 'cep': cep,
      if (street != null) 'street': street,
      if (number != null) 'number': number,
      if (complement != null) 'complement': complement,
      if (neighborhood != null) 'neighborhood': neighborhood,
      if (city != null) 'city': city,
      if (state != null) 'state': state,
      if (nameMother != null) 'name_mother': nameMother,
      if (emailMother != null) 'email_mother': emailMother,
      if (phoneMother != null) 'phone_mother': phoneMother,
      if (nameFather != null) 'name_father': nameFather,
      if (emailFather != null) 'email_father': emailFather,
      if (phoneFather != null) 'phone_father': phoneFather,
      if (acceptClubTerm != null) 'accept_club_term': acceptClubTerm,
      if (acceptImageTerm != null) 'accept_image_term': acceptImageTerm,
      if (clubId != null) 'club_id': clubId,
      if (functionMemberId != null) 'function_member_id': functionMemberId,
      if (userId != null) 'user_id': userId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  MembersCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<DateTime?>? birthdate,
    Value<String?>? cpf,
    Value<String?>? rg,
    Value<String?>? issuingAgency,
    Value<String?>? shirtSize,
    Value<String?>? email,
    Value<String?>? phone,
    Value<String?>? cep,
    Value<String?>? street,
    Value<String?>? number,
    Value<String?>? complement,
    Value<String?>? neighborhood,
    Value<String?>? city,
    Value<String?>? state,
    Value<String?>? nameMother,
    Value<String?>? emailMother,
    Value<String?>? phoneMother,
    Value<String?>? nameFather,
    Value<String?>? emailFather,
    Value<String?>? phoneFather,
    Value<bool>? acceptClubTerm,
    Value<bool>? acceptImageTerm,
    Value<int?>? clubId,
    Value<int>? functionMemberId,
    Value<int?>? userId,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
  }) {
    return MembersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      birthdate: birthdate ?? this.birthdate,
      cpf: cpf ?? this.cpf,
      rg: rg ?? this.rg,
      issuingAgency: issuingAgency ?? this.issuingAgency,
      shirtSize: shirtSize ?? this.shirtSize,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      cep: cep ?? this.cep,
      street: street ?? this.street,
      number: number ?? this.number,
      complement: complement ?? this.complement,
      neighborhood: neighborhood ?? this.neighborhood,
      city: city ?? this.city,
      state: state ?? this.state,
      nameMother: nameMother ?? this.nameMother,
      emailMother: emailMother ?? this.emailMother,
      phoneMother: phoneMother ?? this.phoneMother,
      nameFather: nameFather ?? this.nameFather,
      emailFather: emailFather ?? this.emailFather,
      phoneFather: phoneFather ?? this.phoneFather,
      acceptClubTerm: acceptClubTerm ?? this.acceptClubTerm,
      acceptImageTerm: acceptImageTerm ?? this.acceptImageTerm,
      clubId: clubId ?? this.clubId,
      functionMemberId: functionMemberId ?? this.functionMemberId,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (birthdate.present) {
      map['birthdate'] = Variable<DateTime>(birthdate.value);
    }
    if (cpf.present) {
      map['cpf'] = Variable<String>(cpf.value);
    }
    if (rg.present) {
      map['rg'] = Variable<String>(rg.value);
    }
    if (issuingAgency.present) {
      map['issuing_agency'] = Variable<String>(issuingAgency.value);
    }
    if (shirtSize.present) {
      map['shirt_size'] = Variable<String>(shirtSize.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (cep.present) {
      map['cep'] = Variable<String>(cep.value);
    }
    if (street.present) {
      map['street'] = Variable<String>(street.value);
    }
    if (number.present) {
      map['number'] = Variable<String>(number.value);
    }
    if (complement.present) {
      map['complement'] = Variable<String>(complement.value);
    }
    if (neighborhood.present) {
      map['neighborhood'] = Variable<String>(neighborhood.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(state.value);
    }
    if (nameMother.present) {
      map['name_mother'] = Variable<String>(nameMother.value);
    }
    if (emailMother.present) {
      map['email_mother'] = Variable<String>(emailMother.value);
    }
    if (phoneMother.present) {
      map['phone_mother'] = Variable<String>(phoneMother.value);
    }
    if (nameFather.present) {
      map['name_father'] = Variable<String>(nameFather.value);
    }
    if (emailFather.present) {
      map['email_father'] = Variable<String>(emailFather.value);
    }
    if (phoneFather.present) {
      map['phone_father'] = Variable<String>(phoneFather.value);
    }
    if (acceptClubTerm.present) {
      map['accept_club_term'] = Variable<bool>(acceptClubTerm.value);
    }
    if (acceptImageTerm.present) {
      map['accept_image_term'] = Variable<bool>(acceptImageTerm.value);
    }
    if (clubId.present) {
      map['club_id'] = Variable<int>(clubId.value);
    }
    if (functionMemberId.present) {
      map['function_member_id'] = Variable<int>(functionMemberId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MembersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('birthdate: $birthdate, ')
          ..write('cpf: $cpf, ')
          ..write('rg: $rg, ')
          ..write('issuingAgency: $issuingAgency, ')
          ..write('shirtSize: $shirtSize, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('cep: $cep, ')
          ..write('street: $street, ')
          ..write('number: $number, ')
          ..write('complement: $complement, ')
          ..write('neighborhood: $neighborhood, ')
          ..write('city: $city, ')
          ..write('state: $state, ')
          ..write('nameMother: $nameMother, ')
          ..write('emailMother: $emailMother, ')
          ..write('phoneMother: $phoneMother, ')
          ..write('nameFather: $nameFather, ')
          ..write('emailFather: $emailFather, ')
          ..write('phoneFather: $phoneFather, ')
          ..write('acceptClubTerm: $acceptClubTerm, ')
          ..write('acceptImageTerm: $acceptImageTerm, ')
          ..write('clubId: $clubId, ')
          ..write('functionMemberId: $functionMemberId, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $HealthFormsTable extends HealthForms
    with TableInfo<$HealthFormsTable, HealthForm> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HealthFormsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _memberIdMeta = const VerificationMeta(
    'memberId',
  );
  @override
  late final GeneratedColumn<int> memberId = GeneratedColumn<int>(
    'member_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'UNIQUE REFERENCES members (id)',
    ),
  );
  static const VerificationMeta _hadCovidMeta = const VerificationMeta(
    'hadCovid',
  );
  @override
  late final GeneratedColumn<bool> hadCovid = GeneratedColumn<bool>(
    'had_covid',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("had_covid" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _hadDengueMeta = const VerificationMeta(
    'hadDengue',
  );
  @override
  late final GeneratedColumn<bool> hadDengue = GeneratedColumn<bool>(
    'had_dengue',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("had_dengue" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _hadYellowFeverMeta = const VerificationMeta(
    'hadYellowFever',
  );
  @override
  late final GeneratedColumn<bool> hadYellowFever = GeneratedColumn<bool>(
    'had_yellow_fever',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("had_yellow_fever" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _hadMumpsMeta = const VerificationMeta(
    'hadMumps',
  );
  @override
  late final GeneratedColumn<bool> hadMumps = GeneratedColumn<bool>(
    'had_mumps',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("had_mumps" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _hadChickenpoxMeta = const VerificationMeta(
    'hadChickenpox',
  );
  @override
  late final GeneratedColumn<bool> hadChickenpox = GeneratedColumn<bool>(
    'had_chickenpox',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("had_chickenpox" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _hadMeaslesMeta = const VerificationMeta(
    'hadMeasles',
  );
  @override
  late final GeneratedColumn<bool> hadMeasles = GeneratedColumn<bool>(
    'had_measles',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("had_measles" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _hadRubellaMeta = const VerificationMeta(
    'hadRubella',
  );
  @override
  late final GeneratedColumn<bool> hadRubella = GeneratedColumn<bool>(
    'had_rubella',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("had_rubella" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _asthmaMeta = const VerificationMeta('asthma');
  @override
  late final GeneratedColumn<bool> asthma = GeneratedColumn<bool>(
    'asthma',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("asthma" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _bronchitisMeta = const VerificationMeta(
    'bronchitis',
  );
  @override
  late final GeneratedColumn<bool> bronchitis = GeneratedColumn<bool>(
    'bronchitis',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("bronchitis" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _rhinitisMeta = const VerificationMeta(
    'rhinitis',
  );
  @override
  late final GeneratedColumn<bool> rhinitis = GeneratedColumn<bool>(
    'rhinitis',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("rhinitis" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _epilepsyMeta = const VerificationMeta(
    'epilepsy',
  );
  @override
  late final GeneratedColumn<bool> epilepsy = GeneratedColumn<bool>(
    'epilepsy',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("epilepsy" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _diabetesMeta = const VerificationMeta(
    'diabetes',
  );
  @override
  late final GeneratedColumn<bool> diabetes = GeneratedColumn<bool>(
    'diabetes',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("diabetes" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _hypertensionMeta = const VerificationMeta(
    'hypertension',
  );
  @override
  late final GeneratedColumn<bool> hypertension = GeneratedColumn<bool>(
    'hypertension',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("hypertension" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _otherDiseasesMeta = const VerificationMeta(
    'otherDiseases',
  );
  @override
  late final GeneratedColumn<String> otherDiseases = GeneratedColumn<String>(
    'other_diseases',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _physicalDisabilityMeta =
      const VerificationMeta('physicalDisability');
  @override
  late final GeneratedColumn<String> physicalDisability =
      GeneratedColumn<String>(
        'physical_disability',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant("nenhuma"),
      );
  static const VerificationMeta _hearingDisabilityMeta = const VerificationMeta(
    'hearingDisability',
  );
  @override
  late final GeneratedColumn<String> hearingDisability =
      GeneratedColumn<String>(
        'hearing_disability',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant("nenhuma"),
      );
  static const VerificationMeta _visualDisabilityMeta = const VerificationMeta(
    'visualDisability',
  );
  @override
  late final GeneratedColumn<String> visualDisability = GeneratedColumn<String>(
    'visual_disability',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant("nenhuma"),
  );
  static const VerificationMeta _autismMeta = const VerificationMeta('autism');
  @override
  late final GeneratedColumn<String> autism = GeneratedColumn<String>(
    'autism',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant("nenhuma"),
  );
  static const VerificationMeta _adhdMeta = const VerificationMeta('adhd');
  @override
  late final GeneratedColumn<String> adhd = GeneratedColumn<String>(
    'adhd',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant("nenhuma"),
  );
  static const VerificationMeta _otherConditionMeta = const VerificationMeta(
    'otherCondition',
  );
  @override
  late final GeneratedColumn<String> otherCondition = GeneratedColumn<String>(
    'other_condition',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _allergiesMeta = const VerificationMeta(
    'allergies',
  );
  @override
  late final GeneratedColumn<String> allergies = GeneratedColumn<String>(
    'allergies',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _drugAllergiesMeta = const VerificationMeta(
    'drugAllergies',
  );
  @override
  late final GeneratedColumn<String> drugAllergies = GeneratedColumn<String>(
    'drug_allergies',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _foodAllergiesMeta = const VerificationMeta(
    'foodAllergies',
  );
  @override
  late final GeneratedColumn<String> foodAllergies = GeneratedColumn<String>(
    'food_allergies',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _underMedicalTreatmentMeta =
      const VerificationMeta('underMedicalTreatment');
  @override
  late final GeneratedColumn<bool> underMedicalTreatment =
      GeneratedColumn<bool>(
        'under_medical_treatment',
        aliasedName,
        false,
        type: DriftSqlType.bool,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("under_medical_treatment" IN (0, 1))',
        ),
        defaultValue: const Constant(false),
      );
  static const VerificationMeta _onContinuousMedicationMeta =
      const VerificationMeta('onContinuousMedication');
  @override
  late final GeneratedColumn<bool> onContinuousMedication =
      GeneratedColumn<bool>(
        'on_continuous_medication',
        aliasedName,
        false,
        type: DriftSqlType.bool,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("on_continuous_medication" IN (0, 1))',
        ),
        defaultValue: const Constant(false),
      );
  static const VerificationMeta _healthInsuranceMeta = const VerificationMeta(
    'healthInsurance',
  );
  @override
  late final GeneratedColumn<String> healthInsurance = GeneratedColumn<String>(
    'health_insurance',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    memberId,
    hadCovid,
    hadDengue,
    hadYellowFever,
    hadMumps,
    hadChickenpox,
    hadMeasles,
    hadRubella,
    asthma,
    bronchitis,
    rhinitis,
    epilepsy,
    diabetes,
    hypertension,
    otherDiseases,
    physicalDisability,
    hearingDisability,
    visualDisability,
    autism,
    adhd,
    otherCondition,
    allergies,
    drugAllergies,
    foodAllergies,
    underMedicalTreatment,
    onContinuousMedication,
    healthInsurance,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'health_forms';
  @override
  VerificationContext validateIntegrity(
    Insertable<HealthForm> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('member_id')) {
      context.handle(
        _memberIdMeta,
        memberId.isAcceptableOrUnknown(data['member_id']!, _memberIdMeta),
      );
    } else if (isInserting) {
      context.missing(_memberIdMeta);
    }
    if (data.containsKey('had_covid')) {
      context.handle(
        _hadCovidMeta,
        hadCovid.isAcceptableOrUnknown(data['had_covid']!, _hadCovidMeta),
      );
    }
    if (data.containsKey('had_dengue')) {
      context.handle(
        _hadDengueMeta,
        hadDengue.isAcceptableOrUnknown(data['had_dengue']!, _hadDengueMeta),
      );
    }
    if (data.containsKey('had_yellow_fever')) {
      context.handle(
        _hadYellowFeverMeta,
        hadYellowFever.isAcceptableOrUnknown(
          data['had_yellow_fever']!,
          _hadYellowFeverMeta,
        ),
      );
    }
    if (data.containsKey('had_mumps')) {
      context.handle(
        _hadMumpsMeta,
        hadMumps.isAcceptableOrUnknown(data['had_mumps']!, _hadMumpsMeta),
      );
    }
    if (data.containsKey('had_chickenpox')) {
      context.handle(
        _hadChickenpoxMeta,
        hadChickenpox.isAcceptableOrUnknown(
          data['had_chickenpox']!,
          _hadChickenpoxMeta,
        ),
      );
    }
    if (data.containsKey('had_measles')) {
      context.handle(
        _hadMeaslesMeta,
        hadMeasles.isAcceptableOrUnknown(data['had_measles']!, _hadMeaslesMeta),
      );
    }
    if (data.containsKey('had_rubella')) {
      context.handle(
        _hadRubellaMeta,
        hadRubella.isAcceptableOrUnknown(data['had_rubella']!, _hadRubellaMeta),
      );
    }
    if (data.containsKey('asthma')) {
      context.handle(
        _asthmaMeta,
        asthma.isAcceptableOrUnknown(data['asthma']!, _asthmaMeta),
      );
    }
    if (data.containsKey('bronchitis')) {
      context.handle(
        _bronchitisMeta,
        bronchitis.isAcceptableOrUnknown(data['bronchitis']!, _bronchitisMeta),
      );
    }
    if (data.containsKey('rhinitis')) {
      context.handle(
        _rhinitisMeta,
        rhinitis.isAcceptableOrUnknown(data['rhinitis']!, _rhinitisMeta),
      );
    }
    if (data.containsKey('epilepsy')) {
      context.handle(
        _epilepsyMeta,
        epilepsy.isAcceptableOrUnknown(data['epilepsy']!, _epilepsyMeta),
      );
    }
    if (data.containsKey('diabetes')) {
      context.handle(
        _diabetesMeta,
        diabetes.isAcceptableOrUnknown(data['diabetes']!, _diabetesMeta),
      );
    }
    if (data.containsKey('hypertension')) {
      context.handle(
        _hypertensionMeta,
        hypertension.isAcceptableOrUnknown(
          data['hypertension']!,
          _hypertensionMeta,
        ),
      );
    }
    if (data.containsKey('other_diseases')) {
      context.handle(
        _otherDiseasesMeta,
        otherDiseases.isAcceptableOrUnknown(
          data['other_diseases']!,
          _otherDiseasesMeta,
        ),
      );
    }
    if (data.containsKey('physical_disability')) {
      context.handle(
        _physicalDisabilityMeta,
        physicalDisability.isAcceptableOrUnknown(
          data['physical_disability']!,
          _physicalDisabilityMeta,
        ),
      );
    }
    if (data.containsKey('hearing_disability')) {
      context.handle(
        _hearingDisabilityMeta,
        hearingDisability.isAcceptableOrUnknown(
          data['hearing_disability']!,
          _hearingDisabilityMeta,
        ),
      );
    }
    if (data.containsKey('visual_disability')) {
      context.handle(
        _visualDisabilityMeta,
        visualDisability.isAcceptableOrUnknown(
          data['visual_disability']!,
          _visualDisabilityMeta,
        ),
      );
    }
    if (data.containsKey('autism')) {
      context.handle(
        _autismMeta,
        autism.isAcceptableOrUnknown(data['autism']!, _autismMeta),
      );
    }
    if (data.containsKey('adhd')) {
      context.handle(
        _adhdMeta,
        adhd.isAcceptableOrUnknown(data['adhd']!, _adhdMeta),
      );
    }
    if (data.containsKey('other_condition')) {
      context.handle(
        _otherConditionMeta,
        otherCondition.isAcceptableOrUnknown(
          data['other_condition']!,
          _otherConditionMeta,
        ),
      );
    }
    if (data.containsKey('allergies')) {
      context.handle(
        _allergiesMeta,
        allergies.isAcceptableOrUnknown(data['allergies']!, _allergiesMeta),
      );
    }
    if (data.containsKey('drug_allergies')) {
      context.handle(
        _drugAllergiesMeta,
        drugAllergies.isAcceptableOrUnknown(
          data['drug_allergies']!,
          _drugAllergiesMeta,
        ),
      );
    }
    if (data.containsKey('food_allergies')) {
      context.handle(
        _foodAllergiesMeta,
        foodAllergies.isAcceptableOrUnknown(
          data['food_allergies']!,
          _foodAllergiesMeta,
        ),
      );
    }
    if (data.containsKey('under_medical_treatment')) {
      context.handle(
        _underMedicalTreatmentMeta,
        underMedicalTreatment.isAcceptableOrUnknown(
          data['under_medical_treatment']!,
          _underMedicalTreatmentMeta,
        ),
      );
    }
    if (data.containsKey('on_continuous_medication')) {
      context.handle(
        _onContinuousMedicationMeta,
        onContinuousMedication.isAcceptableOrUnknown(
          data['on_continuous_medication']!,
          _onContinuousMedicationMeta,
        ),
      );
    }
    if (data.containsKey('health_insurance')) {
      context.handle(
        _healthInsuranceMeta,
        healthInsurance.isAcceptableOrUnknown(
          data['health_insurance']!,
          _healthInsuranceMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HealthForm map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HealthForm(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      memberId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}member_id'],
      )!,
      hadCovid: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}had_covid'],
      )!,
      hadDengue: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}had_dengue'],
      )!,
      hadYellowFever: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}had_yellow_fever'],
      )!,
      hadMumps: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}had_mumps'],
      )!,
      hadChickenpox: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}had_chickenpox'],
      )!,
      hadMeasles: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}had_measles'],
      )!,
      hadRubella: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}had_rubella'],
      )!,
      asthma: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}asthma'],
      )!,
      bronchitis: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}bronchitis'],
      )!,
      rhinitis: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}rhinitis'],
      )!,
      epilepsy: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}epilepsy'],
      )!,
      diabetes: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}diabetes'],
      )!,
      hypertension: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}hypertension'],
      )!,
      otherDiseases: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}other_diseases'],
      ),
      physicalDisability: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}physical_disability'],
      )!,
      hearingDisability: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hearing_disability'],
      )!,
      visualDisability: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}visual_disability'],
      )!,
      autism: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}autism'],
      )!,
      adhd: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}adhd'],
      )!,
      otherCondition: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}other_condition'],
      ),
      allergies: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}allergies'],
      ),
      drugAllergies: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}drug_allergies'],
      ),
      foodAllergies: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}food_allergies'],
      ),
      underMedicalTreatment: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}under_medical_treatment'],
      )!,
      onContinuousMedication: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}on_continuous_medication'],
      )!,
      healthInsurance: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}health_insurance'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $HealthFormsTable createAlias(String alias) {
    return $HealthFormsTable(attachedDatabase, alias);
  }
}

class HealthForm extends DataClass implements Insertable<HealthForm> {
  final int id;
  final int memberId;
  final bool hadCovid;
  final bool hadDengue;
  final bool hadYellowFever;
  final bool hadMumps;
  final bool hadChickenpox;
  final bool hadMeasles;
  final bool hadRubella;
  final bool asthma;
  final bool bronchitis;
  final bool rhinitis;
  final bool epilepsy;
  final bool diabetes;
  final bool hypertension;
  final String? otherDiseases;
  final String physicalDisability;
  final String hearingDisability;
  final String visualDisability;
  final String autism;
  final String adhd;
  final String? otherCondition;
  final String? allergies;
  final String? drugAllergies;
  final String? foodAllergies;
  final bool underMedicalTreatment;
  final bool onContinuousMedication;
  final String? healthInsurance;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  const HealthForm({
    required this.id,
    required this.memberId,
    required this.hadCovid,
    required this.hadDengue,
    required this.hadYellowFever,
    required this.hadMumps,
    required this.hadChickenpox,
    required this.hadMeasles,
    required this.hadRubella,
    required this.asthma,
    required this.bronchitis,
    required this.rhinitis,
    required this.epilepsy,
    required this.diabetes,
    required this.hypertension,
    this.otherDiseases,
    required this.physicalDisability,
    required this.hearingDisability,
    required this.visualDisability,
    required this.autism,
    required this.adhd,
    this.otherCondition,
    this.allergies,
    this.drugAllergies,
    this.foodAllergies,
    required this.underMedicalTreatment,
    required this.onContinuousMedication,
    this.healthInsurance,
    this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['member_id'] = Variable<int>(memberId);
    map['had_covid'] = Variable<bool>(hadCovid);
    map['had_dengue'] = Variable<bool>(hadDengue);
    map['had_yellow_fever'] = Variable<bool>(hadYellowFever);
    map['had_mumps'] = Variable<bool>(hadMumps);
    map['had_chickenpox'] = Variable<bool>(hadChickenpox);
    map['had_measles'] = Variable<bool>(hadMeasles);
    map['had_rubella'] = Variable<bool>(hadRubella);
    map['asthma'] = Variable<bool>(asthma);
    map['bronchitis'] = Variable<bool>(bronchitis);
    map['rhinitis'] = Variable<bool>(rhinitis);
    map['epilepsy'] = Variable<bool>(epilepsy);
    map['diabetes'] = Variable<bool>(diabetes);
    map['hypertension'] = Variable<bool>(hypertension);
    if (!nullToAbsent || otherDiseases != null) {
      map['other_diseases'] = Variable<String>(otherDiseases);
    }
    map['physical_disability'] = Variable<String>(physicalDisability);
    map['hearing_disability'] = Variable<String>(hearingDisability);
    map['visual_disability'] = Variable<String>(visualDisability);
    map['autism'] = Variable<String>(autism);
    map['adhd'] = Variable<String>(adhd);
    if (!nullToAbsent || otherCondition != null) {
      map['other_condition'] = Variable<String>(otherCondition);
    }
    if (!nullToAbsent || allergies != null) {
      map['allergies'] = Variable<String>(allergies);
    }
    if (!nullToAbsent || drugAllergies != null) {
      map['drug_allergies'] = Variable<String>(drugAllergies);
    }
    if (!nullToAbsent || foodAllergies != null) {
      map['food_allergies'] = Variable<String>(foodAllergies);
    }
    map['under_medical_treatment'] = Variable<bool>(underMedicalTreatment);
    map['on_continuous_medication'] = Variable<bool>(onContinuousMedication);
    if (!nullToAbsent || healthInsurance != null) {
      map['health_insurance'] = Variable<String>(healthInsurance);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  HealthFormsCompanion toCompanion(bool nullToAbsent) {
    return HealthFormsCompanion(
      id: Value(id),
      memberId: Value(memberId),
      hadCovid: Value(hadCovid),
      hadDengue: Value(hadDengue),
      hadYellowFever: Value(hadYellowFever),
      hadMumps: Value(hadMumps),
      hadChickenpox: Value(hadChickenpox),
      hadMeasles: Value(hadMeasles),
      hadRubella: Value(hadRubella),
      asthma: Value(asthma),
      bronchitis: Value(bronchitis),
      rhinitis: Value(rhinitis),
      epilepsy: Value(epilepsy),
      diabetes: Value(diabetes),
      hypertension: Value(hypertension),
      otherDiseases: otherDiseases == null && nullToAbsent
          ? const Value.absent()
          : Value(otherDiseases),
      physicalDisability: Value(physicalDisability),
      hearingDisability: Value(hearingDisability),
      visualDisability: Value(visualDisability),
      autism: Value(autism),
      adhd: Value(adhd),
      otherCondition: otherCondition == null && nullToAbsent
          ? const Value.absent()
          : Value(otherCondition),
      allergies: allergies == null && nullToAbsent
          ? const Value.absent()
          : Value(allergies),
      drugAllergies: drugAllergies == null && nullToAbsent
          ? const Value.absent()
          : Value(drugAllergies),
      foodAllergies: foodAllergies == null && nullToAbsent
          ? const Value.absent()
          : Value(foodAllergies),
      underMedicalTreatment: Value(underMedicalTreatment),
      onContinuousMedication: Value(onContinuousMedication),
      healthInsurance: healthInsurance == null && nullToAbsent
          ? const Value.absent()
          : Value(healthInsurance),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory HealthForm.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HealthForm(
      id: serializer.fromJson<int>(json['id']),
      memberId: serializer.fromJson<int>(json['memberId']),
      hadCovid: serializer.fromJson<bool>(json['hadCovid']),
      hadDengue: serializer.fromJson<bool>(json['hadDengue']),
      hadYellowFever: serializer.fromJson<bool>(json['hadYellowFever']),
      hadMumps: serializer.fromJson<bool>(json['hadMumps']),
      hadChickenpox: serializer.fromJson<bool>(json['hadChickenpox']),
      hadMeasles: serializer.fromJson<bool>(json['hadMeasles']),
      hadRubella: serializer.fromJson<bool>(json['hadRubella']),
      asthma: serializer.fromJson<bool>(json['asthma']),
      bronchitis: serializer.fromJson<bool>(json['bronchitis']),
      rhinitis: serializer.fromJson<bool>(json['rhinitis']),
      epilepsy: serializer.fromJson<bool>(json['epilepsy']),
      diabetes: serializer.fromJson<bool>(json['diabetes']),
      hypertension: serializer.fromJson<bool>(json['hypertension']),
      otherDiseases: serializer.fromJson<String?>(json['otherDiseases']),
      physicalDisability: serializer.fromJson<String>(
        json['physicalDisability'],
      ),
      hearingDisability: serializer.fromJson<String>(json['hearingDisability']),
      visualDisability: serializer.fromJson<String>(json['visualDisability']),
      autism: serializer.fromJson<String>(json['autism']),
      adhd: serializer.fromJson<String>(json['adhd']),
      otherCondition: serializer.fromJson<String?>(json['otherCondition']),
      allergies: serializer.fromJson<String?>(json['allergies']),
      drugAllergies: serializer.fromJson<String?>(json['drugAllergies']),
      foodAllergies: serializer.fromJson<String?>(json['foodAllergies']),
      underMedicalTreatment: serializer.fromJson<bool>(
        json['underMedicalTreatment'],
      ),
      onContinuousMedication: serializer.fromJson<bool>(
        json['onContinuousMedication'],
      ),
      healthInsurance: serializer.fromJson<String?>(json['healthInsurance']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'memberId': serializer.toJson<int>(memberId),
      'hadCovid': serializer.toJson<bool>(hadCovid),
      'hadDengue': serializer.toJson<bool>(hadDengue),
      'hadYellowFever': serializer.toJson<bool>(hadYellowFever),
      'hadMumps': serializer.toJson<bool>(hadMumps),
      'hadChickenpox': serializer.toJson<bool>(hadChickenpox),
      'hadMeasles': serializer.toJson<bool>(hadMeasles),
      'hadRubella': serializer.toJson<bool>(hadRubella),
      'asthma': serializer.toJson<bool>(asthma),
      'bronchitis': serializer.toJson<bool>(bronchitis),
      'rhinitis': serializer.toJson<bool>(rhinitis),
      'epilepsy': serializer.toJson<bool>(epilepsy),
      'diabetes': serializer.toJson<bool>(diabetes),
      'hypertension': serializer.toJson<bool>(hypertension),
      'otherDiseases': serializer.toJson<String?>(otherDiseases),
      'physicalDisability': serializer.toJson<String>(physicalDisability),
      'hearingDisability': serializer.toJson<String>(hearingDisability),
      'visualDisability': serializer.toJson<String>(visualDisability),
      'autism': serializer.toJson<String>(autism),
      'adhd': serializer.toJson<String>(adhd),
      'otherCondition': serializer.toJson<String?>(otherCondition),
      'allergies': serializer.toJson<String?>(allergies),
      'drugAllergies': serializer.toJson<String?>(drugAllergies),
      'foodAllergies': serializer.toJson<String?>(foodAllergies),
      'underMedicalTreatment': serializer.toJson<bool>(underMedicalTreatment),
      'onContinuousMedication': serializer.toJson<bool>(onContinuousMedication),
      'healthInsurance': serializer.toJson<String?>(healthInsurance),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  HealthForm copyWith({
    int? id,
    int? memberId,
    bool? hadCovid,
    bool? hadDengue,
    bool? hadYellowFever,
    bool? hadMumps,
    bool? hadChickenpox,
    bool? hadMeasles,
    bool? hadRubella,
    bool? asthma,
    bool? bronchitis,
    bool? rhinitis,
    bool? epilepsy,
    bool? diabetes,
    bool? hypertension,
    Value<String?> otherDiseases = const Value.absent(),
    String? physicalDisability,
    String? hearingDisability,
    String? visualDisability,
    String? autism,
    String? adhd,
    Value<String?> otherCondition = const Value.absent(),
    Value<String?> allergies = const Value.absent(),
    Value<String?> drugAllergies = const Value.absent(),
    Value<String?> foodAllergies = const Value.absent(),
    bool? underMedicalTreatment,
    bool? onContinuousMedication,
    Value<String?> healthInsurance = const Value.absent(),
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => HealthForm(
    id: id ?? this.id,
    memberId: memberId ?? this.memberId,
    hadCovid: hadCovid ?? this.hadCovid,
    hadDengue: hadDengue ?? this.hadDengue,
    hadYellowFever: hadYellowFever ?? this.hadYellowFever,
    hadMumps: hadMumps ?? this.hadMumps,
    hadChickenpox: hadChickenpox ?? this.hadChickenpox,
    hadMeasles: hadMeasles ?? this.hadMeasles,
    hadRubella: hadRubella ?? this.hadRubella,
    asthma: asthma ?? this.asthma,
    bronchitis: bronchitis ?? this.bronchitis,
    rhinitis: rhinitis ?? this.rhinitis,
    epilepsy: epilepsy ?? this.epilepsy,
    diabetes: diabetes ?? this.diabetes,
    hypertension: hypertension ?? this.hypertension,
    otherDiseases: otherDiseases.present
        ? otherDiseases.value
        : this.otherDiseases,
    physicalDisability: physicalDisability ?? this.physicalDisability,
    hearingDisability: hearingDisability ?? this.hearingDisability,
    visualDisability: visualDisability ?? this.visualDisability,
    autism: autism ?? this.autism,
    adhd: adhd ?? this.adhd,
    otherCondition: otherCondition.present
        ? otherCondition.value
        : this.otherCondition,
    allergies: allergies.present ? allergies.value : this.allergies,
    drugAllergies: drugAllergies.present
        ? drugAllergies.value
        : this.drugAllergies,
    foodAllergies: foodAllergies.present
        ? foodAllergies.value
        : this.foodAllergies,
    underMedicalTreatment: underMedicalTreatment ?? this.underMedicalTreatment,
    onContinuousMedication:
        onContinuousMedication ?? this.onContinuousMedication,
    healthInsurance: healthInsurance.present
        ? healthInsurance.value
        : this.healthInsurance,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  HealthForm copyWithCompanion(HealthFormsCompanion data) {
    return HealthForm(
      id: data.id.present ? data.id.value : this.id,
      memberId: data.memberId.present ? data.memberId.value : this.memberId,
      hadCovid: data.hadCovid.present ? data.hadCovid.value : this.hadCovid,
      hadDengue: data.hadDengue.present ? data.hadDengue.value : this.hadDengue,
      hadYellowFever: data.hadYellowFever.present
          ? data.hadYellowFever.value
          : this.hadYellowFever,
      hadMumps: data.hadMumps.present ? data.hadMumps.value : this.hadMumps,
      hadChickenpox: data.hadChickenpox.present
          ? data.hadChickenpox.value
          : this.hadChickenpox,
      hadMeasles: data.hadMeasles.present
          ? data.hadMeasles.value
          : this.hadMeasles,
      hadRubella: data.hadRubella.present
          ? data.hadRubella.value
          : this.hadRubella,
      asthma: data.asthma.present ? data.asthma.value : this.asthma,
      bronchitis: data.bronchitis.present
          ? data.bronchitis.value
          : this.bronchitis,
      rhinitis: data.rhinitis.present ? data.rhinitis.value : this.rhinitis,
      epilepsy: data.epilepsy.present ? data.epilepsy.value : this.epilepsy,
      diabetes: data.diabetes.present ? data.diabetes.value : this.diabetes,
      hypertension: data.hypertension.present
          ? data.hypertension.value
          : this.hypertension,
      otherDiseases: data.otherDiseases.present
          ? data.otherDiseases.value
          : this.otherDiseases,
      physicalDisability: data.physicalDisability.present
          ? data.physicalDisability.value
          : this.physicalDisability,
      hearingDisability: data.hearingDisability.present
          ? data.hearingDisability.value
          : this.hearingDisability,
      visualDisability: data.visualDisability.present
          ? data.visualDisability.value
          : this.visualDisability,
      autism: data.autism.present ? data.autism.value : this.autism,
      adhd: data.adhd.present ? data.adhd.value : this.adhd,
      otherCondition: data.otherCondition.present
          ? data.otherCondition.value
          : this.otherCondition,
      allergies: data.allergies.present ? data.allergies.value : this.allergies,
      drugAllergies: data.drugAllergies.present
          ? data.drugAllergies.value
          : this.drugAllergies,
      foodAllergies: data.foodAllergies.present
          ? data.foodAllergies.value
          : this.foodAllergies,
      underMedicalTreatment: data.underMedicalTreatment.present
          ? data.underMedicalTreatment.value
          : this.underMedicalTreatment,
      onContinuousMedication: data.onContinuousMedication.present
          ? data.onContinuousMedication.value
          : this.onContinuousMedication,
      healthInsurance: data.healthInsurance.present
          ? data.healthInsurance.value
          : this.healthInsurance,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HealthForm(')
          ..write('id: $id, ')
          ..write('memberId: $memberId, ')
          ..write('hadCovid: $hadCovid, ')
          ..write('hadDengue: $hadDengue, ')
          ..write('hadYellowFever: $hadYellowFever, ')
          ..write('hadMumps: $hadMumps, ')
          ..write('hadChickenpox: $hadChickenpox, ')
          ..write('hadMeasles: $hadMeasles, ')
          ..write('hadRubella: $hadRubella, ')
          ..write('asthma: $asthma, ')
          ..write('bronchitis: $bronchitis, ')
          ..write('rhinitis: $rhinitis, ')
          ..write('epilepsy: $epilepsy, ')
          ..write('diabetes: $diabetes, ')
          ..write('hypertension: $hypertension, ')
          ..write('otherDiseases: $otherDiseases, ')
          ..write('physicalDisability: $physicalDisability, ')
          ..write('hearingDisability: $hearingDisability, ')
          ..write('visualDisability: $visualDisability, ')
          ..write('autism: $autism, ')
          ..write('adhd: $adhd, ')
          ..write('otherCondition: $otherCondition, ')
          ..write('allergies: $allergies, ')
          ..write('drugAllergies: $drugAllergies, ')
          ..write('foodAllergies: $foodAllergies, ')
          ..write('underMedicalTreatment: $underMedicalTreatment, ')
          ..write('onContinuousMedication: $onContinuousMedication, ')
          ..write('healthInsurance: $healthInsurance, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    memberId,
    hadCovid,
    hadDengue,
    hadYellowFever,
    hadMumps,
    hadChickenpox,
    hadMeasles,
    hadRubella,
    asthma,
    bronchitis,
    rhinitis,
    epilepsy,
    diabetes,
    hypertension,
    otherDiseases,
    physicalDisability,
    hearingDisability,
    visualDisability,
    autism,
    adhd,
    otherCondition,
    allergies,
    drugAllergies,
    foodAllergies,
    underMedicalTreatment,
    onContinuousMedication,
    healthInsurance,
    createdAt,
    updatedAt,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HealthForm &&
          other.id == this.id &&
          other.memberId == this.memberId &&
          other.hadCovid == this.hadCovid &&
          other.hadDengue == this.hadDengue &&
          other.hadYellowFever == this.hadYellowFever &&
          other.hadMumps == this.hadMumps &&
          other.hadChickenpox == this.hadChickenpox &&
          other.hadMeasles == this.hadMeasles &&
          other.hadRubella == this.hadRubella &&
          other.asthma == this.asthma &&
          other.bronchitis == this.bronchitis &&
          other.rhinitis == this.rhinitis &&
          other.epilepsy == this.epilepsy &&
          other.diabetes == this.diabetes &&
          other.hypertension == this.hypertension &&
          other.otherDiseases == this.otherDiseases &&
          other.physicalDisability == this.physicalDisability &&
          other.hearingDisability == this.hearingDisability &&
          other.visualDisability == this.visualDisability &&
          other.autism == this.autism &&
          other.adhd == this.adhd &&
          other.otherCondition == this.otherCondition &&
          other.allergies == this.allergies &&
          other.drugAllergies == this.drugAllergies &&
          other.foodAllergies == this.foodAllergies &&
          other.underMedicalTreatment == this.underMedicalTreatment &&
          other.onContinuousMedication == this.onContinuousMedication &&
          other.healthInsurance == this.healthInsurance &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class HealthFormsCompanion extends UpdateCompanion<HealthForm> {
  final Value<int> id;
  final Value<int> memberId;
  final Value<bool> hadCovid;
  final Value<bool> hadDengue;
  final Value<bool> hadYellowFever;
  final Value<bool> hadMumps;
  final Value<bool> hadChickenpox;
  final Value<bool> hadMeasles;
  final Value<bool> hadRubella;
  final Value<bool> asthma;
  final Value<bool> bronchitis;
  final Value<bool> rhinitis;
  final Value<bool> epilepsy;
  final Value<bool> diabetes;
  final Value<bool> hypertension;
  final Value<String?> otherDiseases;
  final Value<String> physicalDisability;
  final Value<String> hearingDisability;
  final Value<String> visualDisability;
  final Value<String> autism;
  final Value<String> adhd;
  final Value<String?> otherCondition;
  final Value<String?> allergies;
  final Value<String?> drugAllergies;
  final Value<String?> foodAllergies;
  final Value<bool> underMedicalTreatment;
  final Value<bool> onContinuousMedication;
  final Value<String?> healthInsurance;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  const HealthFormsCompanion({
    this.id = const Value.absent(),
    this.memberId = const Value.absent(),
    this.hadCovid = const Value.absent(),
    this.hadDengue = const Value.absent(),
    this.hadYellowFever = const Value.absent(),
    this.hadMumps = const Value.absent(),
    this.hadChickenpox = const Value.absent(),
    this.hadMeasles = const Value.absent(),
    this.hadRubella = const Value.absent(),
    this.asthma = const Value.absent(),
    this.bronchitis = const Value.absent(),
    this.rhinitis = const Value.absent(),
    this.epilepsy = const Value.absent(),
    this.diabetes = const Value.absent(),
    this.hypertension = const Value.absent(),
    this.otherDiseases = const Value.absent(),
    this.physicalDisability = const Value.absent(),
    this.hearingDisability = const Value.absent(),
    this.visualDisability = const Value.absent(),
    this.autism = const Value.absent(),
    this.adhd = const Value.absent(),
    this.otherCondition = const Value.absent(),
    this.allergies = const Value.absent(),
    this.drugAllergies = const Value.absent(),
    this.foodAllergies = const Value.absent(),
    this.underMedicalTreatment = const Value.absent(),
    this.onContinuousMedication = const Value.absent(),
    this.healthInsurance = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  HealthFormsCompanion.insert({
    this.id = const Value.absent(),
    required int memberId,
    this.hadCovid = const Value.absent(),
    this.hadDengue = const Value.absent(),
    this.hadYellowFever = const Value.absent(),
    this.hadMumps = const Value.absent(),
    this.hadChickenpox = const Value.absent(),
    this.hadMeasles = const Value.absent(),
    this.hadRubella = const Value.absent(),
    this.asthma = const Value.absent(),
    this.bronchitis = const Value.absent(),
    this.rhinitis = const Value.absent(),
    this.epilepsy = const Value.absent(),
    this.diabetes = const Value.absent(),
    this.hypertension = const Value.absent(),
    this.otherDiseases = const Value.absent(),
    this.physicalDisability = const Value.absent(),
    this.hearingDisability = const Value.absent(),
    this.visualDisability = const Value.absent(),
    this.autism = const Value.absent(),
    this.adhd = const Value.absent(),
    this.otherCondition = const Value.absent(),
    this.allergies = const Value.absent(),
    this.drugAllergies = const Value.absent(),
    this.foodAllergies = const Value.absent(),
    this.underMedicalTreatment = const Value.absent(),
    this.onContinuousMedication = const Value.absent(),
    this.healthInsurance = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : memberId = Value(memberId);
  static Insertable<HealthForm> custom({
    Expression<int>? id,
    Expression<int>? memberId,
    Expression<bool>? hadCovid,
    Expression<bool>? hadDengue,
    Expression<bool>? hadYellowFever,
    Expression<bool>? hadMumps,
    Expression<bool>? hadChickenpox,
    Expression<bool>? hadMeasles,
    Expression<bool>? hadRubella,
    Expression<bool>? asthma,
    Expression<bool>? bronchitis,
    Expression<bool>? rhinitis,
    Expression<bool>? epilepsy,
    Expression<bool>? diabetes,
    Expression<bool>? hypertension,
    Expression<String>? otherDiseases,
    Expression<String>? physicalDisability,
    Expression<String>? hearingDisability,
    Expression<String>? visualDisability,
    Expression<String>? autism,
    Expression<String>? adhd,
    Expression<String>? otherCondition,
    Expression<String>? allergies,
    Expression<String>? drugAllergies,
    Expression<String>? foodAllergies,
    Expression<bool>? underMedicalTreatment,
    Expression<bool>? onContinuousMedication,
    Expression<String>? healthInsurance,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (memberId != null) 'member_id': memberId,
      if (hadCovid != null) 'had_covid': hadCovid,
      if (hadDengue != null) 'had_dengue': hadDengue,
      if (hadYellowFever != null) 'had_yellow_fever': hadYellowFever,
      if (hadMumps != null) 'had_mumps': hadMumps,
      if (hadChickenpox != null) 'had_chickenpox': hadChickenpox,
      if (hadMeasles != null) 'had_measles': hadMeasles,
      if (hadRubella != null) 'had_rubella': hadRubella,
      if (asthma != null) 'asthma': asthma,
      if (bronchitis != null) 'bronchitis': bronchitis,
      if (rhinitis != null) 'rhinitis': rhinitis,
      if (epilepsy != null) 'epilepsy': epilepsy,
      if (diabetes != null) 'diabetes': diabetes,
      if (hypertension != null) 'hypertension': hypertension,
      if (otherDiseases != null) 'other_diseases': otherDiseases,
      if (physicalDisability != null) 'physical_disability': physicalDisability,
      if (hearingDisability != null) 'hearing_disability': hearingDisability,
      if (visualDisability != null) 'visual_disability': visualDisability,
      if (autism != null) 'autism': autism,
      if (adhd != null) 'adhd': adhd,
      if (otherCondition != null) 'other_condition': otherCondition,
      if (allergies != null) 'allergies': allergies,
      if (drugAllergies != null) 'drug_allergies': drugAllergies,
      if (foodAllergies != null) 'food_allergies': foodAllergies,
      if (underMedicalTreatment != null)
        'under_medical_treatment': underMedicalTreatment,
      if (onContinuousMedication != null)
        'on_continuous_medication': onContinuousMedication,
      if (healthInsurance != null) 'health_insurance': healthInsurance,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  HealthFormsCompanion copyWith({
    Value<int>? id,
    Value<int>? memberId,
    Value<bool>? hadCovid,
    Value<bool>? hadDengue,
    Value<bool>? hadYellowFever,
    Value<bool>? hadMumps,
    Value<bool>? hadChickenpox,
    Value<bool>? hadMeasles,
    Value<bool>? hadRubella,
    Value<bool>? asthma,
    Value<bool>? bronchitis,
    Value<bool>? rhinitis,
    Value<bool>? epilepsy,
    Value<bool>? diabetes,
    Value<bool>? hypertension,
    Value<String?>? otherDiseases,
    Value<String>? physicalDisability,
    Value<String>? hearingDisability,
    Value<String>? visualDisability,
    Value<String>? autism,
    Value<String>? adhd,
    Value<String?>? otherCondition,
    Value<String?>? allergies,
    Value<String?>? drugAllergies,
    Value<String?>? foodAllergies,
    Value<bool>? underMedicalTreatment,
    Value<bool>? onContinuousMedication,
    Value<String?>? healthInsurance,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
  }) {
    return HealthFormsCompanion(
      id: id ?? this.id,
      memberId: memberId ?? this.memberId,
      hadCovid: hadCovid ?? this.hadCovid,
      hadDengue: hadDengue ?? this.hadDengue,
      hadYellowFever: hadYellowFever ?? this.hadYellowFever,
      hadMumps: hadMumps ?? this.hadMumps,
      hadChickenpox: hadChickenpox ?? this.hadChickenpox,
      hadMeasles: hadMeasles ?? this.hadMeasles,
      hadRubella: hadRubella ?? this.hadRubella,
      asthma: asthma ?? this.asthma,
      bronchitis: bronchitis ?? this.bronchitis,
      rhinitis: rhinitis ?? this.rhinitis,
      epilepsy: epilepsy ?? this.epilepsy,
      diabetes: diabetes ?? this.diabetes,
      hypertension: hypertension ?? this.hypertension,
      otherDiseases: otherDiseases ?? this.otherDiseases,
      physicalDisability: physicalDisability ?? this.physicalDisability,
      hearingDisability: hearingDisability ?? this.hearingDisability,
      visualDisability: visualDisability ?? this.visualDisability,
      autism: autism ?? this.autism,
      adhd: adhd ?? this.adhd,
      otherCondition: otherCondition ?? this.otherCondition,
      allergies: allergies ?? this.allergies,
      drugAllergies: drugAllergies ?? this.drugAllergies,
      foodAllergies: foodAllergies ?? this.foodAllergies,
      underMedicalTreatment:
          underMedicalTreatment ?? this.underMedicalTreatment,
      onContinuousMedication:
          onContinuousMedication ?? this.onContinuousMedication,
      healthInsurance: healthInsurance ?? this.healthInsurance,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (memberId.present) {
      map['member_id'] = Variable<int>(memberId.value);
    }
    if (hadCovid.present) {
      map['had_covid'] = Variable<bool>(hadCovid.value);
    }
    if (hadDengue.present) {
      map['had_dengue'] = Variable<bool>(hadDengue.value);
    }
    if (hadYellowFever.present) {
      map['had_yellow_fever'] = Variable<bool>(hadYellowFever.value);
    }
    if (hadMumps.present) {
      map['had_mumps'] = Variable<bool>(hadMumps.value);
    }
    if (hadChickenpox.present) {
      map['had_chickenpox'] = Variable<bool>(hadChickenpox.value);
    }
    if (hadMeasles.present) {
      map['had_measles'] = Variable<bool>(hadMeasles.value);
    }
    if (hadRubella.present) {
      map['had_rubella'] = Variable<bool>(hadRubella.value);
    }
    if (asthma.present) {
      map['asthma'] = Variable<bool>(asthma.value);
    }
    if (bronchitis.present) {
      map['bronchitis'] = Variable<bool>(bronchitis.value);
    }
    if (rhinitis.present) {
      map['rhinitis'] = Variable<bool>(rhinitis.value);
    }
    if (epilepsy.present) {
      map['epilepsy'] = Variable<bool>(epilepsy.value);
    }
    if (diabetes.present) {
      map['diabetes'] = Variable<bool>(diabetes.value);
    }
    if (hypertension.present) {
      map['hypertension'] = Variable<bool>(hypertension.value);
    }
    if (otherDiseases.present) {
      map['other_diseases'] = Variable<String>(otherDiseases.value);
    }
    if (physicalDisability.present) {
      map['physical_disability'] = Variable<String>(physicalDisability.value);
    }
    if (hearingDisability.present) {
      map['hearing_disability'] = Variable<String>(hearingDisability.value);
    }
    if (visualDisability.present) {
      map['visual_disability'] = Variable<String>(visualDisability.value);
    }
    if (autism.present) {
      map['autism'] = Variable<String>(autism.value);
    }
    if (adhd.present) {
      map['adhd'] = Variable<String>(adhd.value);
    }
    if (otherCondition.present) {
      map['other_condition'] = Variable<String>(otherCondition.value);
    }
    if (allergies.present) {
      map['allergies'] = Variable<String>(allergies.value);
    }
    if (drugAllergies.present) {
      map['drug_allergies'] = Variable<String>(drugAllergies.value);
    }
    if (foodAllergies.present) {
      map['food_allergies'] = Variable<String>(foodAllergies.value);
    }
    if (underMedicalTreatment.present) {
      map['under_medical_treatment'] = Variable<bool>(
        underMedicalTreatment.value,
      );
    }
    if (onContinuousMedication.present) {
      map['on_continuous_medication'] = Variable<bool>(
        onContinuousMedication.value,
      );
    }
    if (healthInsurance.present) {
      map['health_insurance'] = Variable<String>(healthInsurance.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HealthFormsCompanion(')
          ..write('id: $id, ')
          ..write('memberId: $memberId, ')
          ..write('hadCovid: $hadCovid, ')
          ..write('hadDengue: $hadDengue, ')
          ..write('hadYellowFever: $hadYellowFever, ')
          ..write('hadMumps: $hadMumps, ')
          ..write('hadChickenpox: $hadChickenpox, ')
          ..write('hadMeasles: $hadMeasles, ')
          ..write('hadRubella: $hadRubella, ')
          ..write('asthma: $asthma, ')
          ..write('bronchitis: $bronchitis, ')
          ..write('rhinitis: $rhinitis, ')
          ..write('epilepsy: $epilepsy, ')
          ..write('diabetes: $diabetes, ')
          ..write('hypertension: $hypertension, ')
          ..write('otherDiseases: $otherDiseases, ')
          ..write('physicalDisability: $physicalDisability, ')
          ..write('hearingDisability: $hearingDisability, ')
          ..write('visualDisability: $visualDisability, ')
          ..write('autism: $autism, ')
          ..write('adhd: $adhd, ')
          ..write('otherCondition: $otherCondition, ')
          ..write('allergies: $allergies, ')
          ..write('drugAllergies: $drugAllergies, ')
          ..write('foodAllergies: $foodAllergies, ')
          ..write('underMedicalTreatment: $underMedicalTreatment, ')
          ..write('onContinuousMedication: $onContinuousMedication, ')
          ..write('healthInsurance: $healthInsurance, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $DivisionsTable extends Divisions
    with TableInfo<$DivisionsTable, Division> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DivisionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _acronymMeta = const VerificationMeta(
    'acronym',
  );
  @override
  late final GeneratedColumn<String> acronym = GeneratedColumn<String>(
    'acronym',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    acronym,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'divisions';
  @override
  VerificationContext validateIntegrity(
    Insertable<Division> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('acronym')) {
      context.handle(
        _acronymMeta,
        acronym.isAcceptableOrUnknown(data['acronym']!, _acronymMeta),
      );
    } else if (isInserting) {
      context.missing(_acronymMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Division map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Division(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      acronym: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}acronym'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $DivisionsTable createAlias(String alias) {
    return $DivisionsTable(attachedDatabase, alias);
  }
}

class Division extends DataClass implements Insertable<Division> {
  final int id;
  final String name;
  final String acronym;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  const Division({
    required this.id,
    required this.name,
    required this.acronym,
    this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['acronym'] = Variable<String>(acronym);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  DivisionsCompanion toCompanion(bool nullToAbsent) {
    return DivisionsCompanion(
      id: Value(id),
      name: Value(name),
      acronym: Value(acronym),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory Division.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Division(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      acronym: serializer.fromJson<String>(json['acronym']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'acronym': serializer.toJson<String>(acronym),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  Division copyWith({
    int? id,
    String? name,
    String? acronym,
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => Division(
    id: id ?? this.id,
    name: name ?? this.name,
    acronym: acronym ?? this.acronym,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  Division copyWithCompanion(DivisionsCompanion data) {
    return Division(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      acronym: data.acronym.present ? data.acronym.value : this.acronym,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Division(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('acronym: $acronym, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, acronym, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Division &&
          other.id == this.id &&
          other.name == this.name &&
          other.acronym == this.acronym &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class DivisionsCompanion extends UpdateCompanion<Division> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> acronym;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  const DivisionsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.acronym = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  DivisionsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String acronym,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name),
       acronym = Value(acronym);
  static Insertable<Division> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? acronym,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (acronym != null) 'acronym': acronym,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  DivisionsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? acronym,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
  }) {
    return DivisionsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      acronym: acronym ?? this.acronym,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (acronym.present) {
      map['acronym'] = Variable<String>(acronym.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DivisionsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('acronym: $acronym, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $CountryDivisionsTable extends CountryDivisions
    with TableInfo<$CountryDivisionsTable, CountryDivision> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CountryDivisionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _countryMeta = const VerificationMeta(
    'country',
  );
  @override
  late final GeneratedColumn<String> country = GeneratedColumn<String>(
    'country',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _acronymMeta = const VerificationMeta(
    'acronym',
  );
  @override
  late final GeneratedColumn<String> acronym = GeneratedColumn<String>(
    'acronym',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _divisionIdMeta = const VerificationMeta(
    'divisionId',
  );
  @override
  late final GeneratedColumn<int> divisionId = GeneratedColumn<int>(
    'division_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES divisions (id)',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    country,
    acronym,
    divisionId,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'country_divisions';
  @override
  VerificationContext validateIntegrity(
    Insertable<CountryDivision> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('country')) {
      context.handle(
        _countryMeta,
        country.isAcceptableOrUnknown(data['country']!, _countryMeta),
      );
    } else if (isInserting) {
      context.missing(_countryMeta);
    }
    if (data.containsKey('acronym')) {
      context.handle(
        _acronymMeta,
        acronym.isAcceptableOrUnknown(data['acronym']!, _acronymMeta),
      );
    } else if (isInserting) {
      context.missing(_acronymMeta);
    }
    if (data.containsKey('division_id')) {
      context.handle(
        _divisionIdMeta,
        divisionId.isAcceptableOrUnknown(data['division_id']!, _divisionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_divisionIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CountryDivision map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CountryDivision(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      country: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}country'],
      )!,
      acronym: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}acronym'],
      )!,
      divisionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}division_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $CountryDivisionsTable createAlias(String alias) {
    return $CountryDivisionsTable(attachedDatabase, alias);
  }
}

class CountryDivision extends DataClass implements Insertable<CountryDivision> {
  final int id;
  final String country;
  final String acronym;
  final int divisionId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  const CountryDivision({
    required this.id,
    required this.country,
    required this.acronym,
    required this.divisionId,
    this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['country'] = Variable<String>(country);
    map['acronym'] = Variable<String>(acronym);
    map['division_id'] = Variable<int>(divisionId);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  CountryDivisionsCompanion toCompanion(bool nullToAbsent) {
    return CountryDivisionsCompanion(
      id: Value(id),
      country: Value(country),
      acronym: Value(acronym),
      divisionId: Value(divisionId),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory CountryDivision.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CountryDivision(
      id: serializer.fromJson<int>(json['id']),
      country: serializer.fromJson<String>(json['country']),
      acronym: serializer.fromJson<String>(json['acronym']),
      divisionId: serializer.fromJson<int>(json['divisionId']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'country': serializer.toJson<String>(country),
      'acronym': serializer.toJson<String>(acronym),
      'divisionId': serializer.toJson<int>(divisionId),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  CountryDivision copyWith({
    int? id,
    String? country,
    String? acronym,
    int? divisionId,
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => CountryDivision(
    id: id ?? this.id,
    country: country ?? this.country,
    acronym: acronym ?? this.acronym,
    divisionId: divisionId ?? this.divisionId,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  CountryDivision copyWithCompanion(CountryDivisionsCompanion data) {
    return CountryDivision(
      id: data.id.present ? data.id.value : this.id,
      country: data.country.present ? data.country.value : this.country,
      acronym: data.acronym.present ? data.acronym.value : this.acronym,
      divisionId: data.divisionId.present
          ? data.divisionId.value
          : this.divisionId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CountryDivision(')
          ..write('id: $id, ')
          ..write('country: $country, ')
          ..write('acronym: $acronym, ')
          ..write('divisionId: $divisionId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, country, acronym, divisionId, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CountryDivision &&
          other.id == this.id &&
          other.country == this.country &&
          other.acronym == this.acronym &&
          other.divisionId == this.divisionId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class CountryDivisionsCompanion extends UpdateCompanion<CountryDivision> {
  final Value<int> id;
  final Value<String> country;
  final Value<String> acronym;
  final Value<int> divisionId;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  const CountryDivisionsCompanion({
    this.id = const Value.absent(),
    this.country = const Value.absent(),
    this.acronym = const Value.absent(),
    this.divisionId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  CountryDivisionsCompanion.insert({
    this.id = const Value.absent(),
    required String country,
    required String acronym,
    required int divisionId,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : country = Value(country),
       acronym = Value(acronym),
       divisionId = Value(divisionId);
  static Insertable<CountryDivision> custom({
    Expression<int>? id,
    Expression<String>? country,
    Expression<String>? acronym,
    Expression<int>? divisionId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (country != null) 'country': country,
      if (acronym != null) 'acronym': acronym,
      if (divisionId != null) 'division_id': divisionId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  CountryDivisionsCompanion copyWith({
    Value<int>? id,
    Value<String>? country,
    Value<String>? acronym,
    Value<int>? divisionId,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
  }) {
    return CountryDivisionsCompanion(
      id: id ?? this.id,
      country: country ?? this.country,
      acronym: acronym ?? this.acronym,
      divisionId: divisionId ?? this.divisionId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (country.present) {
      map['country'] = Variable<String>(country.value);
    }
    if (acronym.present) {
      map['acronym'] = Variable<String>(acronym.value);
    }
    if (divisionId.present) {
      map['division_id'] = Variable<int>(divisionId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CountryDivisionsCompanion(')
          ..write('id: $id, ')
          ..write('country: $country, ')
          ..write('acronym: $acronym, ')
          ..write('divisionId: $divisionId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $UnionsTable extends Unions with TableInfo<$UnionsTable, Union> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UnionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _acronymMeta = const VerificationMeta(
    'acronym',
  );
  @override
  late final GeneratedColumn<String> acronym = GeneratedColumn<String>(
    'acronym',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _divisionIdMeta = const VerificationMeta(
    'divisionId',
  );
  @override
  late final GeneratedColumn<int> divisionId = GeneratedColumn<int>(
    'division_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES divisions (id)',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    acronym,
    divisionId,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'unions';
  @override
  VerificationContext validateIntegrity(
    Insertable<Union> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('acronym')) {
      context.handle(
        _acronymMeta,
        acronym.isAcceptableOrUnknown(data['acronym']!, _acronymMeta),
      );
    } else if (isInserting) {
      context.missing(_acronymMeta);
    }
    if (data.containsKey('division_id')) {
      context.handle(
        _divisionIdMeta,
        divisionId.isAcceptableOrUnknown(data['division_id']!, _divisionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_divisionIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Union map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Union(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      acronym: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}acronym'],
      )!,
      divisionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}division_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $UnionsTable createAlias(String alias) {
    return $UnionsTable(attachedDatabase, alias);
  }
}

class Union extends DataClass implements Insertable<Union> {
  final int id;
  final String name;
  final String acronym;
  final int divisionId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  const Union({
    required this.id,
    required this.name,
    required this.acronym,
    required this.divisionId,
    this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['acronym'] = Variable<String>(acronym);
    map['division_id'] = Variable<int>(divisionId);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  UnionsCompanion toCompanion(bool nullToAbsent) {
    return UnionsCompanion(
      id: Value(id),
      name: Value(name),
      acronym: Value(acronym),
      divisionId: Value(divisionId),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory Union.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Union(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      acronym: serializer.fromJson<String>(json['acronym']),
      divisionId: serializer.fromJson<int>(json['divisionId']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'acronym': serializer.toJson<String>(acronym),
      'divisionId': serializer.toJson<int>(divisionId),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  Union copyWith({
    int? id,
    String? name,
    String? acronym,
    int? divisionId,
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => Union(
    id: id ?? this.id,
    name: name ?? this.name,
    acronym: acronym ?? this.acronym,
    divisionId: divisionId ?? this.divisionId,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  Union copyWithCompanion(UnionsCompanion data) {
    return Union(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      acronym: data.acronym.present ? data.acronym.value : this.acronym,
      divisionId: data.divisionId.present
          ? data.divisionId.value
          : this.divisionId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Union(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('acronym: $acronym, ')
          ..write('divisionId: $divisionId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, acronym, divisionId, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Union &&
          other.id == this.id &&
          other.name == this.name &&
          other.acronym == this.acronym &&
          other.divisionId == this.divisionId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class UnionsCompanion extends UpdateCompanion<Union> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> acronym;
  final Value<int> divisionId;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  const UnionsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.acronym = const Value.absent(),
    this.divisionId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  UnionsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String acronym,
    required int divisionId,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name),
       acronym = Value(acronym),
       divisionId = Value(divisionId);
  static Insertable<Union> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? acronym,
    Expression<int>? divisionId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (acronym != null) 'acronym': acronym,
      if (divisionId != null) 'division_id': divisionId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  UnionsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? acronym,
    Value<int>? divisionId,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
  }) {
    return UnionsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      acronym: acronym ?? this.acronym,
      divisionId: divisionId ?? this.divisionId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (acronym.present) {
      map['acronym'] = Variable<String>(acronym.value);
    }
    if (divisionId.present) {
      map['division_id'] = Variable<int>(divisionId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UnionsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('acronym: $acronym, ')
          ..write('divisionId: $divisionId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $StateUnionsTable extends StateUnions
    with TableInfo<$StateUnionsTable, StateUnion> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StateUnionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _stateMeta = const VerificationMeta('state');
  @override
  late final GeneratedColumn<String> state = GeneratedColumn<String>(
    'state',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _acronymMeta = const VerificationMeta(
    'acronym',
  );
  @override
  late final GeneratedColumn<String> acronym = GeneratedColumn<String>(
    'acronym',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unionIdMeta = const VerificationMeta(
    'unionId',
  );
  @override
  late final GeneratedColumn<int> unionId = GeneratedColumn<int>(
    'union_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES unions (id)',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    state,
    acronym,
    unionId,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'state_unions';
  @override
  VerificationContext validateIntegrity(
    Insertable<StateUnion> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('state')) {
      context.handle(
        _stateMeta,
        state.isAcceptableOrUnknown(data['state']!, _stateMeta),
      );
    } else if (isInserting) {
      context.missing(_stateMeta);
    }
    if (data.containsKey('acronym')) {
      context.handle(
        _acronymMeta,
        acronym.isAcceptableOrUnknown(data['acronym']!, _acronymMeta),
      );
    } else if (isInserting) {
      context.missing(_acronymMeta);
    }
    if (data.containsKey('union_id')) {
      context.handle(
        _unionIdMeta,
        unionId.isAcceptableOrUnknown(data['union_id']!, _unionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_unionIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StateUnion map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StateUnion(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      state: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}state'],
      )!,
      acronym: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}acronym'],
      )!,
      unionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}union_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $StateUnionsTable createAlias(String alias) {
    return $StateUnionsTable(attachedDatabase, alias);
  }
}

class StateUnion extends DataClass implements Insertable<StateUnion> {
  final int id;
  final String state;
  final String acronym;
  final int unionId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  const StateUnion({
    required this.id,
    required this.state,
    required this.acronym,
    required this.unionId,
    this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['state'] = Variable<String>(state);
    map['acronym'] = Variable<String>(acronym);
    map['union_id'] = Variable<int>(unionId);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  StateUnionsCompanion toCompanion(bool nullToAbsent) {
    return StateUnionsCompanion(
      id: Value(id),
      state: Value(state),
      acronym: Value(acronym),
      unionId: Value(unionId),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory StateUnion.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StateUnion(
      id: serializer.fromJson<int>(json['id']),
      state: serializer.fromJson<String>(json['state']),
      acronym: serializer.fromJson<String>(json['acronym']),
      unionId: serializer.fromJson<int>(json['unionId']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'state': serializer.toJson<String>(state),
      'acronym': serializer.toJson<String>(acronym),
      'unionId': serializer.toJson<int>(unionId),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  StateUnion copyWith({
    int? id,
    String? state,
    String? acronym,
    int? unionId,
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => StateUnion(
    id: id ?? this.id,
    state: state ?? this.state,
    acronym: acronym ?? this.acronym,
    unionId: unionId ?? this.unionId,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  StateUnion copyWithCompanion(StateUnionsCompanion data) {
    return StateUnion(
      id: data.id.present ? data.id.value : this.id,
      state: data.state.present ? data.state.value : this.state,
      acronym: data.acronym.present ? data.acronym.value : this.acronym,
      unionId: data.unionId.present ? data.unionId.value : this.unionId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StateUnion(')
          ..write('id: $id, ')
          ..write('state: $state, ')
          ..write('acronym: $acronym, ')
          ..write('unionId: $unionId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, state, acronym, unionId, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StateUnion &&
          other.id == this.id &&
          other.state == this.state &&
          other.acronym == this.acronym &&
          other.unionId == this.unionId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class StateUnionsCompanion extends UpdateCompanion<StateUnion> {
  final Value<int> id;
  final Value<String> state;
  final Value<String> acronym;
  final Value<int> unionId;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  const StateUnionsCompanion({
    this.id = const Value.absent(),
    this.state = const Value.absent(),
    this.acronym = const Value.absent(),
    this.unionId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  StateUnionsCompanion.insert({
    this.id = const Value.absent(),
    required String state,
    required String acronym,
    required int unionId,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : state = Value(state),
       acronym = Value(acronym),
       unionId = Value(unionId);
  static Insertable<StateUnion> custom({
    Expression<int>? id,
    Expression<String>? state,
    Expression<String>? acronym,
    Expression<int>? unionId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (state != null) 'state': state,
      if (acronym != null) 'acronym': acronym,
      if (unionId != null) 'union_id': unionId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  StateUnionsCompanion copyWith({
    Value<int>? id,
    Value<String>? state,
    Value<String>? acronym,
    Value<int>? unionId,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
  }) {
    return StateUnionsCompanion(
      id: id ?? this.id,
      state: state ?? this.state,
      acronym: acronym ?? this.acronym,
      unionId: unionId ?? this.unionId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(state.value);
    }
    if (acronym.present) {
      map['acronym'] = Variable<String>(acronym.value);
    }
    if (unionId.present) {
      map['union_id'] = Variable<int>(unionId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StateUnionsCompanion(')
          ..write('id: $id, ')
          ..write('state: $state, ')
          ..write('acronym: $acronym, ')
          ..write('unionId: $unionId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $AssociationsTable extends Associations
    with TableInfo<$AssociationsTable, Association> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AssociationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _acronymMeta = const VerificationMeta(
    'acronym',
  );
  @override
  late final GeneratedColumn<String> acronym = GeneratedColumn<String>(
    'acronym',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unionIdMeta = const VerificationMeta(
    'unionId',
  );
  @override
  late final GeneratedColumn<int> unionId = GeneratedColumn<int>(
    'union_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES unions (id)',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    acronym,
    unionId,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'associations';
  @override
  VerificationContext validateIntegrity(
    Insertable<Association> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('acronym')) {
      context.handle(
        _acronymMeta,
        acronym.isAcceptableOrUnknown(data['acronym']!, _acronymMeta),
      );
    } else if (isInserting) {
      context.missing(_acronymMeta);
    }
    if (data.containsKey('union_id')) {
      context.handle(
        _unionIdMeta,
        unionId.isAcceptableOrUnknown(data['union_id']!, _unionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_unionIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Association map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Association(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      acronym: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}acronym'],
      )!,
      unionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}union_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $AssociationsTable createAlias(String alias) {
    return $AssociationsTable(attachedDatabase, alias);
  }
}

class Association extends DataClass implements Insertable<Association> {
  final int id;
  final String name;
  final String acronym;
  final int unionId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  const Association({
    required this.id,
    required this.name,
    required this.acronym,
    required this.unionId,
    this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['acronym'] = Variable<String>(acronym);
    map['union_id'] = Variable<int>(unionId);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  AssociationsCompanion toCompanion(bool nullToAbsent) {
    return AssociationsCompanion(
      id: Value(id),
      name: Value(name),
      acronym: Value(acronym),
      unionId: Value(unionId),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory Association.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Association(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      acronym: serializer.fromJson<String>(json['acronym']),
      unionId: serializer.fromJson<int>(json['unionId']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'acronym': serializer.toJson<String>(acronym),
      'unionId': serializer.toJson<int>(unionId),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  Association copyWith({
    int? id,
    String? name,
    String? acronym,
    int? unionId,
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => Association(
    id: id ?? this.id,
    name: name ?? this.name,
    acronym: acronym ?? this.acronym,
    unionId: unionId ?? this.unionId,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  Association copyWithCompanion(AssociationsCompanion data) {
    return Association(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      acronym: data.acronym.present ? data.acronym.value : this.acronym,
      unionId: data.unionId.present ? data.unionId.value : this.unionId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Association(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('acronym: $acronym, ')
          ..write('unionId: $unionId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, acronym, unionId, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Association &&
          other.id == this.id &&
          other.name == this.name &&
          other.acronym == this.acronym &&
          other.unionId == this.unionId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class AssociationsCompanion extends UpdateCompanion<Association> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> acronym;
  final Value<int> unionId;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  const AssociationsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.acronym = const Value.absent(),
    this.unionId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  AssociationsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String acronym,
    required int unionId,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name),
       acronym = Value(acronym),
       unionId = Value(unionId);
  static Insertable<Association> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? acronym,
    Expression<int>? unionId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (acronym != null) 'acronym': acronym,
      if (unionId != null) 'union_id': unionId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  AssociationsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? acronym,
    Value<int>? unionId,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
  }) {
    return AssociationsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      acronym: acronym ?? this.acronym,
      unionId: unionId ?? this.unionId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (acronym.present) {
      map['acronym'] = Variable<String>(acronym.value);
    }
    if (unionId.present) {
      map['union_id'] = Variable<int>(unionId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AssociationsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('acronym: $acronym, ')
          ..write('unionId: $unionId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $RegionsTable extends Regions with TableInfo<$RegionsTable, Region> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RegionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _acronymMeta = const VerificationMeta(
    'acronym',
  );
  @override
  late final GeneratedColumn<String> acronym = GeneratedColumn<String>(
    'acronym',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _associationIdMeta = const VerificationMeta(
    'associationId',
  );
  @override
  late final GeneratedColumn<int> associationId = GeneratedColumn<int>(
    'association_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES associations (id)',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    acronym,
    associationId,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'regions';
  @override
  VerificationContext validateIntegrity(
    Insertable<Region> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('acronym')) {
      context.handle(
        _acronymMeta,
        acronym.isAcceptableOrUnknown(data['acronym']!, _acronymMeta),
      );
    } else if (isInserting) {
      context.missing(_acronymMeta);
    }
    if (data.containsKey('association_id')) {
      context.handle(
        _associationIdMeta,
        associationId.isAcceptableOrUnknown(
          data['association_id']!,
          _associationIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_associationIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Region map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Region(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      acronym: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}acronym'],
      )!,
      associationId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}association_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $RegionsTable createAlias(String alias) {
    return $RegionsTable(attachedDatabase, alias);
  }
}

class Region extends DataClass implements Insertable<Region> {
  final int id;
  final String name;
  final String acronym;
  final int associationId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  const Region({
    required this.id,
    required this.name,
    required this.acronym,
    required this.associationId,
    this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['acronym'] = Variable<String>(acronym);
    map['association_id'] = Variable<int>(associationId);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  RegionsCompanion toCompanion(bool nullToAbsent) {
    return RegionsCompanion(
      id: Value(id),
      name: Value(name),
      acronym: Value(acronym),
      associationId: Value(associationId),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory Region.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Region(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      acronym: serializer.fromJson<String>(json['acronym']),
      associationId: serializer.fromJson<int>(json['associationId']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'acronym': serializer.toJson<String>(acronym),
      'associationId': serializer.toJson<int>(associationId),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  Region copyWith({
    int? id,
    String? name,
    String? acronym,
    int? associationId,
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => Region(
    id: id ?? this.id,
    name: name ?? this.name,
    acronym: acronym ?? this.acronym,
    associationId: associationId ?? this.associationId,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  Region copyWithCompanion(RegionsCompanion data) {
    return Region(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      acronym: data.acronym.present ? data.acronym.value : this.acronym,
      associationId: data.associationId.present
          ? data.associationId.value
          : this.associationId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Region(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('acronym: $acronym, ')
          ..write('associationId: $associationId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, acronym, associationId, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Region &&
          other.id == this.id &&
          other.name == this.name &&
          other.acronym == this.acronym &&
          other.associationId == this.associationId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class RegionsCompanion extends UpdateCompanion<Region> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> acronym;
  final Value<int> associationId;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  const RegionsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.acronym = const Value.absent(),
    this.associationId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  RegionsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String acronym,
    required int associationId,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name),
       acronym = Value(acronym),
       associationId = Value(associationId);
  static Insertable<Region> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? acronym,
    Expression<int>? associationId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (acronym != null) 'acronym': acronym,
      if (associationId != null) 'association_id': associationId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  RegionsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? acronym,
    Value<int>? associationId,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
  }) {
    return RegionsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      acronym: acronym ?? this.acronym,
      associationId: associationId ?? this.associationId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (acronym.present) {
      map['acronym'] = Variable<String>(acronym.value);
    }
    if (associationId.present) {
      map['association_id'] = Variable<int>(associationId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RegionsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('acronym: $acronym, ')
          ..write('associationId: $associationId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $DistrictsTable extends Districts
    with TableInfo<$DistrictsTable, District> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DistrictsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _acronymMeta = const VerificationMeta(
    'acronym',
  );
  @override
  late final GeneratedColumn<String> acronym = GeneratedColumn<String>(
    'acronym',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _regionIdMeta = const VerificationMeta(
    'regionId',
  );
  @override
  late final GeneratedColumn<int> regionId = GeneratedColumn<int>(
    'region_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES regions (id)',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    acronym,
    regionId,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'districts';
  @override
  VerificationContext validateIntegrity(
    Insertable<District> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('acronym')) {
      context.handle(
        _acronymMeta,
        acronym.isAcceptableOrUnknown(data['acronym']!, _acronymMeta),
      );
    } else if (isInserting) {
      context.missing(_acronymMeta);
    }
    if (data.containsKey('region_id')) {
      context.handle(
        _regionIdMeta,
        regionId.isAcceptableOrUnknown(data['region_id']!, _regionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_regionIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  District map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return District(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      acronym: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}acronym'],
      )!,
      regionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}region_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $DistrictsTable createAlias(String alias) {
    return $DistrictsTable(attachedDatabase, alias);
  }
}

class District extends DataClass implements Insertable<District> {
  final int id;
  final String name;
  final String acronym;
  final int regionId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  const District({
    required this.id,
    required this.name,
    required this.acronym,
    required this.regionId,
    this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['acronym'] = Variable<String>(acronym);
    map['region_id'] = Variable<int>(regionId);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  DistrictsCompanion toCompanion(bool nullToAbsent) {
    return DistrictsCompanion(
      id: Value(id),
      name: Value(name),
      acronym: Value(acronym),
      regionId: Value(regionId),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory District.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return District(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      acronym: serializer.fromJson<String>(json['acronym']),
      regionId: serializer.fromJson<int>(json['regionId']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'acronym': serializer.toJson<String>(acronym),
      'regionId': serializer.toJson<int>(regionId),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  District copyWith({
    int? id,
    String? name,
    String? acronym,
    int? regionId,
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => District(
    id: id ?? this.id,
    name: name ?? this.name,
    acronym: acronym ?? this.acronym,
    regionId: regionId ?? this.regionId,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  District copyWithCompanion(DistrictsCompanion data) {
    return District(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      acronym: data.acronym.present ? data.acronym.value : this.acronym,
      regionId: data.regionId.present ? data.regionId.value : this.regionId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('District(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('acronym: $acronym, ')
          ..write('regionId: $regionId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, acronym, regionId, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is District &&
          other.id == this.id &&
          other.name == this.name &&
          other.acronym == this.acronym &&
          other.regionId == this.regionId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class DistrictsCompanion extends UpdateCompanion<District> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> acronym;
  final Value<int> regionId;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  const DistrictsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.acronym = const Value.absent(),
    this.regionId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  DistrictsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String acronym,
    required int regionId,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name),
       acronym = Value(acronym),
       regionId = Value(regionId);
  static Insertable<District> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? acronym,
    Expression<int>? regionId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (acronym != null) 'acronym': acronym,
      if (regionId != null) 'region_id': regionId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  DistrictsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? acronym,
    Value<int>? regionId,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
  }) {
    return DistrictsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      acronym: acronym ?? this.acronym,
      regionId: regionId ?? this.regionId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (acronym.present) {
      map['acronym'] = Variable<String>(acronym.value);
    }
    if (regionId.present) {
      map['region_id'] = Variable<int>(regionId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DistrictsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('acronym: $acronym, ')
          ..write('regionId: $regionId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $ChurchesTable extends Churches with TableInfo<$ChurchesTable, Church> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChurchesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _districtIdMeta = const VerificationMeta(
    'districtId',
  );
  @override
  late final GeneratedColumn<int> districtId = GeneratedColumn<int>(
    'district_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES districts (id)',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    districtId,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'churches';
  @override
  VerificationContext validateIntegrity(
    Insertable<Church> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('district_id')) {
      context.handle(
        _districtIdMeta,
        districtId.isAcceptableOrUnknown(data['district_id']!, _districtIdMeta),
      );
    } else if (isInserting) {
      context.missing(_districtIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Church map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Church(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      districtId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}district_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $ChurchesTable createAlias(String alias) {
    return $ChurchesTable(attachedDatabase, alias);
  }
}

class Church extends DataClass implements Insertable<Church> {
  final int id;
  final String name;
  final int districtId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  const Church({
    required this.id,
    required this.name,
    required this.districtId,
    this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['district_id'] = Variable<int>(districtId);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  ChurchesCompanion toCompanion(bool nullToAbsent) {
    return ChurchesCompanion(
      id: Value(id),
      name: Value(name),
      districtId: Value(districtId),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory Church.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Church(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      districtId: serializer.fromJson<int>(json['districtId']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'districtId': serializer.toJson<int>(districtId),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  Church copyWith({
    int? id,
    String? name,
    int? districtId,
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => Church(
    id: id ?? this.id,
    name: name ?? this.name,
    districtId: districtId ?? this.districtId,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  Church copyWithCompanion(ChurchesCompanion data) {
    return Church(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      districtId: data.districtId.present
          ? data.districtId.value
          : this.districtId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Church(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('districtId: $districtId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, districtId, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Church &&
          other.id == this.id &&
          other.name == this.name &&
          other.districtId == this.districtId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ChurchesCompanion extends UpdateCompanion<Church> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> districtId;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  const ChurchesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.districtId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  ChurchesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int districtId,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name),
       districtId = Value(districtId);
  static Insertable<Church> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? districtId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (districtId != null) 'district_id': districtId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  ChurchesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int>? districtId,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
  }) {
    return ChurchesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      districtId: districtId ?? this.districtId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (districtId.present) {
      map['district_id'] = Variable<int>(districtId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChurchesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('districtId: $districtId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $ClubsTable extends Clubs with TableInfo<$ClubsTable, Club> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClubsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateFundationMeta = const VerificationMeta(
    'dateFundation',
  );
  @override
  late final GeneratedColumn<DateTime> dateFundation =
      GeneratedColumn<DateTime>(
        'date_fundation',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _symbolMeta = const VerificationMeta('symbol');
  @override
  late final GeneratedColumn<String> symbol = GeneratedColumn<String>(
    'symbol',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _historyMeta = const VerificationMeta(
    'history',
  );
  @override
  late final GeneratedColumn<String> history = GeneratedColumn<String>(
    'history',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cepMeta = const VerificationMeta('cep');
  @override
  late final GeneratedColumn<String> cep = GeneratedColumn<String>(
    'cep',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _streetMeta = const VerificationMeta('street');
  @override
  late final GeneratedColumn<String> street = GeneratedColumn<String>(
    'street',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<String> number = GeneratedColumn<String>(
    'number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _neighborhoodMeta = const VerificationMeta(
    'neighborhood',
  );
  @override
  late final GeneratedColumn<String> neighborhood = GeneratedColumn<String>(
    'neighborhood',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
    'city',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _stateMeta = const VerificationMeta('state');
  @override
  late final GeneratedColumn<String> state = GeneratedColumn<String>(
    'state',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _complementMeta = const VerificationMeta(
    'complement',
  );
  @override
  late final GeneratedColumn<String> complement = GeneratedColumn<String>(
    'complement',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _churchIdMeta = const VerificationMeta(
    'churchId',
  );
  @override
  late final GeneratedColumn<int> churchId = GeneratedColumn<int>(
    'church_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES churches (id)',
    ),
  );
  static const VerificationMeta _districtIdMeta = const VerificationMeta(
    'districtId',
  );
  @override
  late final GeneratedColumn<int> districtId = GeneratedColumn<int>(
    'district_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES districts (id)',
    ),
  );
  static const VerificationMeta _starsMeta = const VerificationMeta('stars');
  @override
  late final GeneratedColumn<int> stars = GeneratedColumn<int>(
    'stars',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    dateFundation,
    symbol,
    history,
    cep,
    street,
    number,
    neighborhood,
    city,
    state,
    complement,
    churchId,
    districtId,
    stars,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'clubs';
  @override
  VerificationContext validateIntegrity(
    Insertable<Club> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('date_fundation')) {
      context.handle(
        _dateFundationMeta,
        dateFundation.isAcceptableOrUnknown(
          data['date_fundation']!,
          _dateFundationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_dateFundationMeta);
    }
    if (data.containsKey('symbol')) {
      context.handle(
        _symbolMeta,
        symbol.isAcceptableOrUnknown(data['symbol']!, _symbolMeta),
      );
    }
    if (data.containsKey('history')) {
      context.handle(
        _historyMeta,
        history.isAcceptableOrUnknown(data['history']!, _historyMeta),
      );
    }
    if (data.containsKey('cep')) {
      context.handle(
        _cepMeta,
        cep.isAcceptableOrUnknown(data['cep']!, _cepMeta),
      );
    }
    if (data.containsKey('street')) {
      context.handle(
        _streetMeta,
        street.isAcceptableOrUnknown(data['street']!, _streetMeta),
      );
    }
    if (data.containsKey('number')) {
      context.handle(
        _numberMeta,
        number.isAcceptableOrUnknown(data['number']!, _numberMeta),
      );
    }
    if (data.containsKey('neighborhood')) {
      context.handle(
        _neighborhoodMeta,
        neighborhood.isAcceptableOrUnknown(
          data['neighborhood']!,
          _neighborhoodMeta,
        ),
      );
    }
    if (data.containsKey('city')) {
      context.handle(
        _cityMeta,
        city.isAcceptableOrUnknown(data['city']!, _cityMeta),
      );
    }
    if (data.containsKey('state')) {
      context.handle(
        _stateMeta,
        state.isAcceptableOrUnknown(data['state']!, _stateMeta),
      );
    }
    if (data.containsKey('complement')) {
      context.handle(
        _complementMeta,
        complement.isAcceptableOrUnknown(data['complement']!, _complementMeta),
      );
    }
    if (data.containsKey('church_id')) {
      context.handle(
        _churchIdMeta,
        churchId.isAcceptableOrUnknown(data['church_id']!, _churchIdMeta),
      );
    } else if (isInserting) {
      context.missing(_churchIdMeta);
    }
    if (data.containsKey('district_id')) {
      context.handle(
        _districtIdMeta,
        districtId.isAcceptableOrUnknown(data['district_id']!, _districtIdMeta),
      );
    } else if (isInserting) {
      context.missing(_districtIdMeta);
    }
    if (data.containsKey('stars')) {
      context.handle(
        _starsMeta,
        stars.isAcceptableOrUnknown(data['stars']!, _starsMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Club map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Club(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      dateFundation: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_fundation'],
      )!,
      symbol: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}symbol'],
      ),
      history: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}history'],
      ),
      cep: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cep'],
      ),
      street: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}street'],
      ),
      number: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}number'],
      ),
      neighborhood: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}neighborhood'],
      ),
      city: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}city'],
      ),
      state: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}state'],
      ),
      complement: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}complement'],
      ),
      churchId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}church_id'],
      )!,
      districtId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}district_id'],
      )!,
      stars: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stars'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $ClubsTable createAlias(String alias) {
    return $ClubsTable(attachedDatabase, alias);
  }
}

class Club extends DataClass implements Insertable<Club> {
  final int id;
  final String name;
  final DateTime dateFundation;
  final String? symbol;
  final String? history;
  final String? cep;
  final String? street;
  final String? number;
  final String? neighborhood;
  final String? city;
  final String? state;
  final String? complement;
  final int churchId;
  final int districtId;
  final int stars;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  const Club({
    required this.id,
    required this.name,
    required this.dateFundation,
    this.symbol,
    this.history,
    this.cep,
    this.street,
    this.number,
    this.neighborhood,
    this.city,
    this.state,
    this.complement,
    required this.churchId,
    required this.districtId,
    required this.stars,
    this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['date_fundation'] = Variable<DateTime>(dateFundation);
    if (!nullToAbsent || symbol != null) {
      map['symbol'] = Variable<String>(symbol);
    }
    if (!nullToAbsent || history != null) {
      map['history'] = Variable<String>(history);
    }
    if (!nullToAbsent || cep != null) {
      map['cep'] = Variable<String>(cep);
    }
    if (!nullToAbsent || street != null) {
      map['street'] = Variable<String>(street);
    }
    if (!nullToAbsent || number != null) {
      map['number'] = Variable<String>(number);
    }
    if (!nullToAbsent || neighborhood != null) {
      map['neighborhood'] = Variable<String>(neighborhood);
    }
    if (!nullToAbsent || city != null) {
      map['city'] = Variable<String>(city);
    }
    if (!nullToAbsent || state != null) {
      map['state'] = Variable<String>(state);
    }
    if (!nullToAbsent || complement != null) {
      map['complement'] = Variable<String>(complement);
    }
    map['church_id'] = Variable<int>(churchId);
    map['district_id'] = Variable<int>(districtId);
    map['stars'] = Variable<int>(stars);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  ClubsCompanion toCompanion(bool nullToAbsent) {
    return ClubsCompanion(
      id: Value(id),
      name: Value(name),
      dateFundation: Value(dateFundation),
      symbol: symbol == null && nullToAbsent
          ? const Value.absent()
          : Value(symbol),
      history: history == null && nullToAbsent
          ? const Value.absent()
          : Value(history),
      cep: cep == null && nullToAbsent ? const Value.absent() : Value(cep),
      street: street == null && nullToAbsent
          ? const Value.absent()
          : Value(street),
      number: number == null && nullToAbsent
          ? const Value.absent()
          : Value(number),
      neighborhood: neighborhood == null && nullToAbsent
          ? const Value.absent()
          : Value(neighborhood),
      city: city == null && nullToAbsent ? const Value.absent() : Value(city),
      state: state == null && nullToAbsent
          ? const Value.absent()
          : Value(state),
      complement: complement == null && nullToAbsent
          ? const Value.absent()
          : Value(complement),
      churchId: Value(churchId),
      districtId: Value(districtId),
      stars: Value(stars),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory Club.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Club(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      dateFundation: serializer.fromJson<DateTime>(json['dateFundation']),
      symbol: serializer.fromJson<String?>(json['symbol']),
      history: serializer.fromJson<String?>(json['history']),
      cep: serializer.fromJson<String?>(json['cep']),
      street: serializer.fromJson<String?>(json['street']),
      number: serializer.fromJson<String?>(json['number']),
      neighborhood: serializer.fromJson<String?>(json['neighborhood']),
      city: serializer.fromJson<String?>(json['city']),
      state: serializer.fromJson<String?>(json['state']),
      complement: serializer.fromJson<String?>(json['complement']),
      churchId: serializer.fromJson<int>(json['churchId']),
      districtId: serializer.fromJson<int>(json['districtId']),
      stars: serializer.fromJson<int>(json['stars']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'dateFundation': serializer.toJson<DateTime>(dateFundation),
      'symbol': serializer.toJson<String?>(symbol),
      'history': serializer.toJson<String?>(history),
      'cep': serializer.toJson<String?>(cep),
      'street': serializer.toJson<String?>(street),
      'number': serializer.toJson<String?>(number),
      'neighborhood': serializer.toJson<String?>(neighborhood),
      'city': serializer.toJson<String?>(city),
      'state': serializer.toJson<String?>(state),
      'complement': serializer.toJson<String?>(complement),
      'churchId': serializer.toJson<int>(churchId),
      'districtId': serializer.toJson<int>(districtId),
      'stars': serializer.toJson<int>(stars),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  Club copyWith({
    int? id,
    String? name,
    DateTime? dateFundation,
    Value<String?> symbol = const Value.absent(),
    Value<String?> history = const Value.absent(),
    Value<String?> cep = const Value.absent(),
    Value<String?> street = const Value.absent(),
    Value<String?> number = const Value.absent(),
    Value<String?> neighborhood = const Value.absent(),
    Value<String?> city = const Value.absent(),
    Value<String?> state = const Value.absent(),
    Value<String?> complement = const Value.absent(),
    int? churchId,
    int? districtId,
    int? stars,
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => Club(
    id: id ?? this.id,
    name: name ?? this.name,
    dateFundation: dateFundation ?? this.dateFundation,
    symbol: symbol.present ? symbol.value : this.symbol,
    history: history.present ? history.value : this.history,
    cep: cep.present ? cep.value : this.cep,
    street: street.present ? street.value : this.street,
    number: number.present ? number.value : this.number,
    neighborhood: neighborhood.present ? neighborhood.value : this.neighborhood,
    city: city.present ? city.value : this.city,
    state: state.present ? state.value : this.state,
    complement: complement.present ? complement.value : this.complement,
    churchId: churchId ?? this.churchId,
    districtId: districtId ?? this.districtId,
    stars: stars ?? this.stars,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  Club copyWithCompanion(ClubsCompanion data) {
    return Club(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      dateFundation: data.dateFundation.present
          ? data.dateFundation.value
          : this.dateFundation,
      symbol: data.symbol.present ? data.symbol.value : this.symbol,
      history: data.history.present ? data.history.value : this.history,
      cep: data.cep.present ? data.cep.value : this.cep,
      street: data.street.present ? data.street.value : this.street,
      number: data.number.present ? data.number.value : this.number,
      neighborhood: data.neighborhood.present
          ? data.neighborhood.value
          : this.neighborhood,
      city: data.city.present ? data.city.value : this.city,
      state: data.state.present ? data.state.value : this.state,
      complement: data.complement.present
          ? data.complement.value
          : this.complement,
      churchId: data.churchId.present ? data.churchId.value : this.churchId,
      districtId: data.districtId.present
          ? data.districtId.value
          : this.districtId,
      stars: data.stars.present ? data.stars.value : this.stars,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Club(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('dateFundation: $dateFundation, ')
          ..write('symbol: $symbol, ')
          ..write('history: $history, ')
          ..write('cep: $cep, ')
          ..write('street: $street, ')
          ..write('number: $number, ')
          ..write('neighborhood: $neighborhood, ')
          ..write('city: $city, ')
          ..write('state: $state, ')
          ..write('complement: $complement, ')
          ..write('churchId: $churchId, ')
          ..write('districtId: $districtId, ')
          ..write('stars: $stars, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    dateFundation,
    symbol,
    history,
    cep,
    street,
    number,
    neighborhood,
    city,
    state,
    complement,
    churchId,
    districtId,
    stars,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Club &&
          other.id == this.id &&
          other.name == this.name &&
          other.dateFundation == this.dateFundation &&
          other.symbol == this.symbol &&
          other.history == this.history &&
          other.cep == this.cep &&
          other.street == this.street &&
          other.number == this.number &&
          other.neighborhood == this.neighborhood &&
          other.city == this.city &&
          other.state == this.state &&
          other.complement == this.complement &&
          other.churchId == this.churchId &&
          other.districtId == this.districtId &&
          other.stars == this.stars &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ClubsCompanion extends UpdateCompanion<Club> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> dateFundation;
  final Value<String?> symbol;
  final Value<String?> history;
  final Value<String?> cep;
  final Value<String?> street;
  final Value<String?> number;
  final Value<String?> neighborhood;
  final Value<String?> city;
  final Value<String?> state;
  final Value<String?> complement;
  final Value<int> churchId;
  final Value<int> districtId;
  final Value<int> stars;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  const ClubsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.dateFundation = const Value.absent(),
    this.symbol = const Value.absent(),
    this.history = const Value.absent(),
    this.cep = const Value.absent(),
    this.street = const Value.absent(),
    this.number = const Value.absent(),
    this.neighborhood = const Value.absent(),
    this.city = const Value.absent(),
    this.state = const Value.absent(),
    this.complement = const Value.absent(),
    this.churchId = const Value.absent(),
    this.districtId = const Value.absent(),
    this.stars = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  ClubsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required DateTime dateFundation,
    this.symbol = const Value.absent(),
    this.history = const Value.absent(),
    this.cep = const Value.absent(),
    this.street = const Value.absent(),
    this.number = const Value.absent(),
    this.neighborhood = const Value.absent(),
    this.city = const Value.absent(),
    this.state = const Value.absent(),
    this.complement = const Value.absent(),
    required int churchId,
    required int districtId,
    this.stars = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name),
       dateFundation = Value(dateFundation),
       churchId = Value(churchId),
       districtId = Value(districtId);
  static Insertable<Club> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? dateFundation,
    Expression<String>? symbol,
    Expression<String>? history,
    Expression<String>? cep,
    Expression<String>? street,
    Expression<String>? number,
    Expression<String>? neighborhood,
    Expression<String>? city,
    Expression<String>? state,
    Expression<String>? complement,
    Expression<int>? churchId,
    Expression<int>? districtId,
    Expression<int>? stars,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (dateFundation != null) 'date_fundation': dateFundation,
      if (symbol != null) 'symbol': symbol,
      if (history != null) 'history': history,
      if (cep != null) 'cep': cep,
      if (street != null) 'street': street,
      if (number != null) 'number': number,
      if (neighborhood != null) 'neighborhood': neighborhood,
      if (city != null) 'city': city,
      if (state != null) 'state': state,
      if (complement != null) 'complement': complement,
      if (churchId != null) 'church_id': churchId,
      if (districtId != null) 'district_id': districtId,
      if (stars != null) 'stars': stars,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  ClubsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<DateTime>? dateFundation,
    Value<String?>? symbol,
    Value<String?>? history,
    Value<String?>? cep,
    Value<String?>? street,
    Value<String?>? number,
    Value<String?>? neighborhood,
    Value<String?>? city,
    Value<String?>? state,
    Value<String?>? complement,
    Value<int>? churchId,
    Value<int>? districtId,
    Value<int>? stars,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
  }) {
    return ClubsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      dateFundation: dateFundation ?? this.dateFundation,
      symbol: symbol ?? this.symbol,
      history: history ?? this.history,
      cep: cep ?? this.cep,
      street: street ?? this.street,
      number: number ?? this.number,
      neighborhood: neighborhood ?? this.neighborhood,
      city: city ?? this.city,
      state: state ?? this.state,
      complement: complement ?? this.complement,
      churchId: churchId ?? this.churchId,
      districtId: districtId ?? this.districtId,
      stars: stars ?? this.stars,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (dateFundation.present) {
      map['date_fundation'] = Variable<DateTime>(dateFundation.value);
    }
    if (symbol.present) {
      map['symbol'] = Variable<String>(symbol.value);
    }
    if (history.present) {
      map['history'] = Variable<String>(history.value);
    }
    if (cep.present) {
      map['cep'] = Variable<String>(cep.value);
    }
    if (street.present) {
      map['street'] = Variable<String>(street.value);
    }
    if (number.present) {
      map['number'] = Variable<String>(number.value);
    }
    if (neighborhood.present) {
      map['neighborhood'] = Variable<String>(neighborhood.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(state.value);
    }
    if (complement.present) {
      map['complement'] = Variable<String>(complement.value);
    }
    if (churchId.present) {
      map['church_id'] = Variable<int>(churchId.value);
    }
    if (districtId.present) {
      map['district_id'] = Variable<int>(districtId.value);
    }
    if (stars.present) {
      map['stars'] = Variable<int>(stars.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClubsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('dateFundation: $dateFundation, ')
          ..write('symbol: $symbol, ')
          ..write('history: $history, ')
          ..write('cep: $cep, ')
          ..write('street: $street, ')
          ..write('number: $number, ')
          ..write('neighborhood: $neighborhood, ')
          ..write('city: $city, ')
          ..write('state: $state, ')
          ..write('complement: $complement, ')
          ..write('churchId: $churchId, ')
          ..write('districtId: $districtId, ')
          ..write('stars: $stars, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $MemberRolesTable extends MemberRoles
    with TableInfo<$MemberRolesTable, MemberRole> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MemberRolesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _memberIdMeta = const VerificationMeta(
    'memberId',
  );
  @override
  late final GeneratedColumn<int> memberId = GeneratedColumn<int>(
    'member_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES members (id)',
    ),
  );
  static const VerificationMeta _functionMemberIdMeta = const VerificationMeta(
    'functionMemberId',
  );
  @override
  late final GeneratedColumn<int> functionMemberId = GeneratedColumn<int>(
    'function_member_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES function_members (id)',
    ),
  );
  static const VerificationMeta _clubIdMeta = const VerificationMeta('clubId');
  @override
  late final GeneratedColumn<int> clubId = GeneratedColumn<int>(
    'club_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _districtIdMeta = const VerificationMeta(
    'districtId',
  );
  @override
  late final GeneratedColumn<int> districtId = GeneratedColumn<int>(
    'district_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _regionIdMeta = const VerificationMeta(
    'regionId',
  );
  @override
  late final GeneratedColumn<int> regionId = GeneratedColumn<int>(
    'region_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _associationIdMeta = const VerificationMeta(
    'associationId',
  );
  @override
  late final GeneratedColumn<int> associationId = GeneratedColumn<int>(
    'association_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _unionIdMeta = const VerificationMeta(
    'unionId',
  );
  @override
  late final GeneratedColumn<int> unionId = GeneratedColumn<int>(
    'union_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _divisionIdMeta = const VerificationMeta(
    'divisionId',
  );
  @override
  late final GeneratedColumn<int> divisionId = GeneratedColumn<int>(
    'division_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
    'start_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _endDateMeta = const VerificationMeta(
    'endDate',
  );
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
    'end_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    memberId,
    functionMemberId,
    clubId,
    districtId,
    regionId,
    associationId,
    unionId,
    divisionId,
    startDate,
    endDate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'member_roles';
  @override
  VerificationContext validateIntegrity(
    Insertable<MemberRole> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('member_id')) {
      context.handle(
        _memberIdMeta,
        memberId.isAcceptableOrUnknown(data['member_id']!, _memberIdMeta),
      );
    } else if (isInserting) {
      context.missing(_memberIdMeta);
    }
    if (data.containsKey('function_member_id')) {
      context.handle(
        _functionMemberIdMeta,
        functionMemberId.isAcceptableOrUnknown(
          data['function_member_id']!,
          _functionMemberIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_functionMemberIdMeta);
    }
    if (data.containsKey('club_id')) {
      context.handle(
        _clubIdMeta,
        clubId.isAcceptableOrUnknown(data['club_id']!, _clubIdMeta),
      );
    }
    if (data.containsKey('district_id')) {
      context.handle(
        _districtIdMeta,
        districtId.isAcceptableOrUnknown(data['district_id']!, _districtIdMeta),
      );
    }
    if (data.containsKey('region_id')) {
      context.handle(
        _regionIdMeta,
        regionId.isAcceptableOrUnknown(data['region_id']!, _regionIdMeta),
      );
    }
    if (data.containsKey('association_id')) {
      context.handle(
        _associationIdMeta,
        associationId.isAcceptableOrUnknown(
          data['association_id']!,
          _associationIdMeta,
        ),
      );
    }
    if (data.containsKey('union_id')) {
      context.handle(
        _unionIdMeta,
        unionId.isAcceptableOrUnknown(data['union_id']!, _unionIdMeta),
      );
    }
    if (data.containsKey('division_id')) {
      context.handle(
        _divisionIdMeta,
        divisionId.isAcceptableOrUnknown(data['division_id']!, _divisionIdMeta),
      );
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    }
    if (data.containsKey('end_date')) {
      context.handle(
        _endDateMeta,
        endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MemberRole map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MemberRole(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      memberId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}member_id'],
      )!,
      functionMemberId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}function_member_id'],
      )!,
      clubId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}club_id'],
      ),
      districtId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}district_id'],
      ),
      regionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}region_id'],
      ),
      associationId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}association_id'],
      ),
      unionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}union_id'],
      ),
      divisionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}division_id'],
      ),
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_date'],
      ),
      endDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_date'],
      ),
    );
  }

  @override
  $MemberRolesTable createAlias(String alias) {
    return $MemberRolesTable(attachedDatabase, alias);
  }
}

class MemberRole extends DataClass implements Insertable<MemberRole> {
  final int id;
  final int memberId;
  final int functionMemberId;
  final int? clubId;
  final int? districtId;
  final int? regionId;
  final int? associationId;
  final int? unionId;
  final int? divisionId;
  final DateTime? startDate;
  final DateTime? endDate;
  const MemberRole({
    required this.id,
    required this.memberId,
    required this.functionMemberId,
    this.clubId,
    this.districtId,
    this.regionId,
    this.associationId,
    this.unionId,
    this.divisionId,
    this.startDate,
    this.endDate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['member_id'] = Variable<int>(memberId);
    map['function_member_id'] = Variable<int>(functionMemberId);
    if (!nullToAbsent || clubId != null) {
      map['club_id'] = Variable<int>(clubId);
    }
    if (!nullToAbsent || districtId != null) {
      map['district_id'] = Variable<int>(districtId);
    }
    if (!nullToAbsent || regionId != null) {
      map['region_id'] = Variable<int>(regionId);
    }
    if (!nullToAbsent || associationId != null) {
      map['association_id'] = Variable<int>(associationId);
    }
    if (!nullToAbsent || unionId != null) {
      map['union_id'] = Variable<int>(unionId);
    }
    if (!nullToAbsent || divisionId != null) {
      map['division_id'] = Variable<int>(divisionId);
    }
    if (!nullToAbsent || startDate != null) {
      map['start_date'] = Variable<DateTime>(startDate);
    }
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime>(endDate);
    }
    return map;
  }

  MemberRolesCompanion toCompanion(bool nullToAbsent) {
    return MemberRolesCompanion(
      id: Value(id),
      memberId: Value(memberId),
      functionMemberId: Value(functionMemberId),
      clubId: clubId == null && nullToAbsent
          ? const Value.absent()
          : Value(clubId),
      districtId: districtId == null && nullToAbsent
          ? const Value.absent()
          : Value(districtId),
      regionId: regionId == null && nullToAbsent
          ? const Value.absent()
          : Value(regionId),
      associationId: associationId == null && nullToAbsent
          ? const Value.absent()
          : Value(associationId),
      unionId: unionId == null && nullToAbsent
          ? const Value.absent()
          : Value(unionId),
      divisionId: divisionId == null && nullToAbsent
          ? const Value.absent()
          : Value(divisionId),
      startDate: startDate == null && nullToAbsent
          ? const Value.absent()
          : Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
    );
  }

  factory MemberRole.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MemberRole(
      id: serializer.fromJson<int>(json['id']),
      memberId: serializer.fromJson<int>(json['memberId']),
      functionMemberId: serializer.fromJson<int>(json['functionMemberId']),
      clubId: serializer.fromJson<int?>(json['clubId']),
      districtId: serializer.fromJson<int?>(json['districtId']),
      regionId: serializer.fromJson<int?>(json['regionId']),
      associationId: serializer.fromJson<int?>(json['associationId']),
      unionId: serializer.fromJson<int?>(json['unionId']),
      divisionId: serializer.fromJson<int?>(json['divisionId']),
      startDate: serializer.fromJson<DateTime?>(json['startDate']),
      endDate: serializer.fromJson<DateTime?>(json['endDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'memberId': serializer.toJson<int>(memberId),
      'functionMemberId': serializer.toJson<int>(functionMemberId),
      'clubId': serializer.toJson<int?>(clubId),
      'districtId': serializer.toJson<int?>(districtId),
      'regionId': serializer.toJson<int?>(regionId),
      'associationId': serializer.toJson<int?>(associationId),
      'unionId': serializer.toJson<int?>(unionId),
      'divisionId': serializer.toJson<int?>(divisionId),
      'startDate': serializer.toJson<DateTime?>(startDate),
      'endDate': serializer.toJson<DateTime?>(endDate),
    };
  }

  MemberRole copyWith({
    int? id,
    int? memberId,
    int? functionMemberId,
    Value<int?> clubId = const Value.absent(),
    Value<int?> districtId = const Value.absent(),
    Value<int?> regionId = const Value.absent(),
    Value<int?> associationId = const Value.absent(),
    Value<int?> unionId = const Value.absent(),
    Value<int?> divisionId = const Value.absent(),
    Value<DateTime?> startDate = const Value.absent(),
    Value<DateTime?> endDate = const Value.absent(),
  }) => MemberRole(
    id: id ?? this.id,
    memberId: memberId ?? this.memberId,
    functionMemberId: functionMemberId ?? this.functionMemberId,
    clubId: clubId.present ? clubId.value : this.clubId,
    districtId: districtId.present ? districtId.value : this.districtId,
    regionId: regionId.present ? regionId.value : this.regionId,
    associationId: associationId.present
        ? associationId.value
        : this.associationId,
    unionId: unionId.present ? unionId.value : this.unionId,
    divisionId: divisionId.present ? divisionId.value : this.divisionId,
    startDate: startDate.present ? startDate.value : this.startDate,
    endDate: endDate.present ? endDate.value : this.endDate,
  );
  MemberRole copyWithCompanion(MemberRolesCompanion data) {
    return MemberRole(
      id: data.id.present ? data.id.value : this.id,
      memberId: data.memberId.present ? data.memberId.value : this.memberId,
      functionMemberId: data.functionMemberId.present
          ? data.functionMemberId.value
          : this.functionMemberId,
      clubId: data.clubId.present ? data.clubId.value : this.clubId,
      districtId: data.districtId.present
          ? data.districtId.value
          : this.districtId,
      regionId: data.regionId.present ? data.regionId.value : this.regionId,
      associationId: data.associationId.present
          ? data.associationId.value
          : this.associationId,
      unionId: data.unionId.present ? data.unionId.value : this.unionId,
      divisionId: data.divisionId.present
          ? data.divisionId.value
          : this.divisionId,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MemberRole(')
          ..write('id: $id, ')
          ..write('memberId: $memberId, ')
          ..write('functionMemberId: $functionMemberId, ')
          ..write('clubId: $clubId, ')
          ..write('districtId: $districtId, ')
          ..write('regionId: $regionId, ')
          ..write('associationId: $associationId, ')
          ..write('unionId: $unionId, ')
          ..write('divisionId: $divisionId, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    memberId,
    functionMemberId,
    clubId,
    districtId,
    regionId,
    associationId,
    unionId,
    divisionId,
    startDate,
    endDate,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MemberRole &&
          other.id == this.id &&
          other.memberId == this.memberId &&
          other.functionMemberId == this.functionMemberId &&
          other.clubId == this.clubId &&
          other.districtId == this.districtId &&
          other.regionId == this.regionId &&
          other.associationId == this.associationId &&
          other.unionId == this.unionId &&
          other.divisionId == this.divisionId &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate);
}

class MemberRolesCompanion extends UpdateCompanion<MemberRole> {
  final Value<int> id;
  final Value<int> memberId;
  final Value<int> functionMemberId;
  final Value<int?> clubId;
  final Value<int?> districtId;
  final Value<int?> regionId;
  final Value<int?> associationId;
  final Value<int?> unionId;
  final Value<int?> divisionId;
  final Value<DateTime?> startDate;
  final Value<DateTime?> endDate;
  const MemberRolesCompanion({
    this.id = const Value.absent(),
    this.memberId = const Value.absent(),
    this.functionMemberId = const Value.absent(),
    this.clubId = const Value.absent(),
    this.districtId = const Value.absent(),
    this.regionId = const Value.absent(),
    this.associationId = const Value.absent(),
    this.unionId = const Value.absent(),
    this.divisionId = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
  });
  MemberRolesCompanion.insert({
    this.id = const Value.absent(),
    required int memberId,
    required int functionMemberId,
    this.clubId = const Value.absent(),
    this.districtId = const Value.absent(),
    this.regionId = const Value.absent(),
    this.associationId = const Value.absent(),
    this.unionId = const Value.absent(),
    this.divisionId = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
  }) : memberId = Value(memberId),
       functionMemberId = Value(functionMemberId);
  static Insertable<MemberRole> custom({
    Expression<int>? id,
    Expression<int>? memberId,
    Expression<int>? functionMemberId,
    Expression<int>? clubId,
    Expression<int>? districtId,
    Expression<int>? regionId,
    Expression<int>? associationId,
    Expression<int>? unionId,
    Expression<int>? divisionId,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (memberId != null) 'member_id': memberId,
      if (functionMemberId != null) 'function_member_id': functionMemberId,
      if (clubId != null) 'club_id': clubId,
      if (districtId != null) 'district_id': districtId,
      if (regionId != null) 'region_id': regionId,
      if (associationId != null) 'association_id': associationId,
      if (unionId != null) 'union_id': unionId,
      if (divisionId != null) 'division_id': divisionId,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
    });
  }

  MemberRolesCompanion copyWith({
    Value<int>? id,
    Value<int>? memberId,
    Value<int>? functionMemberId,
    Value<int?>? clubId,
    Value<int?>? districtId,
    Value<int?>? regionId,
    Value<int?>? associationId,
    Value<int?>? unionId,
    Value<int?>? divisionId,
    Value<DateTime?>? startDate,
    Value<DateTime?>? endDate,
  }) {
    return MemberRolesCompanion(
      id: id ?? this.id,
      memberId: memberId ?? this.memberId,
      functionMemberId: functionMemberId ?? this.functionMemberId,
      clubId: clubId ?? this.clubId,
      districtId: districtId ?? this.districtId,
      regionId: regionId ?? this.regionId,
      associationId: associationId ?? this.associationId,
      unionId: unionId ?? this.unionId,
      divisionId: divisionId ?? this.divisionId,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (memberId.present) {
      map['member_id'] = Variable<int>(memberId.value);
    }
    if (functionMemberId.present) {
      map['function_member_id'] = Variable<int>(functionMemberId.value);
    }
    if (clubId.present) {
      map['club_id'] = Variable<int>(clubId.value);
    }
    if (districtId.present) {
      map['district_id'] = Variable<int>(districtId.value);
    }
    if (regionId.present) {
      map['region_id'] = Variable<int>(regionId.value);
    }
    if (associationId.present) {
      map['association_id'] = Variable<int>(associationId.value);
    }
    if (unionId.present) {
      map['union_id'] = Variable<int>(unionId.value);
    }
    if (divisionId.present) {
      map['division_id'] = Variable<int>(divisionId.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MemberRolesCompanion(')
          ..write('id: $id, ')
          ..write('memberId: $memberId, ')
          ..write('functionMemberId: $functionMemberId, ')
          ..write('clubId: $clubId, ')
          ..write('districtId: $districtId, ')
          ..write('regionId: $regionId, ')
          ..write('associationId: $associationId, ')
          ..write('unionId: $unionId, ')
          ..write('divisionId: $divisionId, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $FunctionMembersTable functionMembers = $FunctionMembersTable(
    this,
  );
  late final $MembersTable members = $MembersTable(this);
  late final $HealthFormsTable healthForms = $HealthFormsTable(this);
  late final $DivisionsTable divisions = $DivisionsTable(this);
  late final $CountryDivisionsTable countryDivisions = $CountryDivisionsTable(
    this,
  );
  late final $UnionsTable unions = $UnionsTable(this);
  late final $StateUnionsTable stateUnions = $StateUnionsTable(this);
  late final $AssociationsTable associations = $AssociationsTable(this);
  late final $RegionsTable regions = $RegionsTable(this);
  late final $DistrictsTable districts = $DistrictsTable(this);
  late final $ChurchesTable churches = $ChurchesTable(this);
  late final $ClubsTable clubs = $ClubsTable(this);
  late final $MemberRolesTable memberRoles = $MemberRolesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    users,
    functionMembers,
    members,
    healthForms,
    divisions,
    countryDivisions,
    unions,
    stateUnions,
    associations,
    regions,
    districts,
    churches,
    clubs,
    memberRoles,
  ];
}

typedef $$UsersTableCreateCompanionBuilder =
    UsersCompanion Function({
      Value<int> id,
      required String name,
      required String email,
      required String token,
      required String passwordHash,
      Value<UserFunction> function,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
    });
typedef $$UsersTableUpdateCompanionBuilder =
    UsersCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> email,
      Value<String> token,
      Value<String> passwordHash,
      Value<UserFunction> function,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
    });

final class $$UsersTableReferences
    extends BaseReferences<_$AppDatabase, $UsersTable, User> {
  $$UsersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$MembersTable, List<Member>> _membersRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.members,
    aliasName: $_aliasNameGenerator(db.users.id, db.members.userId),
  );

  $$MembersTableProcessedTableManager get membersRefs {
    final manager = $$MembersTableTableManager(
      $_db,
      $_db.members,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_membersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get token => $composableBuilder(
    column: $table.token,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get passwordHash => $composableBuilder(
    column: $table.passwordHash,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<UserFunction, UserFunction, int>
  get function => $composableBuilder(
    column: $table.function,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> membersRefs(
    Expression<bool> Function($$MembersTableFilterComposer f) f,
  ) {
    final $$MembersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.members,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MembersTableFilterComposer(
            $db: $db,
            $table: $db.members,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get token => $composableBuilder(
    column: $table.token,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get passwordHash => $composableBuilder(
    column: $table.passwordHash,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get function => $composableBuilder(
    column: $table.function,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get token =>
      $composableBuilder(column: $table.token, builder: (column) => column);

  GeneratedColumn<String> get passwordHash => $composableBuilder(
    column: $table.passwordHash,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<UserFunction, int> get function =>
      $composableBuilder(column: $table.function, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> membersRefs<T extends Object>(
    Expression<T> Function($$MembersTableAnnotationComposer a) f,
  ) {
    final $$MembersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.members,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MembersTableAnnotationComposer(
            $db: $db,
            $table: $db.members,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsersTable,
          User,
          $$UsersTableFilterComposer,
          $$UsersTableOrderingComposer,
          $$UsersTableAnnotationComposer,
          $$UsersTableCreateCompanionBuilder,
          $$UsersTableUpdateCompanionBuilder,
          (User, $$UsersTableReferences),
          User,
          PrefetchHooks Function({bool membersRefs})
        > {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<String> token = const Value.absent(),
                Value<String> passwordHash = const Value.absent(),
                Value<UserFunction> function = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => UsersCompanion(
                id: id,
                name: name,
                email: email,
                token: token,
                passwordHash: passwordHash,
                function: function,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String email,
                required String token,
                required String passwordHash,
                Value<UserFunction> function = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => UsersCompanion.insert(
                id: id,
                name: name,
                email: email,
                token: token,
                passwordHash: passwordHash,
                function: function,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$UsersTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({membersRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (membersRefs) db.members],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (membersRefs)
                    await $_getPrefetchedData<User, $UsersTable, Member>(
                      currentTable: table,
                      referencedTable: $$UsersTableReferences._membersRefsTable(
                        db,
                      ),
                      managerFromTypedResult: (p0) =>
                          $$UsersTableReferences(db, table, p0).membersRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.userId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$UsersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsersTable,
      User,
      $$UsersTableFilterComposer,
      $$UsersTableOrderingComposer,
      $$UsersTableAnnotationComposer,
      $$UsersTableCreateCompanionBuilder,
      $$UsersTableUpdateCompanionBuilder,
      (User, $$UsersTableReferences),
      User,
      PrefetchHooks Function({bool membersRefs})
    >;
typedef $$FunctionMembersTableCreateCompanionBuilder =
    FunctionMembersCompanion Function({
      Value<int> id,
      required String name,
      required String desc,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
    });
typedef $$FunctionMembersTableUpdateCompanionBuilder =
    FunctionMembersCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> desc,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
    });

final class $$FunctionMembersTableReferences
    extends
        BaseReferences<_$AppDatabase, $FunctionMembersTable, FunctionMember> {
  $$FunctionMembersTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$MembersTable, List<Member>> _membersRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.members,
    aliasName: $_aliasNameGenerator(
      db.functionMembers.id,
      db.members.functionMemberId,
    ),
  );

  $$MembersTableProcessedTableManager get membersRefs {
    final manager = $$MembersTableTableManager(
      $_db,
      $_db.members,
    ).filter((f) => f.functionMemberId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_membersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MemberRolesTable, List<MemberRole>>
  _memberRolesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.memberRoles,
    aliasName: $_aliasNameGenerator(
      db.functionMembers.id,
      db.memberRoles.functionMemberId,
    ),
  );

  $$MemberRolesTableProcessedTableManager get memberRolesRefs {
    final manager = $$MemberRolesTableTableManager(
      $_db,
      $_db.memberRoles,
    ).filter((f) => f.functionMemberId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_memberRolesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$FunctionMembersTableFilterComposer
    extends Composer<_$AppDatabase, $FunctionMembersTable> {
  $$FunctionMembersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get desc => $composableBuilder(
    column: $table.desc,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> membersRefs(
    Expression<bool> Function($$MembersTableFilterComposer f) f,
  ) {
    final $$MembersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.members,
      getReferencedColumn: (t) => t.functionMemberId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MembersTableFilterComposer(
            $db: $db,
            $table: $db.members,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> memberRolesRefs(
    Expression<bool> Function($$MemberRolesTableFilterComposer f) f,
  ) {
    final $$MemberRolesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.memberRoles,
      getReferencedColumn: (t) => t.functionMemberId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MemberRolesTableFilterComposer(
            $db: $db,
            $table: $db.memberRoles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FunctionMembersTableOrderingComposer
    extends Composer<_$AppDatabase, $FunctionMembersTable> {
  $$FunctionMembersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get desc => $composableBuilder(
    column: $table.desc,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FunctionMembersTableAnnotationComposer
    extends Composer<_$AppDatabase, $FunctionMembersTable> {
  $$FunctionMembersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get desc =>
      $composableBuilder(column: $table.desc, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> membersRefs<T extends Object>(
    Expression<T> Function($$MembersTableAnnotationComposer a) f,
  ) {
    final $$MembersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.members,
      getReferencedColumn: (t) => t.functionMemberId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MembersTableAnnotationComposer(
            $db: $db,
            $table: $db.members,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> memberRolesRefs<T extends Object>(
    Expression<T> Function($$MemberRolesTableAnnotationComposer a) f,
  ) {
    final $$MemberRolesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.memberRoles,
      getReferencedColumn: (t) => t.functionMemberId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MemberRolesTableAnnotationComposer(
            $db: $db,
            $table: $db.memberRoles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FunctionMembersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FunctionMembersTable,
          FunctionMember,
          $$FunctionMembersTableFilterComposer,
          $$FunctionMembersTableOrderingComposer,
          $$FunctionMembersTableAnnotationComposer,
          $$FunctionMembersTableCreateCompanionBuilder,
          $$FunctionMembersTableUpdateCompanionBuilder,
          (FunctionMember, $$FunctionMembersTableReferences),
          FunctionMember,
          PrefetchHooks Function({bool membersRefs, bool memberRolesRefs})
        > {
  $$FunctionMembersTableTableManager(
    _$AppDatabase db,
    $FunctionMembersTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FunctionMembersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FunctionMembersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FunctionMembersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> desc = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => FunctionMembersCompanion(
                id: id,
                name: name,
                desc: desc,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String desc,
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => FunctionMembersCompanion.insert(
                id: id,
                name: name,
                desc: desc,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$FunctionMembersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({membersRefs = false, memberRolesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (membersRefs) db.members,
                    if (memberRolesRefs) db.memberRoles,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (membersRefs)
                        await $_getPrefetchedData<
                          FunctionMember,
                          $FunctionMembersTable,
                          Member
                        >(
                          currentTable: table,
                          referencedTable: $$FunctionMembersTableReferences
                              ._membersRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$FunctionMembersTableReferences(
                                db,
                                table,
                                p0,
                              ).membersRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.functionMemberId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (memberRolesRefs)
                        await $_getPrefetchedData<
                          FunctionMember,
                          $FunctionMembersTable,
                          MemberRole
                        >(
                          currentTable: table,
                          referencedTable: $$FunctionMembersTableReferences
                              ._memberRolesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$FunctionMembersTableReferences(
                                db,
                                table,
                                p0,
                              ).memberRolesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.functionMemberId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$FunctionMembersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FunctionMembersTable,
      FunctionMember,
      $$FunctionMembersTableFilterComposer,
      $$FunctionMembersTableOrderingComposer,
      $$FunctionMembersTableAnnotationComposer,
      $$FunctionMembersTableCreateCompanionBuilder,
      $$FunctionMembersTableUpdateCompanionBuilder,
      (FunctionMember, $$FunctionMembersTableReferences),
      FunctionMember,
      PrefetchHooks Function({bool membersRefs, bool memberRolesRefs})
    >;
typedef $$MembersTableCreateCompanionBuilder =
    MembersCompanion Function({
      Value<int> id,
      required String name,
      Value<DateTime?> birthdate,
      Value<String?> cpf,
      Value<String?> rg,
      Value<String?> issuingAgency,
      Value<String?> shirtSize,
      Value<String?> email,
      Value<String?> phone,
      Value<String?> cep,
      Value<String?> street,
      Value<String?> number,
      Value<String?> complement,
      Value<String?> neighborhood,
      Value<String?> city,
      Value<String?> state,
      Value<String?> nameMother,
      Value<String?> emailMother,
      Value<String?> phoneMother,
      Value<String?> nameFather,
      Value<String?> emailFather,
      Value<String?> phoneFather,
      Value<bool> acceptClubTerm,
      Value<bool> acceptImageTerm,
      Value<int?> clubId,
      required int functionMemberId,
      Value<int?> userId,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
    });
typedef $$MembersTableUpdateCompanionBuilder =
    MembersCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<DateTime?> birthdate,
      Value<String?> cpf,
      Value<String?> rg,
      Value<String?> issuingAgency,
      Value<String?> shirtSize,
      Value<String?> email,
      Value<String?> phone,
      Value<String?> cep,
      Value<String?> street,
      Value<String?> number,
      Value<String?> complement,
      Value<String?> neighborhood,
      Value<String?> city,
      Value<String?> state,
      Value<String?> nameMother,
      Value<String?> emailMother,
      Value<String?> phoneMother,
      Value<String?> nameFather,
      Value<String?> emailFather,
      Value<String?> phoneFather,
      Value<bool> acceptClubTerm,
      Value<bool> acceptImageTerm,
      Value<int?> clubId,
      Value<int> functionMemberId,
      Value<int?> userId,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
    });

final class $$MembersTableReferences
    extends BaseReferences<_$AppDatabase, $MembersTable, Member> {
  $$MembersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $FunctionMembersTable _functionMemberIdTable(_$AppDatabase db) =>
      db.functionMembers.createAlias(
        $_aliasNameGenerator(
          db.members.functionMemberId,
          db.functionMembers.id,
        ),
      );

  $$FunctionMembersTableProcessedTableManager get functionMemberId {
    final $_column = $_itemColumn<int>('function_member_id')!;

    final manager = $$FunctionMembersTableTableManager(
      $_db,
      $_db.functionMembers,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_functionMemberIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $UsersTable _userIdTable(_$AppDatabase db) => db.users.createAlias(
    $_aliasNameGenerator(db.members.userId, db.users.id),
  );

  $$UsersTableProcessedTableManager? get userId {
    final $_column = $_itemColumn<int>('user_id');
    if ($_column == null) return null;
    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$HealthFormsTable, List<HealthForm>>
  _healthFormsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.healthForms,
    aliasName: $_aliasNameGenerator(db.members.id, db.healthForms.memberId),
  );

  $$HealthFormsTableProcessedTableManager get healthFormsRefs {
    final manager = $$HealthFormsTableTableManager(
      $_db,
      $_db.healthForms,
    ).filter((f) => f.memberId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_healthFormsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MemberRolesTable, List<MemberRole>>
  _memberRolesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.memberRoles,
    aliasName: $_aliasNameGenerator(db.members.id, db.memberRoles.memberId),
  );

  $$MemberRolesTableProcessedTableManager get memberRolesRefs {
    final manager = $$MemberRolesTableTableManager(
      $_db,
      $_db.memberRoles,
    ).filter((f) => f.memberId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_memberRolesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$MembersTableFilterComposer
    extends Composer<_$AppDatabase, $MembersTable> {
  $$MembersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get birthdate => $composableBuilder(
    column: $table.birthdate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cpf => $composableBuilder(
    column: $table.cpf,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rg => $composableBuilder(
    column: $table.rg,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get issuingAgency => $composableBuilder(
    column: $table.issuingAgency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shirtSize => $composableBuilder(
    column: $table.shirtSize,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cep => $composableBuilder(
    column: $table.cep,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get street => $composableBuilder(
    column: $table.street,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get number => $composableBuilder(
    column: $table.number,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get complement => $composableBuilder(
    column: $table.complement,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get neighborhood => $composableBuilder(
    column: $table.neighborhood,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get state => $composableBuilder(
    column: $table.state,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameMother => $composableBuilder(
    column: $table.nameMother,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get emailMother => $composableBuilder(
    column: $table.emailMother,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phoneMother => $composableBuilder(
    column: $table.phoneMother,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameFather => $composableBuilder(
    column: $table.nameFather,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get emailFather => $composableBuilder(
    column: $table.emailFather,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phoneFather => $composableBuilder(
    column: $table.phoneFather,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get acceptClubTerm => $composableBuilder(
    column: $table.acceptClubTerm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get acceptImageTerm => $composableBuilder(
    column: $table.acceptImageTerm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get clubId => $composableBuilder(
    column: $table.clubId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$FunctionMembersTableFilterComposer get functionMemberId {
    final $$FunctionMembersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.functionMemberId,
      referencedTable: $db.functionMembers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FunctionMembersTableFilterComposer(
            $db: $db,
            $table: $db.functionMembers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> healthFormsRefs(
    Expression<bool> Function($$HealthFormsTableFilterComposer f) f,
  ) {
    final $$HealthFormsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.healthForms,
      getReferencedColumn: (t) => t.memberId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HealthFormsTableFilterComposer(
            $db: $db,
            $table: $db.healthForms,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> memberRolesRefs(
    Expression<bool> Function($$MemberRolesTableFilterComposer f) f,
  ) {
    final $$MemberRolesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.memberRoles,
      getReferencedColumn: (t) => t.memberId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MemberRolesTableFilterComposer(
            $db: $db,
            $table: $db.memberRoles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MembersTableOrderingComposer
    extends Composer<_$AppDatabase, $MembersTable> {
  $$MembersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get birthdate => $composableBuilder(
    column: $table.birthdate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cpf => $composableBuilder(
    column: $table.cpf,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rg => $composableBuilder(
    column: $table.rg,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get issuingAgency => $composableBuilder(
    column: $table.issuingAgency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shirtSize => $composableBuilder(
    column: $table.shirtSize,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cep => $composableBuilder(
    column: $table.cep,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get street => $composableBuilder(
    column: $table.street,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get number => $composableBuilder(
    column: $table.number,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get complement => $composableBuilder(
    column: $table.complement,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get neighborhood => $composableBuilder(
    column: $table.neighborhood,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get state => $composableBuilder(
    column: $table.state,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameMother => $composableBuilder(
    column: $table.nameMother,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get emailMother => $composableBuilder(
    column: $table.emailMother,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phoneMother => $composableBuilder(
    column: $table.phoneMother,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameFather => $composableBuilder(
    column: $table.nameFather,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get emailFather => $composableBuilder(
    column: $table.emailFather,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phoneFather => $composableBuilder(
    column: $table.phoneFather,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get acceptClubTerm => $composableBuilder(
    column: $table.acceptClubTerm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get acceptImageTerm => $composableBuilder(
    column: $table.acceptImageTerm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get clubId => $composableBuilder(
    column: $table.clubId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$FunctionMembersTableOrderingComposer get functionMemberId {
    final $$FunctionMembersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.functionMemberId,
      referencedTable: $db.functionMembers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FunctionMembersTableOrderingComposer(
            $db: $db,
            $table: $db.functionMembers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MembersTableAnnotationComposer
    extends Composer<_$AppDatabase, $MembersTable> {
  $$MembersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get birthdate =>
      $composableBuilder(column: $table.birthdate, builder: (column) => column);

  GeneratedColumn<String> get cpf =>
      $composableBuilder(column: $table.cpf, builder: (column) => column);

  GeneratedColumn<String> get rg =>
      $composableBuilder(column: $table.rg, builder: (column) => column);

  GeneratedColumn<String> get issuingAgency => $composableBuilder(
    column: $table.issuingAgency,
    builder: (column) => column,
  );

  GeneratedColumn<String> get shirtSize =>
      $composableBuilder(column: $table.shirtSize, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get cep =>
      $composableBuilder(column: $table.cep, builder: (column) => column);

  GeneratedColumn<String> get street =>
      $composableBuilder(column: $table.street, builder: (column) => column);

  GeneratedColumn<String> get number =>
      $composableBuilder(column: $table.number, builder: (column) => column);

  GeneratedColumn<String> get complement => $composableBuilder(
    column: $table.complement,
    builder: (column) => column,
  );

  GeneratedColumn<String> get neighborhood => $composableBuilder(
    column: $table.neighborhood,
    builder: (column) => column,
  );

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  GeneratedColumn<String> get state =>
      $composableBuilder(column: $table.state, builder: (column) => column);

  GeneratedColumn<String> get nameMother => $composableBuilder(
    column: $table.nameMother,
    builder: (column) => column,
  );

  GeneratedColumn<String> get emailMother => $composableBuilder(
    column: $table.emailMother,
    builder: (column) => column,
  );

  GeneratedColumn<String> get phoneMother => $composableBuilder(
    column: $table.phoneMother,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nameFather => $composableBuilder(
    column: $table.nameFather,
    builder: (column) => column,
  );

  GeneratedColumn<String> get emailFather => $composableBuilder(
    column: $table.emailFather,
    builder: (column) => column,
  );

  GeneratedColumn<String> get phoneFather => $composableBuilder(
    column: $table.phoneFather,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get acceptClubTerm => $composableBuilder(
    column: $table.acceptClubTerm,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get acceptImageTerm => $composableBuilder(
    column: $table.acceptImageTerm,
    builder: (column) => column,
  );

  GeneratedColumn<int> get clubId =>
      $composableBuilder(column: $table.clubId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$FunctionMembersTableAnnotationComposer get functionMemberId {
    final $$FunctionMembersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.functionMemberId,
      referencedTable: $db.functionMembers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FunctionMembersTableAnnotationComposer(
            $db: $db,
            $table: $db.functionMembers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> healthFormsRefs<T extends Object>(
    Expression<T> Function($$HealthFormsTableAnnotationComposer a) f,
  ) {
    final $$HealthFormsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.healthForms,
      getReferencedColumn: (t) => t.memberId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HealthFormsTableAnnotationComposer(
            $db: $db,
            $table: $db.healthForms,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> memberRolesRefs<T extends Object>(
    Expression<T> Function($$MemberRolesTableAnnotationComposer a) f,
  ) {
    final $$MemberRolesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.memberRoles,
      getReferencedColumn: (t) => t.memberId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MemberRolesTableAnnotationComposer(
            $db: $db,
            $table: $db.memberRoles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MembersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MembersTable,
          Member,
          $$MembersTableFilterComposer,
          $$MembersTableOrderingComposer,
          $$MembersTableAnnotationComposer,
          $$MembersTableCreateCompanionBuilder,
          $$MembersTableUpdateCompanionBuilder,
          (Member, $$MembersTableReferences),
          Member,
          PrefetchHooks Function({
            bool functionMemberId,
            bool userId,
            bool healthFormsRefs,
            bool memberRolesRefs,
          })
        > {
  $$MembersTableTableManager(_$AppDatabase db, $MembersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MembersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MembersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MembersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<DateTime?> birthdate = const Value.absent(),
                Value<String?> cpf = const Value.absent(),
                Value<String?> rg = const Value.absent(),
                Value<String?> issuingAgency = const Value.absent(),
                Value<String?> shirtSize = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> cep = const Value.absent(),
                Value<String?> street = const Value.absent(),
                Value<String?> number = const Value.absent(),
                Value<String?> complement = const Value.absent(),
                Value<String?> neighborhood = const Value.absent(),
                Value<String?> city = const Value.absent(),
                Value<String?> state = const Value.absent(),
                Value<String?> nameMother = const Value.absent(),
                Value<String?> emailMother = const Value.absent(),
                Value<String?> phoneMother = const Value.absent(),
                Value<String?> nameFather = const Value.absent(),
                Value<String?> emailFather = const Value.absent(),
                Value<String?> phoneFather = const Value.absent(),
                Value<bool> acceptClubTerm = const Value.absent(),
                Value<bool> acceptImageTerm = const Value.absent(),
                Value<int?> clubId = const Value.absent(),
                Value<int> functionMemberId = const Value.absent(),
                Value<int?> userId = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => MembersCompanion(
                id: id,
                name: name,
                birthdate: birthdate,
                cpf: cpf,
                rg: rg,
                issuingAgency: issuingAgency,
                shirtSize: shirtSize,
                email: email,
                phone: phone,
                cep: cep,
                street: street,
                number: number,
                complement: complement,
                neighborhood: neighborhood,
                city: city,
                state: state,
                nameMother: nameMother,
                emailMother: emailMother,
                phoneMother: phoneMother,
                nameFather: nameFather,
                emailFather: emailFather,
                phoneFather: phoneFather,
                acceptClubTerm: acceptClubTerm,
                acceptImageTerm: acceptImageTerm,
                clubId: clubId,
                functionMemberId: functionMemberId,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<DateTime?> birthdate = const Value.absent(),
                Value<String?> cpf = const Value.absent(),
                Value<String?> rg = const Value.absent(),
                Value<String?> issuingAgency = const Value.absent(),
                Value<String?> shirtSize = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> cep = const Value.absent(),
                Value<String?> street = const Value.absent(),
                Value<String?> number = const Value.absent(),
                Value<String?> complement = const Value.absent(),
                Value<String?> neighborhood = const Value.absent(),
                Value<String?> city = const Value.absent(),
                Value<String?> state = const Value.absent(),
                Value<String?> nameMother = const Value.absent(),
                Value<String?> emailMother = const Value.absent(),
                Value<String?> phoneMother = const Value.absent(),
                Value<String?> nameFather = const Value.absent(),
                Value<String?> emailFather = const Value.absent(),
                Value<String?> phoneFather = const Value.absent(),
                Value<bool> acceptClubTerm = const Value.absent(),
                Value<bool> acceptImageTerm = const Value.absent(),
                Value<int?> clubId = const Value.absent(),
                required int functionMemberId,
                Value<int?> userId = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => MembersCompanion.insert(
                id: id,
                name: name,
                birthdate: birthdate,
                cpf: cpf,
                rg: rg,
                issuingAgency: issuingAgency,
                shirtSize: shirtSize,
                email: email,
                phone: phone,
                cep: cep,
                street: street,
                number: number,
                complement: complement,
                neighborhood: neighborhood,
                city: city,
                state: state,
                nameMother: nameMother,
                emailMother: emailMother,
                phoneMother: phoneMother,
                nameFather: nameFather,
                emailFather: emailFather,
                phoneFather: phoneFather,
                acceptClubTerm: acceptClubTerm,
                acceptImageTerm: acceptImageTerm,
                clubId: clubId,
                functionMemberId: functionMemberId,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MembersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                functionMemberId = false,
                userId = false,
                healthFormsRefs = false,
                memberRolesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (healthFormsRefs) db.healthForms,
                    if (memberRolesRefs) db.memberRoles,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (functionMemberId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.functionMemberId,
                                    referencedTable: $$MembersTableReferences
                                        ._functionMemberIdTable(db),
                                    referencedColumn: $$MembersTableReferences
                                        ._functionMemberIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (userId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.userId,
                                    referencedTable: $$MembersTableReferences
                                        ._userIdTable(db),
                                    referencedColumn: $$MembersTableReferences
                                        ._userIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (healthFormsRefs)
                        await $_getPrefetchedData<
                          Member,
                          $MembersTable,
                          HealthForm
                        >(
                          currentTable: table,
                          referencedTable: $$MembersTableReferences
                              ._healthFormsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MembersTableReferences(
                                db,
                                table,
                                p0,
                              ).healthFormsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.memberId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (memberRolesRefs)
                        await $_getPrefetchedData<
                          Member,
                          $MembersTable,
                          MemberRole
                        >(
                          currentTable: table,
                          referencedTable: $$MembersTableReferences
                              ._memberRolesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MembersTableReferences(
                                db,
                                table,
                                p0,
                              ).memberRolesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.memberId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$MembersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MembersTable,
      Member,
      $$MembersTableFilterComposer,
      $$MembersTableOrderingComposer,
      $$MembersTableAnnotationComposer,
      $$MembersTableCreateCompanionBuilder,
      $$MembersTableUpdateCompanionBuilder,
      (Member, $$MembersTableReferences),
      Member,
      PrefetchHooks Function({
        bool functionMemberId,
        bool userId,
        bool healthFormsRefs,
        bool memberRolesRefs,
      })
    >;
typedef $$HealthFormsTableCreateCompanionBuilder =
    HealthFormsCompanion Function({
      Value<int> id,
      required int memberId,
      Value<bool> hadCovid,
      Value<bool> hadDengue,
      Value<bool> hadYellowFever,
      Value<bool> hadMumps,
      Value<bool> hadChickenpox,
      Value<bool> hadMeasles,
      Value<bool> hadRubella,
      Value<bool> asthma,
      Value<bool> bronchitis,
      Value<bool> rhinitis,
      Value<bool> epilepsy,
      Value<bool> diabetes,
      Value<bool> hypertension,
      Value<String?> otherDiseases,
      Value<String> physicalDisability,
      Value<String> hearingDisability,
      Value<String> visualDisability,
      Value<String> autism,
      Value<String> adhd,
      Value<String?> otherCondition,
      Value<String?> allergies,
      Value<String?> drugAllergies,
      Value<String?> foodAllergies,
      Value<bool> underMedicalTreatment,
      Value<bool> onContinuousMedication,
      Value<String?> healthInsurance,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
    });
typedef $$HealthFormsTableUpdateCompanionBuilder =
    HealthFormsCompanion Function({
      Value<int> id,
      Value<int> memberId,
      Value<bool> hadCovid,
      Value<bool> hadDengue,
      Value<bool> hadYellowFever,
      Value<bool> hadMumps,
      Value<bool> hadChickenpox,
      Value<bool> hadMeasles,
      Value<bool> hadRubella,
      Value<bool> asthma,
      Value<bool> bronchitis,
      Value<bool> rhinitis,
      Value<bool> epilepsy,
      Value<bool> diabetes,
      Value<bool> hypertension,
      Value<String?> otherDiseases,
      Value<String> physicalDisability,
      Value<String> hearingDisability,
      Value<String> visualDisability,
      Value<String> autism,
      Value<String> adhd,
      Value<String?> otherCondition,
      Value<String?> allergies,
      Value<String?> drugAllergies,
      Value<String?> foodAllergies,
      Value<bool> underMedicalTreatment,
      Value<bool> onContinuousMedication,
      Value<String?> healthInsurance,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
    });

final class $$HealthFormsTableReferences
    extends BaseReferences<_$AppDatabase, $HealthFormsTable, HealthForm> {
  $$HealthFormsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MembersTable _memberIdTable(_$AppDatabase db) =>
      db.members.createAlias(
        $_aliasNameGenerator(db.healthForms.memberId, db.members.id),
      );

  $$MembersTableProcessedTableManager get memberId {
    final $_column = $_itemColumn<int>('member_id')!;

    final manager = $$MembersTableTableManager(
      $_db,
      $_db.members,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_memberIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$HealthFormsTableFilterComposer
    extends Composer<_$AppDatabase, $HealthFormsTable> {
  $$HealthFormsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get hadCovid => $composableBuilder(
    column: $table.hadCovid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get hadDengue => $composableBuilder(
    column: $table.hadDengue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get hadYellowFever => $composableBuilder(
    column: $table.hadYellowFever,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get hadMumps => $composableBuilder(
    column: $table.hadMumps,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get hadChickenpox => $composableBuilder(
    column: $table.hadChickenpox,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get hadMeasles => $composableBuilder(
    column: $table.hadMeasles,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get hadRubella => $composableBuilder(
    column: $table.hadRubella,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get asthma => $composableBuilder(
    column: $table.asthma,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get bronchitis => $composableBuilder(
    column: $table.bronchitis,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get rhinitis => $composableBuilder(
    column: $table.rhinitis,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get epilepsy => $composableBuilder(
    column: $table.epilepsy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get diabetes => $composableBuilder(
    column: $table.diabetes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get hypertension => $composableBuilder(
    column: $table.hypertension,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get otherDiseases => $composableBuilder(
    column: $table.otherDiseases,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get physicalDisability => $composableBuilder(
    column: $table.physicalDisability,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get hearingDisability => $composableBuilder(
    column: $table.hearingDisability,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get visualDisability => $composableBuilder(
    column: $table.visualDisability,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get autism => $composableBuilder(
    column: $table.autism,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get adhd => $composableBuilder(
    column: $table.adhd,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get otherCondition => $composableBuilder(
    column: $table.otherCondition,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get allergies => $composableBuilder(
    column: $table.allergies,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get drugAllergies => $composableBuilder(
    column: $table.drugAllergies,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get foodAllergies => $composableBuilder(
    column: $table.foodAllergies,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get underMedicalTreatment => $composableBuilder(
    column: $table.underMedicalTreatment,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get onContinuousMedication => $composableBuilder(
    column: $table.onContinuousMedication,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get healthInsurance => $composableBuilder(
    column: $table.healthInsurance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$MembersTableFilterComposer get memberId {
    final $$MembersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.memberId,
      referencedTable: $db.members,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MembersTableFilterComposer(
            $db: $db,
            $table: $db.members,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HealthFormsTableOrderingComposer
    extends Composer<_$AppDatabase, $HealthFormsTable> {
  $$HealthFormsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get hadCovid => $composableBuilder(
    column: $table.hadCovid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get hadDengue => $composableBuilder(
    column: $table.hadDengue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get hadYellowFever => $composableBuilder(
    column: $table.hadYellowFever,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get hadMumps => $composableBuilder(
    column: $table.hadMumps,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get hadChickenpox => $composableBuilder(
    column: $table.hadChickenpox,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get hadMeasles => $composableBuilder(
    column: $table.hadMeasles,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get hadRubella => $composableBuilder(
    column: $table.hadRubella,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get asthma => $composableBuilder(
    column: $table.asthma,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get bronchitis => $composableBuilder(
    column: $table.bronchitis,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get rhinitis => $composableBuilder(
    column: $table.rhinitis,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get epilepsy => $composableBuilder(
    column: $table.epilepsy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get diabetes => $composableBuilder(
    column: $table.diabetes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get hypertension => $composableBuilder(
    column: $table.hypertension,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get otherDiseases => $composableBuilder(
    column: $table.otherDiseases,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get physicalDisability => $composableBuilder(
    column: $table.physicalDisability,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get hearingDisability => $composableBuilder(
    column: $table.hearingDisability,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get visualDisability => $composableBuilder(
    column: $table.visualDisability,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get autism => $composableBuilder(
    column: $table.autism,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get adhd => $composableBuilder(
    column: $table.adhd,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get otherCondition => $composableBuilder(
    column: $table.otherCondition,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get allergies => $composableBuilder(
    column: $table.allergies,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get drugAllergies => $composableBuilder(
    column: $table.drugAllergies,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get foodAllergies => $composableBuilder(
    column: $table.foodAllergies,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get underMedicalTreatment => $composableBuilder(
    column: $table.underMedicalTreatment,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get onContinuousMedication => $composableBuilder(
    column: $table.onContinuousMedication,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get healthInsurance => $composableBuilder(
    column: $table.healthInsurance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$MembersTableOrderingComposer get memberId {
    final $$MembersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.memberId,
      referencedTable: $db.members,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MembersTableOrderingComposer(
            $db: $db,
            $table: $db.members,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HealthFormsTableAnnotationComposer
    extends Composer<_$AppDatabase, $HealthFormsTable> {
  $$HealthFormsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<bool> get hadCovid =>
      $composableBuilder(column: $table.hadCovid, builder: (column) => column);

  GeneratedColumn<bool> get hadDengue =>
      $composableBuilder(column: $table.hadDengue, builder: (column) => column);

  GeneratedColumn<bool> get hadYellowFever => $composableBuilder(
    column: $table.hadYellowFever,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get hadMumps =>
      $composableBuilder(column: $table.hadMumps, builder: (column) => column);

  GeneratedColumn<bool> get hadChickenpox => $composableBuilder(
    column: $table.hadChickenpox,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get hadMeasles => $composableBuilder(
    column: $table.hadMeasles,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get hadRubella => $composableBuilder(
    column: $table.hadRubella,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get asthma =>
      $composableBuilder(column: $table.asthma, builder: (column) => column);

  GeneratedColumn<bool> get bronchitis => $composableBuilder(
    column: $table.bronchitis,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get rhinitis =>
      $composableBuilder(column: $table.rhinitis, builder: (column) => column);

  GeneratedColumn<bool> get epilepsy =>
      $composableBuilder(column: $table.epilepsy, builder: (column) => column);

  GeneratedColumn<bool> get diabetes =>
      $composableBuilder(column: $table.diabetes, builder: (column) => column);

  GeneratedColumn<bool> get hypertension => $composableBuilder(
    column: $table.hypertension,
    builder: (column) => column,
  );

  GeneratedColumn<String> get otherDiseases => $composableBuilder(
    column: $table.otherDiseases,
    builder: (column) => column,
  );

  GeneratedColumn<String> get physicalDisability => $composableBuilder(
    column: $table.physicalDisability,
    builder: (column) => column,
  );

  GeneratedColumn<String> get hearingDisability => $composableBuilder(
    column: $table.hearingDisability,
    builder: (column) => column,
  );

  GeneratedColumn<String> get visualDisability => $composableBuilder(
    column: $table.visualDisability,
    builder: (column) => column,
  );

  GeneratedColumn<String> get autism =>
      $composableBuilder(column: $table.autism, builder: (column) => column);

  GeneratedColumn<String> get adhd =>
      $composableBuilder(column: $table.adhd, builder: (column) => column);

  GeneratedColumn<String> get otherCondition => $composableBuilder(
    column: $table.otherCondition,
    builder: (column) => column,
  );

  GeneratedColumn<String> get allergies =>
      $composableBuilder(column: $table.allergies, builder: (column) => column);

  GeneratedColumn<String> get drugAllergies => $composableBuilder(
    column: $table.drugAllergies,
    builder: (column) => column,
  );

  GeneratedColumn<String> get foodAllergies => $composableBuilder(
    column: $table.foodAllergies,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get underMedicalTreatment => $composableBuilder(
    column: $table.underMedicalTreatment,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get onContinuousMedication => $composableBuilder(
    column: $table.onContinuousMedication,
    builder: (column) => column,
  );

  GeneratedColumn<String> get healthInsurance => $composableBuilder(
    column: $table.healthInsurance,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$MembersTableAnnotationComposer get memberId {
    final $$MembersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.memberId,
      referencedTable: $db.members,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MembersTableAnnotationComposer(
            $db: $db,
            $table: $db.members,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HealthFormsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HealthFormsTable,
          HealthForm,
          $$HealthFormsTableFilterComposer,
          $$HealthFormsTableOrderingComposer,
          $$HealthFormsTableAnnotationComposer,
          $$HealthFormsTableCreateCompanionBuilder,
          $$HealthFormsTableUpdateCompanionBuilder,
          (HealthForm, $$HealthFormsTableReferences),
          HealthForm,
          PrefetchHooks Function({bool memberId})
        > {
  $$HealthFormsTableTableManager(_$AppDatabase db, $HealthFormsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HealthFormsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HealthFormsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HealthFormsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> memberId = const Value.absent(),
                Value<bool> hadCovid = const Value.absent(),
                Value<bool> hadDengue = const Value.absent(),
                Value<bool> hadYellowFever = const Value.absent(),
                Value<bool> hadMumps = const Value.absent(),
                Value<bool> hadChickenpox = const Value.absent(),
                Value<bool> hadMeasles = const Value.absent(),
                Value<bool> hadRubella = const Value.absent(),
                Value<bool> asthma = const Value.absent(),
                Value<bool> bronchitis = const Value.absent(),
                Value<bool> rhinitis = const Value.absent(),
                Value<bool> epilepsy = const Value.absent(),
                Value<bool> diabetes = const Value.absent(),
                Value<bool> hypertension = const Value.absent(),
                Value<String?> otherDiseases = const Value.absent(),
                Value<String> physicalDisability = const Value.absent(),
                Value<String> hearingDisability = const Value.absent(),
                Value<String> visualDisability = const Value.absent(),
                Value<String> autism = const Value.absent(),
                Value<String> adhd = const Value.absent(),
                Value<String?> otherCondition = const Value.absent(),
                Value<String?> allergies = const Value.absent(),
                Value<String?> drugAllergies = const Value.absent(),
                Value<String?> foodAllergies = const Value.absent(),
                Value<bool> underMedicalTreatment = const Value.absent(),
                Value<bool> onContinuousMedication = const Value.absent(),
                Value<String?> healthInsurance = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => HealthFormsCompanion(
                id: id,
                memberId: memberId,
                hadCovid: hadCovid,
                hadDengue: hadDengue,
                hadYellowFever: hadYellowFever,
                hadMumps: hadMumps,
                hadChickenpox: hadChickenpox,
                hadMeasles: hadMeasles,
                hadRubella: hadRubella,
                asthma: asthma,
                bronchitis: bronchitis,
                rhinitis: rhinitis,
                epilepsy: epilepsy,
                diabetes: diabetes,
                hypertension: hypertension,
                otherDiseases: otherDiseases,
                physicalDisability: physicalDisability,
                hearingDisability: hearingDisability,
                visualDisability: visualDisability,
                autism: autism,
                adhd: adhd,
                otherCondition: otherCondition,
                allergies: allergies,
                drugAllergies: drugAllergies,
                foodAllergies: foodAllergies,
                underMedicalTreatment: underMedicalTreatment,
                onContinuousMedication: onContinuousMedication,
                healthInsurance: healthInsurance,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int memberId,
                Value<bool> hadCovid = const Value.absent(),
                Value<bool> hadDengue = const Value.absent(),
                Value<bool> hadYellowFever = const Value.absent(),
                Value<bool> hadMumps = const Value.absent(),
                Value<bool> hadChickenpox = const Value.absent(),
                Value<bool> hadMeasles = const Value.absent(),
                Value<bool> hadRubella = const Value.absent(),
                Value<bool> asthma = const Value.absent(),
                Value<bool> bronchitis = const Value.absent(),
                Value<bool> rhinitis = const Value.absent(),
                Value<bool> epilepsy = const Value.absent(),
                Value<bool> diabetes = const Value.absent(),
                Value<bool> hypertension = const Value.absent(),
                Value<String?> otherDiseases = const Value.absent(),
                Value<String> physicalDisability = const Value.absent(),
                Value<String> hearingDisability = const Value.absent(),
                Value<String> visualDisability = const Value.absent(),
                Value<String> autism = const Value.absent(),
                Value<String> adhd = const Value.absent(),
                Value<String?> otherCondition = const Value.absent(),
                Value<String?> allergies = const Value.absent(),
                Value<String?> drugAllergies = const Value.absent(),
                Value<String?> foodAllergies = const Value.absent(),
                Value<bool> underMedicalTreatment = const Value.absent(),
                Value<bool> onContinuousMedication = const Value.absent(),
                Value<String?> healthInsurance = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => HealthFormsCompanion.insert(
                id: id,
                memberId: memberId,
                hadCovid: hadCovid,
                hadDengue: hadDengue,
                hadYellowFever: hadYellowFever,
                hadMumps: hadMumps,
                hadChickenpox: hadChickenpox,
                hadMeasles: hadMeasles,
                hadRubella: hadRubella,
                asthma: asthma,
                bronchitis: bronchitis,
                rhinitis: rhinitis,
                epilepsy: epilepsy,
                diabetes: diabetes,
                hypertension: hypertension,
                otherDiseases: otherDiseases,
                physicalDisability: physicalDisability,
                hearingDisability: hearingDisability,
                visualDisability: visualDisability,
                autism: autism,
                adhd: adhd,
                otherCondition: otherCondition,
                allergies: allergies,
                drugAllergies: drugAllergies,
                foodAllergies: foodAllergies,
                underMedicalTreatment: underMedicalTreatment,
                onContinuousMedication: onContinuousMedication,
                healthInsurance: healthInsurance,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$HealthFormsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({memberId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (memberId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.memberId,
                                referencedTable: $$HealthFormsTableReferences
                                    ._memberIdTable(db),
                                referencedColumn: $$HealthFormsTableReferences
                                    ._memberIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$HealthFormsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HealthFormsTable,
      HealthForm,
      $$HealthFormsTableFilterComposer,
      $$HealthFormsTableOrderingComposer,
      $$HealthFormsTableAnnotationComposer,
      $$HealthFormsTableCreateCompanionBuilder,
      $$HealthFormsTableUpdateCompanionBuilder,
      (HealthForm, $$HealthFormsTableReferences),
      HealthForm,
      PrefetchHooks Function({bool memberId})
    >;
typedef $$DivisionsTableCreateCompanionBuilder =
    DivisionsCompanion Function({
      Value<int> id,
      required String name,
      required String acronym,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
    });
typedef $$DivisionsTableUpdateCompanionBuilder =
    DivisionsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> acronym,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
    });

final class $$DivisionsTableReferences
    extends BaseReferences<_$AppDatabase, $DivisionsTable, Division> {
  $$DivisionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CountryDivisionsTable, List<CountryDivision>>
  _countryDivisionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.countryDivisions,
    aliasName: $_aliasNameGenerator(
      db.divisions.id,
      db.countryDivisions.divisionId,
    ),
  );

  $$CountryDivisionsTableProcessedTableManager get countryDivisionsRefs {
    final manager = $$CountryDivisionsTableTableManager(
      $_db,
      $_db.countryDivisions,
    ).filter((f) => f.divisionId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _countryDivisionsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$UnionsTable, List<Union>> _unionsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.unions,
    aliasName: $_aliasNameGenerator(db.divisions.id, db.unions.divisionId),
  );

  $$UnionsTableProcessedTableManager get unionsRefs {
    final manager = $$UnionsTableTableManager(
      $_db,
      $_db.unions,
    ).filter((f) => f.divisionId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_unionsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DivisionsTableFilterComposer
    extends Composer<_$AppDatabase, $DivisionsTable> {
  $$DivisionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get acronym => $composableBuilder(
    column: $table.acronym,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> countryDivisionsRefs(
    Expression<bool> Function($$CountryDivisionsTableFilterComposer f) f,
  ) {
    final $$CountryDivisionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.countryDivisions,
      getReferencedColumn: (t) => t.divisionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CountryDivisionsTableFilterComposer(
            $db: $db,
            $table: $db.countryDivisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> unionsRefs(
    Expression<bool> Function($$UnionsTableFilterComposer f) f,
  ) {
    final $$UnionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.unions,
      getReferencedColumn: (t) => t.divisionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnionsTableFilterComposer(
            $db: $db,
            $table: $db.unions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DivisionsTableOrderingComposer
    extends Composer<_$AppDatabase, $DivisionsTable> {
  $$DivisionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get acronym => $composableBuilder(
    column: $table.acronym,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DivisionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DivisionsTable> {
  $$DivisionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get acronym =>
      $composableBuilder(column: $table.acronym, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> countryDivisionsRefs<T extends Object>(
    Expression<T> Function($$CountryDivisionsTableAnnotationComposer a) f,
  ) {
    final $$CountryDivisionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.countryDivisions,
      getReferencedColumn: (t) => t.divisionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CountryDivisionsTableAnnotationComposer(
            $db: $db,
            $table: $db.countryDivisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> unionsRefs<T extends Object>(
    Expression<T> Function($$UnionsTableAnnotationComposer a) f,
  ) {
    final $$UnionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.unions,
      getReferencedColumn: (t) => t.divisionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnionsTableAnnotationComposer(
            $db: $db,
            $table: $db.unions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DivisionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DivisionsTable,
          Division,
          $$DivisionsTableFilterComposer,
          $$DivisionsTableOrderingComposer,
          $$DivisionsTableAnnotationComposer,
          $$DivisionsTableCreateCompanionBuilder,
          $$DivisionsTableUpdateCompanionBuilder,
          (Division, $$DivisionsTableReferences),
          Division,
          PrefetchHooks Function({bool countryDivisionsRefs, bool unionsRefs})
        > {
  $$DivisionsTableTableManager(_$AppDatabase db, $DivisionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DivisionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DivisionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DivisionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> acronym = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => DivisionsCompanion(
                id: id,
                name: name,
                acronym: acronym,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String acronym,
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => DivisionsCompanion.insert(
                id: id,
                name: name,
                acronym: acronym,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DivisionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({countryDivisionsRefs = false, unionsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (countryDivisionsRefs) db.countryDivisions,
                    if (unionsRefs) db.unions,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (countryDivisionsRefs)
                        await $_getPrefetchedData<
                          Division,
                          $DivisionsTable,
                          CountryDivision
                        >(
                          currentTable: table,
                          referencedTable: $$DivisionsTableReferences
                              ._countryDivisionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DivisionsTableReferences(
                                db,
                                table,
                                p0,
                              ).countryDivisionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.divisionId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (unionsRefs)
                        await $_getPrefetchedData<
                          Division,
                          $DivisionsTable,
                          Union
                        >(
                          currentTable: table,
                          referencedTable: $$DivisionsTableReferences
                              ._unionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DivisionsTableReferences(
                                db,
                                table,
                                p0,
                              ).unionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.divisionId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$DivisionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DivisionsTable,
      Division,
      $$DivisionsTableFilterComposer,
      $$DivisionsTableOrderingComposer,
      $$DivisionsTableAnnotationComposer,
      $$DivisionsTableCreateCompanionBuilder,
      $$DivisionsTableUpdateCompanionBuilder,
      (Division, $$DivisionsTableReferences),
      Division,
      PrefetchHooks Function({bool countryDivisionsRefs, bool unionsRefs})
    >;
typedef $$CountryDivisionsTableCreateCompanionBuilder =
    CountryDivisionsCompanion Function({
      Value<int> id,
      required String country,
      required String acronym,
      required int divisionId,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
    });
typedef $$CountryDivisionsTableUpdateCompanionBuilder =
    CountryDivisionsCompanion Function({
      Value<int> id,
      Value<String> country,
      Value<String> acronym,
      Value<int> divisionId,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
    });

final class $$CountryDivisionsTableReferences
    extends
        BaseReferences<_$AppDatabase, $CountryDivisionsTable, CountryDivision> {
  $$CountryDivisionsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $DivisionsTable _divisionIdTable(_$AppDatabase db) =>
      db.divisions.createAlias(
        $_aliasNameGenerator(db.countryDivisions.divisionId, db.divisions.id),
      );

  $$DivisionsTableProcessedTableManager get divisionId {
    final $_column = $_itemColumn<int>('division_id')!;

    final manager = $$DivisionsTableTableManager(
      $_db,
      $_db.divisions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_divisionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CountryDivisionsTableFilterComposer
    extends Composer<_$AppDatabase, $CountryDivisionsTable> {
  $$CountryDivisionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get country => $composableBuilder(
    column: $table.country,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get acronym => $composableBuilder(
    column: $table.acronym,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$DivisionsTableFilterComposer get divisionId {
    final $$DivisionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.divisionId,
      referencedTable: $db.divisions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DivisionsTableFilterComposer(
            $db: $db,
            $table: $db.divisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CountryDivisionsTableOrderingComposer
    extends Composer<_$AppDatabase, $CountryDivisionsTable> {
  $$CountryDivisionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get country => $composableBuilder(
    column: $table.country,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get acronym => $composableBuilder(
    column: $table.acronym,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$DivisionsTableOrderingComposer get divisionId {
    final $$DivisionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.divisionId,
      referencedTable: $db.divisions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DivisionsTableOrderingComposer(
            $db: $db,
            $table: $db.divisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CountryDivisionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CountryDivisionsTable> {
  $$CountryDivisionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get country =>
      $composableBuilder(column: $table.country, builder: (column) => column);

  GeneratedColumn<String> get acronym =>
      $composableBuilder(column: $table.acronym, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$DivisionsTableAnnotationComposer get divisionId {
    final $$DivisionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.divisionId,
      referencedTable: $db.divisions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DivisionsTableAnnotationComposer(
            $db: $db,
            $table: $db.divisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CountryDivisionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CountryDivisionsTable,
          CountryDivision,
          $$CountryDivisionsTableFilterComposer,
          $$CountryDivisionsTableOrderingComposer,
          $$CountryDivisionsTableAnnotationComposer,
          $$CountryDivisionsTableCreateCompanionBuilder,
          $$CountryDivisionsTableUpdateCompanionBuilder,
          (CountryDivision, $$CountryDivisionsTableReferences),
          CountryDivision,
          PrefetchHooks Function({bool divisionId})
        > {
  $$CountryDivisionsTableTableManager(
    _$AppDatabase db,
    $CountryDivisionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CountryDivisionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CountryDivisionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CountryDivisionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> country = const Value.absent(),
                Value<String> acronym = const Value.absent(),
                Value<int> divisionId = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => CountryDivisionsCompanion(
                id: id,
                country: country,
                acronym: acronym,
                divisionId: divisionId,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String country,
                required String acronym,
                required int divisionId,
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => CountryDivisionsCompanion.insert(
                id: id,
                country: country,
                acronym: acronym,
                divisionId: divisionId,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CountryDivisionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({divisionId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (divisionId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.divisionId,
                                referencedTable:
                                    $$CountryDivisionsTableReferences
                                        ._divisionIdTable(db),
                                referencedColumn:
                                    $$CountryDivisionsTableReferences
                                        ._divisionIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CountryDivisionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CountryDivisionsTable,
      CountryDivision,
      $$CountryDivisionsTableFilterComposer,
      $$CountryDivisionsTableOrderingComposer,
      $$CountryDivisionsTableAnnotationComposer,
      $$CountryDivisionsTableCreateCompanionBuilder,
      $$CountryDivisionsTableUpdateCompanionBuilder,
      (CountryDivision, $$CountryDivisionsTableReferences),
      CountryDivision,
      PrefetchHooks Function({bool divisionId})
    >;
typedef $$UnionsTableCreateCompanionBuilder =
    UnionsCompanion Function({
      Value<int> id,
      required String name,
      required String acronym,
      required int divisionId,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
    });
typedef $$UnionsTableUpdateCompanionBuilder =
    UnionsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> acronym,
      Value<int> divisionId,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
    });

final class $$UnionsTableReferences
    extends BaseReferences<_$AppDatabase, $UnionsTable, Union> {
  $$UnionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $DivisionsTable _divisionIdTable(_$AppDatabase db) => db.divisions
      .createAlias($_aliasNameGenerator(db.unions.divisionId, db.divisions.id));

  $$DivisionsTableProcessedTableManager get divisionId {
    final $_column = $_itemColumn<int>('division_id')!;

    final manager = $$DivisionsTableTableManager(
      $_db,
      $_db.divisions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_divisionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$StateUnionsTable, List<StateUnion>>
  _stateUnionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.stateUnions,
    aliasName: $_aliasNameGenerator(db.unions.id, db.stateUnions.unionId),
  );

  $$StateUnionsTableProcessedTableManager get stateUnionsRefs {
    final manager = $$StateUnionsTableTableManager(
      $_db,
      $_db.stateUnions,
    ).filter((f) => f.unionId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_stateUnionsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$AssociationsTable, List<Association>>
  _associationsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.associations,
    aliasName: $_aliasNameGenerator(db.unions.id, db.associations.unionId),
  );

  $$AssociationsTableProcessedTableManager get associationsRefs {
    final manager = $$AssociationsTableTableManager(
      $_db,
      $_db.associations,
    ).filter((f) => f.unionId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_associationsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UnionsTableFilterComposer
    extends Composer<_$AppDatabase, $UnionsTable> {
  $$UnionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get acronym => $composableBuilder(
    column: $table.acronym,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$DivisionsTableFilterComposer get divisionId {
    final $$DivisionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.divisionId,
      referencedTable: $db.divisions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DivisionsTableFilterComposer(
            $db: $db,
            $table: $db.divisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> stateUnionsRefs(
    Expression<bool> Function($$StateUnionsTableFilterComposer f) f,
  ) {
    final $$StateUnionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.stateUnions,
      getReferencedColumn: (t) => t.unionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StateUnionsTableFilterComposer(
            $db: $db,
            $table: $db.stateUnions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> associationsRefs(
    Expression<bool> Function($$AssociationsTableFilterComposer f) f,
  ) {
    final $$AssociationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.associations,
      getReferencedColumn: (t) => t.unionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AssociationsTableFilterComposer(
            $db: $db,
            $table: $db.associations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UnionsTableOrderingComposer
    extends Composer<_$AppDatabase, $UnionsTable> {
  $$UnionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get acronym => $composableBuilder(
    column: $table.acronym,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$DivisionsTableOrderingComposer get divisionId {
    final $$DivisionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.divisionId,
      referencedTable: $db.divisions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DivisionsTableOrderingComposer(
            $db: $db,
            $table: $db.divisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UnionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $UnionsTable> {
  $$UnionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get acronym =>
      $composableBuilder(column: $table.acronym, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$DivisionsTableAnnotationComposer get divisionId {
    final $$DivisionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.divisionId,
      referencedTable: $db.divisions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DivisionsTableAnnotationComposer(
            $db: $db,
            $table: $db.divisions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> stateUnionsRefs<T extends Object>(
    Expression<T> Function($$StateUnionsTableAnnotationComposer a) f,
  ) {
    final $$StateUnionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.stateUnions,
      getReferencedColumn: (t) => t.unionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StateUnionsTableAnnotationComposer(
            $db: $db,
            $table: $db.stateUnions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> associationsRefs<T extends Object>(
    Expression<T> Function($$AssociationsTableAnnotationComposer a) f,
  ) {
    final $$AssociationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.associations,
      getReferencedColumn: (t) => t.unionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AssociationsTableAnnotationComposer(
            $db: $db,
            $table: $db.associations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UnionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UnionsTable,
          Union,
          $$UnionsTableFilterComposer,
          $$UnionsTableOrderingComposer,
          $$UnionsTableAnnotationComposer,
          $$UnionsTableCreateCompanionBuilder,
          $$UnionsTableUpdateCompanionBuilder,
          (Union, $$UnionsTableReferences),
          Union,
          PrefetchHooks Function({
            bool divisionId,
            bool stateUnionsRefs,
            bool associationsRefs,
          })
        > {
  $$UnionsTableTableManager(_$AppDatabase db, $UnionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UnionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UnionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UnionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> acronym = const Value.absent(),
                Value<int> divisionId = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => UnionsCompanion(
                id: id,
                name: name,
                acronym: acronym,
                divisionId: divisionId,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String acronym,
                required int divisionId,
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => UnionsCompanion.insert(
                id: id,
                name: name,
                acronym: acronym,
                divisionId: divisionId,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$UnionsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                divisionId = false,
                stateUnionsRefs = false,
                associationsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (stateUnionsRefs) db.stateUnions,
                    if (associationsRefs) db.associations,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (divisionId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.divisionId,
                                    referencedTable: $$UnionsTableReferences
                                        ._divisionIdTable(db),
                                    referencedColumn: $$UnionsTableReferences
                                        ._divisionIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (stateUnionsRefs)
                        await $_getPrefetchedData<
                          Union,
                          $UnionsTable,
                          StateUnion
                        >(
                          currentTable: table,
                          referencedTable: $$UnionsTableReferences
                              ._stateUnionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UnionsTableReferences(
                                db,
                                table,
                                p0,
                              ).stateUnionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.unionId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (associationsRefs)
                        await $_getPrefetchedData<
                          Union,
                          $UnionsTable,
                          Association
                        >(
                          currentTable: table,
                          referencedTable: $$UnionsTableReferences
                              ._associationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UnionsTableReferences(
                                db,
                                table,
                                p0,
                              ).associationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.unionId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$UnionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UnionsTable,
      Union,
      $$UnionsTableFilterComposer,
      $$UnionsTableOrderingComposer,
      $$UnionsTableAnnotationComposer,
      $$UnionsTableCreateCompanionBuilder,
      $$UnionsTableUpdateCompanionBuilder,
      (Union, $$UnionsTableReferences),
      Union,
      PrefetchHooks Function({
        bool divisionId,
        bool stateUnionsRefs,
        bool associationsRefs,
      })
    >;
typedef $$StateUnionsTableCreateCompanionBuilder =
    StateUnionsCompanion Function({
      Value<int> id,
      required String state,
      required String acronym,
      required int unionId,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
    });
typedef $$StateUnionsTableUpdateCompanionBuilder =
    StateUnionsCompanion Function({
      Value<int> id,
      Value<String> state,
      Value<String> acronym,
      Value<int> unionId,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
    });

final class $$StateUnionsTableReferences
    extends BaseReferences<_$AppDatabase, $StateUnionsTable, StateUnion> {
  $$StateUnionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UnionsTable _unionIdTable(_$AppDatabase db) => db.unions.createAlias(
    $_aliasNameGenerator(db.stateUnions.unionId, db.unions.id),
  );

  $$UnionsTableProcessedTableManager get unionId {
    final $_column = $_itemColumn<int>('union_id')!;

    final manager = $$UnionsTableTableManager(
      $_db,
      $_db.unions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_unionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$StateUnionsTableFilterComposer
    extends Composer<_$AppDatabase, $StateUnionsTable> {
  $$StateUnionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get state => $composableBuilder(
    column: $table.state,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get acronym => $composableBuilder(
    column: $table.acronym,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$UnionsTableFilterComposer get unionId {
    final $$UnionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.unionId,
      referencedTable: $db.unions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnionsTableFilterComposer(
            $db: $db,
            $table: $db.unions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StateUnionsTableOrderingComposer
    extends Composer<_$AppDatabase, $StateUnionsTable> {
  $$StateUnionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get state => $composableBuilder(
    column: $table.state,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get acronym => $composableBuilder(
    column: $table.acronym,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$UnionsTableOrderingComposer get unionId {
    final $$UnionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.unionId,
      referencedTable: $db.unions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnionsTableOrderingComposer(
            $db: $db,
            $table: $db.unions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StateUnionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $StateUnionsTable> {
  $$StateUnionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get state =>
      $composableBuilder(column: $table.state, builder: (column) => column);

  GeneratedColumn<String> get acronym =>
      $composableBuilder(column: $table.acronym, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$UnionsTableAnnotationComposer get unionId {
    final $$UnionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.unionId,
      referencedTable: $db.unions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnionsTableAnnotationComposer(
            $db: $db,
            $table: $db.unions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StateUnionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StateUnionsTable,
          StateUnion,
          $$StateUnionsTableFilterComposer,
          $$StateUnionsTableOrderingComposer,
          $$StateUnionsTableAnnotationComposer,
          $$StateUnionsTableCreateCompanionBuilder,
          $$StateUnionsTableUpdateCompanionBuilder,
          (StateUnion, $$StateUnionsTableReferences),
          StateUnion,
          PrefetchHooks Function({bool unionId})
        > {
  $$StateUnionsTableTableManager(_$AppDatabase db, $StateUnionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StateUnionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StateUnionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StateUnionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> state = const Value.absent(),
                Value<String> acronym = const Value.absent(),
                Value<int> unionId = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => StateUnionsCompanion(
                id: id,
                state: state,
                acronym: acronym,
                unionId: unionId,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String state,
                required String acronym,
                required int unionId,
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => StateUnionsCompanion.insert(
                id: id,
                state: state,
                acronym: acronym,
                unionId: unionId,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$StateUnionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({unionId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (unionId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.unionId,
                                referencedTable: $$StateUnionsTableReferences
                                    ._unionIdTable(db),
                                referencedColumn: $$StateUnionsTableReferences
                                    ._unionIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$StateUnionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StateUnionsTable,
      StateUnion,
      $$StateUnionsTableFilterComposer,
      $$StateUnionsTableOrderingComposer,
      $$StateUnionsTableAnnotationComposer,
      $$StateUnionsTableCreateCompanionBuilder,
      $$StateUnionsTableUpdateCompanionBuilder,
      (StateUnion, $$StateUnionsTableReferences),
      StateUnion,
      PrefetchHooks Function({bool unionId})
    >;
typedef $$AssociationsTableCreateCompanionBuilder =
    AssociationsCompanion Function({
      Value<int> id,
      required String name,
      required String acronym,
      required int unionId,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
    });
typedef $$AssociationsTableUpdateCompanionBuilder =
    AssociationsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> acronym,
      Value<int> unionId,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
    });

final class $$AssociationsTableReferences
    extends BaseReferences<_$AppDatabase, $AssociationsTable, Association> {
  $$AssociationsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UnionsTable _unionIdTable(_$AppDatabase db) => db.unions.createAlias(
    $_aliasNameGenerator(db.associations.unionId, db.unions.id),
  );

  $$UnionsTableProcessedTableManager get unionId {
    final $_column = $_itemColumn<int>('union_id')!;

    final manager = $$UnionsTableTableManager(
      $_db,
      $_db.unions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_unionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$RegionsTable, List<Region>> _regionsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.regions,
    aliasName: $_aliasNameGenerator(
      db.associations.id,
      db.regions.associationId,
    ),
  );

  $$RegionsTableProcessedTableManager get regionsRefs {
    final manager = $$RegionsTableTableManager(
      $_db,
      $_db.regions,
    ).filter((f) => f.associationId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_regionsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AssociationsTableFilterComposer
    extends Composer<_$AppDatabase, $AssociationsTable> {
  $$AssociationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get acronym => $composableBuilder(
    column: $table.acronym,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$UnionsTableFilterComposer get unionId {
    final $$UnionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.unionId,
      referencedTable: $db.unions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnionsTableFilterComposer(
            $db: $db,
            $table: $db.unions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> regionsRefs(
    Expression<bool> Function($$RegionsTableFilterComposer f) f,
  ) {
    final $$RegionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.regions,
      getReferencedColumn: (t) => t.associationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RegionsTableFilterComposer(
            $db: $db,
            $table: $db.regions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AssociationsTableOrderingComposer
    extends Composer<_$AppDatabase, $AssociationsTable> {
  $$AssociationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get acronym => $composableBuilder(
    column: $table.acronym,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$UnionsTableOrderingComposer get unionId {
    final $$UnionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.unionId,
      referencedTable: $db.unions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnionsTableOrderingComposer(
            $db: $db,
            $table: $db.unions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AssociationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AssociationsTable> {
  $$AssociationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get acronym =>
      $composableBuilder(column: $table.acronym, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$UnionsTableAnnotationComposer get unionId {
    final $$UnionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.unionId,
      referencedTable: $db.unions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnionsTableAnnotationComposer(
            $db: $db,
            $table: $db.unions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> regionsRefs<T extends Object>(
    Expression<T> Function($$RegionsTableAnnotationComposer a) f,
  ) {
    final $$RegionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.regions,
      getReferencedColumn: (t) => t.associationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RegionsTableAnnotationComposer(
            $db: $db,
            $table: $db.regions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AssociationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AssociationsTable,
          Association,
          $$AssociationsTableFilterComposer,
          $$AssociationsTableOrderingComposer,
          $$AssociationsTableAnnotationComposer,
          $$AssociationsTableCreateCompanionBuilder,
          $$AssociationsTableUpdateCompanionBuilder,
          (Association, $$AssociationsTableReferences),
          Association,
          PrefetchHooks Function({bool unionId, bool regionsRefs})
        > {
  $$AssociationsTableTableManager(_$AppDatabase db, $AssociationsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AssociationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AssociationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AssociationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> acronym = const Value.absent(),
                Value<int> unionId = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => AssociationsCompanion(
                id: id,
                name: name,
                acronym: acronym,
                unionId: unionId,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String acronym,
                required int unionId,
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => AssociationsCompanion.insert(
                id: id,
                name: name,
                acronym: acronym,
                unionId: unionId,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AssociationsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({unionId = false, regionsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (regionsRefs) db.regions],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (unionId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.unionId,
                                referencedTable: $$AssociationsTableReferences
                                    ._unionIdTable(db),
                                referencedColumn: $$AssociationsTableReferences
                                    ._unionIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (regionsRefs)
                    await $_getPrefetchedData<
                      Association,
                      $AssociationsTable,
                      Region
                    >(
                      currentTable: table,
                      referencedTable: $$AssociationsTableReferences
                          ._regionsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$AssociationsTableReferences(
                            db,
                            table,
                            p0,
                          ).regionsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.associationId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$AssociationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AssociationsTable,
      Association,
      $$AssociationsTableFilterComposer,
      $$AssociationsTableOrderingComposer,
      $$AssociationsTableAnnotationComposer,
      $$AssociationsTableCreateCompanionBuilder,
      $$AssociationsTableUpdateCompanionBuilder,
      (Association, $$AssociationsTableReferences),
      Association,
      PrefetchHooks Function({bool unionId, bool regionsRefs})
    >;
typedef $$RegionsTableCreateCompanionBuilder =
    RegionsCompanion Function({
      Value<int> id,
      required String name,
      required String acronym,
      required int associationId,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
    });
typedef $$RegionsTableUpdateCompanionBuilder =
    RegionsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> acronym,
      Value<int> associationId,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
    });

final class $$RegionsTableReferences
    extends BaseReferences<_$AppDatabase, $RegionsTable, Region> {
  $$RegionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AssociationsTable _associationIdTable(_$AppDatabase db) =>
      db.associations.createAlias(
        $_aliasNameGenerator(db.regions.associationId, db.associations.id),
      );

  $$AssociationsTableProcessedTableManager get associationId {
    final $_column = $_itemColumn<int>('association_id')!;

    final manager = $$AssociationsTableTableManager(
      $_db,
      $_db.associations,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_associationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$DistrictsTable, List<District>>
  _districtsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.districts,
    aliasName: $_aliasNameGenerator(db.regions.id, db.districts.regionId),
  );

  $$DistrictsTableProcessedTableManager get districtsRefs {
    final manager = $$DistrictsTableTableManager(
      $_db,
      $_db.districts,
    ).filter((f) => f.regionId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_districtsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RegionsTableFilterComposer
    extends Composer<_$AppDatabase, $RegionsTable> {
  $$RegionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get acronym => $composableBuilder(
    column: $table.acronym,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$AssociationsTableFilterComposer get associationId {
    final $$AssociationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.associationId,
      referencedTable: $db.associations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AssociationsTableFilterComposer(
            $db: $db,
            $table: $db.associations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> districtsRefs(
    Expression<bool> Function($$DistrictsTableFilterComposer f) f,
  ) {
    final $$DistrictsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.districts,
      getReferencedColumn: (t) => t.regionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DistrictsTableFilterComposer(
            $db: $db,
            $table: $db.districts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RegionsTableOrderingComposer
    extends Composer<_$AppDatabase, $RegionsTable> {
  $$RegionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get acronym => $composableBuilder(
    column: $table.acronym,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$AssociationsTableOrderingComposer get associationId {
    final $$AssociationsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.associationId,
      referencedTable: $db.associations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AssociationsTableOrderingComposer(
            $db: $db,
            $table: $db.associations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RegionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RegionsTable> {
  $$RegionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get acronym =>
      $composableBuilder(column: $table.acronym, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$AssociationsTableAnnotationComposer get associationId {
    final $$AssociationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.associationId,
      referencedTable: $db.associations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AssociationsTableAnnotationComposer(
            $db: $db,
            $table: $db.associations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> districtsRefs<T extends Object>(
    Expression<T> Function($$DistrictsTableAnnotationComposer a) f,
  ) {
    final $$DistrictsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.districts,
      getReferencedColumn: (t) => t.regionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DistrictsTableAnnotationComposer(
            $db: $db,
            $table: $db.districts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RegionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RegionsTable,
          Region,
          $$RegionsTableFilterComposer,
          $$RegionsTableOrderingComposer,
          $$RegionsTableAnnotationComposer,
          $$RegionsTableCreateCompanionBuilder,
          $$RegionsTableUpdateCompanionBuilder,
          (Region, $$RegionsTableReferences),
          Region,
          PrefetchHooks Function({bool associationId, bool districtsRefs})
        > {
  $$RegionsTableTableManager(_$AppDatabase db, $RegionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RegionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RegionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RegionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> acronym = const Value.absent(),
                Value<int> associationId = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => RegionsCompanion(
                id: id,
                name: name,
                acronym: acronym,
                associationId: associationId,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String acronym,
                required int associationId,
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => RegionsCompanion.insert(
                id: id,
                name: name,
                acronym: acronym,
                associationId: associationId,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RegionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({associationId = false, districtsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [if (districtsRefs) db.districts],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (associationId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.associationId,
                                    referencedTable: $$RegionsTableReferences
                                        ._associationIdTable(db),
                                    referencedColumn: $$RegionsTableReferences
                                        ._associationIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (districtsRefs)
                        await $_getPrefetchedData<
                          Region,
                          $RegionsTable,
                          District
                        >(
                          currentTable: table,
                          referencedTable: $$RegionsTableReferences
                              ._districtsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RegionsTableReferences(
                                db,
                                table,
                                p0,
                              ).districtsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.regionId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$RegionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RegionsTable,
      Region,
      $$RegionsTableFilterComposer,
      $$RegionsTableOrderingComposer,
      $$RegionsTableAnnotationComposer,
      $$RegionsTableCreateCompanionBuilder,
      $$RegionsTableUpdateCompanionBuilder,
      (Region, $$RegionsTableReferences),
      Region,
      PrefetchHooks Function({bool associationId, bool districtsRefs})
    >;
typedef $$DistrictsTableCreateCompanionBuilder =
    DistrictsCompanion Function({
      Value<int> id,
      required String name,
      required String acronym,
      required int regionId,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
    });
typedef $$DistrictsTableUpdateCompanionBuilder =
    DistrictsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> acronym,
      Value<int> regionId,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
    });

final class $$DistrictsTableReferences
    extends BaseReferences<_$AppDatabase, $DistrictsTable, District> {
  $$DistrictsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $RegionsTable _regionIdTable(_$AppDatabase db) => db.regions
      .createAlias($_aliasNameGenerator(db.districts.regionId, db.regions.id));

  $$RegionsTableProcessedTableManager get regionId {
    final $_column = $_itemColumn<int>('region_id')!;

    final manager = $$RegionsTableTableManager(
      $_db,
      $_db.regions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_regionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$ChurchesTable, List<Church>> _churchesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.churches,
    aliasName: $_aliasNameGenerator(db.districts.id, db.churches.districtId),
  );

  $$ChurchesTableProcessedTableManager get churchesRefs {
    final manager = $$ChurchesTableTableManager(
      $_db,
      $_db.churches,
    ).filter((f) => f.districtId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_churchesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ClubsTable, List<Club>> _clubsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.clubs,
    aliasName: $_aliasNameGenerator(db.districts.id, db.clubs.districtId),
  );

  $$ClubsTableProcessedTableManager get clubsRefs {
    final manager = $$ClubsTableTableManager(
      $_db,
      $_db.clubs,
    ).filter((f) => f.districtId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_clubsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DistrictsTableFilterComposer
    extends Composer<_$AppDatabase, $DistrictsTable> {
  $$DistrictsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get acronym => $composableBuilder(
    column: $table.acronym,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$RegionsTableFilterComposer get regionId {
    final $$RegionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.regionId,
      referencedTable: $db.regions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RegionsTableFilterComposer(
            $db: $db,
            $table: $db.regions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> churchesRefs(
    Expression<bool> Function($$ChurchesTableFilterComposer f) f,
  ) {
    final $$ChurchesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.churches,
      getReferencedColumn: (t) => t.districtId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChurchesTableFilterComposer(
            $db: $db,
            $table: $db.churches,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> clubsRefs(
    Expression<bool> Function($$ClubsTableFilterComposer f) f,
  ) {
    final $$ClubsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.clubs,
      getReferencedColumn: (t) => t.districtId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClubsTableFilterComposer(
            $db: $db,
            $table: $db.clubs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DistrictsTableOrderingComposer
    extends Composer<_$AppDatabase, $DistrictsTable> {
  $$DistrictsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get acronym => $composableBuilder(
    column: $table.acronym,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$RegionsTableOrderingComposer get regionId {
    final $$RegionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.regionId,
      referencedTable: $db.regions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RegionsTableOrderingComposer(
            $db: $db,
            $table: $db.regions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DistrictsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DistrictsTable> {
  $$DistrictsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get acronym =>
      $composableBuilder(column: $table.acronym, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$RegionsTableAnnotationComposer get regionId {
    final $$RegionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.regionId,
      referencedTable: $db.regions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RegionsTableAnnotationComposer(
            $db: $db,
            $table: $db.regions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> churchesRefs<T extends Object>(
    Expression<T> Function($$ChurchesTableAnnotationComposer a) f,
  ) {
    final $$ChurchesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.churches,
      getReferencedColumn: (t) => t.districtId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChurchesTableAnnotationComposer(
            $db: $db,
            $table: $db.churches,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> clubsRefs<T extends Object>(
    Expression<T> Function($$ClubsTableAnnotationComposer a) f,
  ) {
    final $$ClubsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.clubs,
      getReferencedColumn: (t) => t.districtId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClubsTableAnnotationComposer(
            $db: $db,
            $table: $db.clubs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DistrictsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DistrictsTable,
          District,
          $$DistrictsTableFilterComposer,
          $$DistrictsTableOrderingComposer,
          $$DistrictsTableAnnotationComposer,
          $$DistrictsTableCreateCompanionBuilder,
          $$DistrictsTableUpdateCompanionBuilder,
          (District, $$DistrictsTableReferences),
          District,
          PrefetchHooks Function({
            bool regionId,
            bool churchesRefs,
            bool clubsRefs,
          })
        > {
  $$DistrictsTableTableManager(_$AppDatabase db, $DistrictsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DistrictsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DistrictsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DistrictsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> acronym = const Value.absent(),
                Value<int> regionId = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => DistrictsCompanion(
                id: id,
                name: name,
                acronym: acronym,
                regionId: regionId,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String acronym,
                required int regionId,
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => DistrictsCompanion.insert(
                id: id,
                name: name,
                acronym: acronym,
                regionId: regionId,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DistrictsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({regionId = false, churchesRefs = false, clubsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (churchesRefs) db.churches,
                    if (clubsRefs) db.clubs,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (regionId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.regionId,
                                    referencedTable: $$DistrictsTableReferences
                                        ._regionIdTable(db),
                                    referencedColumn: $$DistrictsTableReferences
                                        ._regionIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (churchesRefs)
                        await $_getPrefetchedData<
                          District,
                          $DistrictsTable,
                          Church
                        >(
                          currentTable: table,
                          referencedTable: $$DistrictsTableReferences
                              ._churchesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DistrictsTableReferences(
                                db,
                                table,
                                p0,
                              ).churchesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.districtId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (clubsRefs)
                        await $_getPrefetchedData<
                          District,
                          $DistrictsTable,
                          Club
                        >(
                          currentTable: table,
                          referencedTable: $$DistrictsTableReferences
                              ._clubsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DistrictsTableReferences(
                                db,
                                table,
                                p0,
                              ).clubsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.districtId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$DistrictsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DistrictsTable,
      District,
      $$DistrictsTableFilterComposer,
      $$DistrictsTableOrderingComposer,
      $$DistrictsTableAnnotationComposer,
      $$DistrictsTableCreateCompanionBuilder,
      $$DistrictsTableUpdateCompanionBuilder,
      (District, $$DistrictsTableReferences),
      District,
      PrefetchHooks Function({bool regionId, bool churchesRefs, bool clubsRefs})
    >;
typedef $$ChurchesTableCreateCompanionBuilder =
    ChurchesCompanion Function({
      Value<int> id,
      required String name,
      required int districtId,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
    });
typedef $$ChurchesTableUpdateCompanionBuilder =
    ChurchesCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int> districtId,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
    });

final class $$ChurchesTableReferences
    extends BaseReferences<_$AppDatabase, $ChurchesTable, Church> {
  $$ChurchesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $DistrictsTable _districtIdTable(_$AppDatabase db) =>
      db.districts.createAlias(
        $_aliasNameGenerator(db.churches.districtId, db.districts.id),
      );

  $$DistrictsTableProcessedTableManager get districtId {
    final $_column = $_itemColumn<int>('district_id')!;

    final manager = $$DistrictsTableTableManager(
      $_db,
      $_db.districts,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_districtIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$ClubsTable, List<Club>> _clubsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.clubs,
    aliasName: $_aliasNameGenerator(db.churches.id, db.clubs.churchId),
  );

  $$ClubsTableProcessedTableManager get clubsRefs {
    final manager = $$ClubsTableTableManager(
      $_db,
      $_db.clubs,
    ).filter((f) => f.churchId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_clubsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ChurchesTableFilterComposer
    extends Composer<_$AppDatabase, $ChurchesTable> {
  $$ChurchesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$DistrictsTableFilterComposer get districtId {
    final $$DistrictsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.districtId,
      referencedTable: $db.districts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DistrictsTableFilterComposer(
            $db: $db,
            $table: $db.districts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> clubsRefs(
    Expression<bool> Function($$ClubsTableFilterComposer f) f,
  ) {
    final $$ClubsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.clubs,
      getReferencedColumn: (t) => t.churchId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClubsTableFilterComposer(
            $db: $db,
            $table: $db.clubs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ChurchesTableOrderingComposer
    extends Composer<_$AppDatabase, $ChurchesTable> {
  $$ChurchesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$DistrictsTableOrderingComposer get districtId {
    final $$DistrictsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.districtId,
      referencedTable: $db.districts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DistrictsTableOrderingComposer(
            $db: $db,
            $table: $db.districts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ChurchesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ChurchesTable> {
  $$ChurchesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$DistrictsTableAnnotationComposer get districtId {
    final $$DistrictsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.districtId,
      referencedTable: $db.districts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DistrictsTableAnnotationComposer(
            $db: $db,
            $table: $db.districts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> clubsRefs<T extends Object>(
    Expression<T> Function($$ClubsTableAnnotationComposer a) f,
  ) {
    final $$ClubsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.clubs,
      getReferencedColumn: (t) => t.churchId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClubsTableAnnotationComposer(
            $db: $db,
            $table: $db.clubs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ChurchesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ChurchesTable,
          Church,
          $$ChurchesTableFilterComposer,
          $$ChurchesTableOrderingComposer,
          $$ChurchesTableAnnotationComposer,
          $$ChurchesTableCreateCompanionBuilder,
          $$ChurchesTableUpdateCompanionBuilder,
          (Church, $$ChurchesTableReferences),
          Church,
          PrefetchHooks Function({bool districtId, bool clubsRefs})
        > {
  $$ChurchesTableTableManager(_$AppDatabase db, $ChurchesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChurchesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChurchesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ChurchesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> districtId = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => ChurchesCompanion(
                id: id,
                name: name,
                districtId: districtId,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required int districtId,
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => ChurchesCompanion.insert(
                id: id,
                name: name,
                districtId: districtId,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ChurchesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({districtId = false, clubsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (clubsRefs) db.clubs],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (districtId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.districtId,
                                referencedTable: $$ChurchesTableReferences
                                    ._districtIdTable(db),
                                referencedColumn: $$ChurchesTableReferences
                                    ._districtIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (clubsRefs)
                    await $_getPrefetchedData<Church, $ChurchesTable, Club>(
                      currentTable: table,
                      referencedTable: $$ChurchesTableReferences
                          ._clubsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ChurchesTableReferences(db, table, p0).clubsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.churchId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ChurchesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ChurchesTable,
      Church,
      $$ChurchesTableFilterComposer,
      $$ChurchesTableOrderingComposer,
      $$ChurchesTableAnnotationComposer,
      $$ChurchesTableCreateCompanionBuilder,
      $$ChurchesTableUpdateCompanionBuilder,
      (Church, $$ChurchesTableReferences),
      Church,
      PrefetchHooks Function({bool districtId, bool clubsRefs})
    >;
typedef $$ClubsTableCreateCompanionBuilder =
    ClubsCompanion Function({
      Value<int> id,
      required String name,
      required DateTime dateFundation,
      Value<String?> symbol,
      Value<String?> history,
      Value<String?> cep,
      Value<String?> street,
      Value<String?> number,
      Value<String?> neighborhood,
      Value<String?> city,
      Value<String?> state,
      Value<String?> complement,
      required int churchId,
      required int districtId,
      Value<int> stars,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
    });
typedef $$ClubsTableUpdateCompanionBuilder =
    ClubsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<DateTime> dateFundation,
      Value<String?> symbol,
      Value<String?> history,
      Value<String?> cep,
      Value<String?> street,
      Value<String?> number,
      Value<String?> neighborhood,
      Value<String?> city,
      Value<String?> state,
      Value<String?> complement,
      Value<int> churchId,
      Value<int> districtId,
      Value<int> stars,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
    });

final class $$ClubsTableReferences
    extends BaseReferences<_$AppDatabase, $ClubsTable, Club> {
  $$ClubsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ChurchesTable _churchIdTable(_$AppDatabase db) => db.churches
      .createAlias($_aliasNameGenerator(db.clubs.churchId, db.churches.id));

  $$ChurchesTableProcessedTableManager get churchId {
    final $_column = $_itemColumn<int>('church_id')!;

    final manager = $$ChurchesTableTableManager(
      $_db,
      $_db.churches,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_churchIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $DistrictsTable _districtIdTable(_$AppDatabase db) => db.districts
      .createAlias($_aliasNameGenerator(db.clubs.districtId, db.districts.id));

  $$DistrictsTableProcessedTableManager get districtId {
    final $_column = $_itemColumn<int>('district_id')!;

    final manager = $$DistrictsTableTableManager(
      $_db,
      $_db.districts,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_districtIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ClubsTableFilterComposer extends Composer<_$AppDatabase, $ClubsTable> {
  $$ClubsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateFundation => $composableBuilder(
    column: $table.dateFundation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get symbol => $composableBuilder(
    column: $table.symbol,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get history => $composableBuilder(
    column: $table.history,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cep => $composableBuilder(
    column: $table.cep,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get street => $composableBuilder(
    column: $table.street,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get number => $composableBuilder(
    column: $table.number,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get neighborhood => $composableBuilder(
    column: $table.neighborhood,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get state => $composableBuilder(
    column: $table.state,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get complement => $composableBuilder(
    column: $table.complement,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get stars => $composableBuilder(
    column: $table.stars,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$ChurchesTableFilterComposer get churchId {
    final $$ChurchesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.churchId,
      referencedTable: $db.churches,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChurchesTableFilterComposer(
            $db: $db,
            $table: $db.churches,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DistrictsTableFilterComposer get districtId {
    final $$DistrictsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.districtId,
      referencedTable: $db.districts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DistrictsTableFilterComposer(
            $db: $db,
            $table: $db.districts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ClubsTableOrderingComposer
    extends Composer<_$AppDatabase, $ClubsTable> {
  $$ClubsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateFundation => $composableBuilder(
    column: $table.dateFundation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get symbol => $composableBuilder(
    column: $table.symbol,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get history => $composableBuilder(
    column: $table.history,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cep => $composableBuilder(
    column: $table.cep,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get street => $composableBuilder(
    column: $table.street,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get number => $composableBuilder(
    column: $table.number,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get neighborhood => $composableBuilder(
    column: $table.neighborhood,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get state => $composableBuilder(
    column: $table.state,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get complement => $composableBuilder(
    column: $table.complement,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get stars => $composableBuilder(
    column: $table.stars,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$ChurchesTableOrderingComposer get churchId {
    final $$ChurchesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.churchId,
      referencedTable: $db.churches,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChurchesTableOrderingComposer(
            $db: $db,
            $table: $db.churches,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DistrictsTableOrderingComposer get districtId {
    final $$DistrictsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.districtId,
      referencedTable: $db.districts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DistrictsTableOrderingComposer(
            $db: $db,
            $table: $db.districts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ClubsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ClubsTable> {
  $$ClubsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get dateFundation => $composableBuilder(
    column: $table.dateFundation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get symbol =>
      $composableBuilder(column: $table.symbol, builder: (column) => column);

  GeneratedColumn<String> get history =>
      $composableBuilder(column: $table.history, builder: (column) => column);

  GeneratedColumn<String> get cep =>
      $composableBuilder(column: $table.cep, builder: (column) => column);

  GeneratedColumn<String> get street =>
      $composableBuilder(column: $table.street, builder: (column) => column);

  GeneratedColumn<String> get number =>
      $composableBuilder(column: $table.number, builder: (column) => column);

  GeneratedColumn<String> get neighborhood => $composableBuilder(
    column: $table.neighborhood,
    builder: (column) => column,
  );

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  GeneratedColumn<String> get state =>
      $composableBuilder(column: $table.state, builder: (column) => column);

  GeneratedColumn<String> get complement => $composableBuilder(
    column: $table.complement,
    builder: (column) => column,
  );

  GeneratedColumn<int> get stars =>
      $composableBuilder(column: $table.stars, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$ChurchesTableAnnotationComposer get churchId {
    final $$ChurchesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.churchId,
      referencedTable: $db.churches,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChurchesTableAnnotationComposer(
            $db: $db,
            $table: $db.churches,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DistrictsTableAnnotationComposer get districtId {
    final $$DistrictsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.districtId,
      referencedTable: $db.districts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DistrictsTableAnnotationComposer(
            $db: $db,
            $table: $db.districts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ClubsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ClubsTable,
          Club,
          $$ClubsTableFilterComposer,
          $$ClubsTableOrderingComposer,
          $$ClubsTableAnnotationComposer,
          $$ClubsTableCreateCompanionBuilder,
          $$ClubsTableUpdateCompanionBuilder,
          (Club, $$ClubsTableReferences),
          Club,
          PrefetchHooks Function({bool churchId, bool districtId})
        > {
  $$ClubsTableTableManager(_$AppDatabase db, $ClubsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ClubsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ClubsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ClubsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<DateTime> dateFundation = const Value.absent(),
                Value<String?> symbol = const Value.absent(),
                Value<String?> history = const Value.absent(),
                Value<String?> cep = const Value.absent(),
                Value<String?> street = const Value.absent(),
                Value<String?> number = const Value.absent(),
                Value<String?> neighborhood = const Value.absent(),
                Value<String?> city = const Value.absent(),
                Value<String?> state = const Value.absent(),
                Value<String?> complement = const Value.absent(),
                Value<int> churchId = const Value.absent(),
                Value<int> districtId = const Value.absent(),
                Value<int> stars = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => ClubsCompanion(
                id: id,
                name: name,
                dateFundation: dateFundation,
                symbol: symbol,
                history: history,
                cep: cep,
                street: street,
                number: number,
                neighborhood: neighborhood,
                city: city,
                state: state,
                complement: complement,
                churchId: churchId,
                districtId: districtId,
                stars: stars,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required DateTime dateFundation,
                Value<String?> symbol = const Value.absent(),
                Value<String?> history = const Value.absent(),
                Value<String?> cep = const Value.absent(),
                Value<String?> street = const Value.absent(),
                Value<String?> number = const Value.absent(),
                Value<String?> neighborhood = const Value.absent(),
                Value<String?> city = const Value.absent(),
                Value<String?> state = const Value.absent(),
                Value<String?> complement = const Value.absent(),
                required int churchId,
                required int districtId,
                Value<int> stars = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => ClubsCompanion.insert(
                id: id,
                name: name,
                dateFundation: dateFundation,
                symbol: symbol,
                history: history,
                cep: cep,
                street: street,
                number: number,
                neighborhood: neighborhood,
                city: city,
                state: state,
                complement: complement,
                churchId: churchId,
                districtId: districtId,
                stars: stars,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$ClubsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({churchId = false, districtId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (churchId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.churchId,
                                referencedTable: $$ClubsTableReferences
                                    ._churchIdTable(db),
                                referencedColumn: $$ClubsTableReferences
                                    ._churchIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (districtId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.districtId,
                                referencedTable: $$ClubsTableReferences
                                    ._districtIdTable(db),
                                referencedColumn: $$ClubsTableReferences
                                    ._districtIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ClubsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ClubsTable,
      Club,
      $$ClubsTableFilterComposer,
      $$ClubsTableOrderingComposer,
      $$ClubsTableAnnotationComposer,
      $$ClubsTableCreateCompanionBuilder,
      $$ClubsTableUpdateCompanionBuilder,
      (Club, $$ClubsTableReferences),
      Club,
      PrefetchHooks Function({bool churchId, bool districtId})
    >;
typedef $$MemberRolesTableCreateCompanionBuilder =
    MemberRolesCompanion Function({
      Value<int> id,
      required int memberId,
      required int functionMemberId,
      Value<int?> clubId,
      Value<int?> districtId,
      Value<int?> regionId,
      Value<int?> associationId,
      Value<int?> unionId,
      Value<int?> divisionId,
      Value<DateTime?> startDate,
      Value<DateTime?> endDate,
    });
typedef $$MemberRolesTableUpdateCompanionBuilder =
    MemberRolesCompanion Function({
      Value<int> id,
      Value<int> memberId,
      Value<int> functionMemberId,
      Value<int?> clubId,
      Value<int?> districtId,
      Value<int?> regionId,
      Value<int?> associationId,
      Value<int?> unionId,
      Value<int?> divisionId,
      Value<DateTime?> startDate,
      Value<DateTime?> endDate,
    });

final class $$MemberRolesTableReferences
    extends BaseReferences<_$AppDatabase, $MemberRolesTable, MemberRole> {
  $$MemberRolesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MembersTable _memberIdTable(_$AppDatabase db) =>
      db.members.createAlias(
        $_aliasNameGenerator(db.memberRoles.memberId, db.members.id),
      );

  $$MembersTableProcessedTableManager get memberId {
    final $_column = $_itemColumn<int>('member_id')!;

    final manager = $$MembersTableTableManager(
      $_db,
      $_db.members,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_memberIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $FunctionMembersTable _functionMemberIdTable(_$AppDatabase db) =>
      db.functionMembers.createAlias(
        $_aliasNameGenerator(
          db.memberRoles.functionMemberId,
          db.functionMembers.id,
        ),
      );

  $$FunctionMembersTableProcessedTableManager get functionMemberId {
    final $_column = $_itemColumn<int>('function_member_id')!;

    final manager = $$FunctionMembersTableTableManager(
      $_db,
      $_db.functionMembers,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_functionMemberIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MemberRolesTableFilterComposer
    extends Composer<_$AppDatabase, $MemberRolesTable> {
  $$MemberRolesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get clubId => $composableBuilder(
    column: $table.clubId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get districtId => $composableBuilder(
    column: $table.districtId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get regionId => $composableBuilder(
    column: $table.regionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get associationId => $composableBuilder(
    column: $table.associationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get unionId => $composableBuilder(
    column: $table.unionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get divisionId => $composableBuilder(
    column: $table.divisionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnFilters(column),
  );

  $$MembersTableFilterComposer get memberId {
    final $$MembersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.memberId,
      referencedTable: $db.members,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MembersTableFilterComposer(
            $db: $db,
            $table: $db.members,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$FunctionMembersTableFilterComposer get functionMemberId {
    final $$FunctionMembersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.functionMemberId,
      referencedTable: $db.functionMembers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FunctionMembersTableFilterComposer(
            $db: $db,
            $table: $db.functionMembers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MemberRolesTableOrderingComposer
    extends Composer<_$AppDatabase, $MemberRolesTable> {
  $$MemberRolesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get clubId => $composableBuilder(
    column: $table.clubId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get districtId => $composableBuilder(
    column: $table.districtId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get regionId => $composableBuilder(
    column: $table.regionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get associationId => $composableBuilder(
    column: $table.associationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get unionId => $composableBuilder(
    column: $table.unionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get divisionId => $composableBuilder(
    column: $table.divisionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnOrderings(column),
  );

  $$MembersTableOrderingComposer get memberId {
    final $$MembersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.memberId,
      referencedTable: $db.members,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MembersTableOrderingComposer(
            $db: $db,
            $table: $db.members,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$FunctionMembersTableOrderingComposer get functionMemberId {
    final $$FunctionMembersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.functionMemberId,
      referencedTable: $db.functionMembers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FunctionMembersTableOrderingComposer(
            $db: $db,
            $table: $db.functionMembers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MemberRolesTableAnnotationComposer
    extends Composer<_$AppDatabase, $MemberRolesTable> {
  $$MemberRolesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get clubId =>
      $composableBuilder(column: $table.clubId, builder: (column) => column);

  GeneratedColumn<int> get districtId => $composableBuilder(
    column: $table.districtId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get regionId =>
      $composableBuilder(column: $table.regionId, builder: (column) => column);

  GeneratedColumn<int> get associationId => $composableBuilder(
    column: $table.associationId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get unionId =>
      $composableBuilder(column: $table.unionId, builder: (column) => column);

  GeneratedColumn<int> get divisionId => $composableBuilder(
    column: $table.divisionId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  $$MembersTableAnnotationComposer get memberId {
    final $$MembersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.memberId,
      referencedTable: $db.members,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MembersTableAnnotationComposer(
            $db: $db,
            $table: $db.members,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$FunctionMembersTableAnnotationComposer get functionMemberId {
    final $$FunctionMembersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.functionMemberId,
      referencedTable: $db.functionMembers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FunctionMembersTableAnnotationComposer(
            $db: $db,
            $table: $db.functionMembers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MemberRolesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MemberRolesTable,
          MemberRole,
          $$MemberRolesTableFilterComposer,
          $$MemberRolesTableOrderingComposer,
          $$MemberRolesTableAnnotationComposer,
          $$MemberRolesTableCreateCompanionBuilder,
          $$MemberRolesTableUpdateCompanionBuilder,
          (MemberRole, $$MemberRolesTableReferences),
          MemberRole,
          PrefetchHooks Function({bool memberId, bool functionMemberId})
        > {
  $$MemberRolesTableTableManager(_$AppDatabase db, $MemberRolesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MemberRolesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MemberRolesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MemberRolesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> memberId = const Value.absent(),
                Value<int> functionMemberId = const Value.absent(),
                Value<int?> clubId = const Value.absent(),
                Value<int?> districtId = const Value.absent(),
                Value<int?> regionId = const Value.absent(),
                Value<int?> associationId = const Value.absent(),
                Value<int?> unionId = const Value.absent(),
                Value<int?> divisionId = const Value.absent(),
                Value<DateTime?> startDate = const Value.absent(),
                Value<DateTime?> endDate = const Value.absent(),
              }) => MemberRolesCompanion(
                id: id,
                memberId: memberId,
                functionMemberId: functionMemberId,
                clubId: clubId,
                districtId: districtId,
                regionId: regionId,
                associationId: associationId,
                unionId: unionId,
                divisionId: divisionId,
                startDate: startDate,
                endDate: endDate,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int memberId,
                required int functionMemberId,
                Value<int?> clubId = const Value.absent(),
                Value<int?> districtId = const Value.absent(),
                Value<int?> regionId = const Value.absent(),
                Value<int?> associationId = const Value.absent(),
                Value<int?> unionId = const Value.absent(),
                Value<int?> divisionId = const Value.absent(),
                Value<DateTime?> startDate = const Value.absent(),
                Value<DateTime?> endDate = const Value.absent(),
              }) => MemberRolesCompanion.insert(
                id: id,
                memberId: memberId,
                functionMemberId: functionMemberId,
                clubId: clubId,
                districtId: districtId,
                regionId: regionId,
                associationId: associationId,
                unionId: unionId,
                divisionId: divisionId,
                startDate: startDate,
                endDate: endDate,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MemberRolesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({memberId = false, functionMemberId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (memberId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.memberId,
                                    referencedTable:
                                        $$MemberRolesTableReferences
                                            ._memberIdTable(db),
                                    referencedColumn:
                                        $$MemberRolesTableReferences
                                            ._memberIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (functionMemberId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.functionMemberId,
                                    referencedTable:
                                        $$MemberRolesTableReferences
                                            ._functionMemberIdTable(db),
                                    referencedColumn:
                                        $$MemberRolesTableReferences
                                            ._functionMemberIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$MemberRolesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MemberRolesTable,
      MemberRole,
      $$MemberRolesTableFilterComposer,
      $$MemberRolesTableOrderingComposer,
      $$MemberRolesTableAnnotationComposer,
      $$MemberRolesTableCreateCompanionBuilder,
      $$MemberRolesTableUpdateCompanionBuilder,
      (MemberRole, $$MemberRolesTableReferences),
      MemberRole,
      PrefetchHooks Function({bool memberId, bool functionMemberId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$FunctionMembersTableTableManager get functionMembers =>
      $$FunctionMembersTableTableManager(_db, _db.functionMembers);
  $$MembersTableTableManager get members =>
      $$MembersTableTableManager(_db, _db.members);
  $$HealthFormsTableTableManager get healthForms =>
      $$HealthFormsTableTableManager(_db, _db.healthForms);
  $$DivisionsTableTableManager get divisions =>
      $$DivisionsTableTableManager(_db, _db.divisions);
  $$CountryDivisionsTableTableManager get countryDivisions =>
      $$CountryDivisionsTableTableManager(_db, _db.countryDivisions);
  $$UnionsTableTableManager get unions =>
      $$UnionsTableTableManager(_db, _db.unions);
  $$StateUnionsTableTableManager get stateUnions =>
      $$StateUnionsTableTableManager(_db, _db.stateUnions);
  $$AssociationsTableTableManager get associations =>
      $$AssociationsTableTableManager(_db, _db.associations);
  $$RegionsTableTableManager get regions =>
      $$RegionsTableTableManager(_db, _db.regions);
  $$DistrictsTableTableManager get districts =>
      $$DistrictsTableTableManager(_db, _db.districts);
  $$ChurchesTableTableManager get churches =>
      $$ChurchesTableTableManager(_db, _db.churches);
  $$ClubsTableTableManager get clubs =>
      $$ClubsTableTableManager(_db, _db.clubs);
  $$MemberRolesTableTableManager get memberRoles =>
      $$MemberRolesTableTableManager(_db, _db.memberRoles);
}
