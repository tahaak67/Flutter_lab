/// id : "1"
/// title : "Let me explain"
/// content : "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects,"
/// slug : "let-me-explain"
/// picture : "https://fakeimg.pl/350x200/?text=FreeFakeAPI"
/// user : "/api/users/1"
/// _links : {"self":{"href":"/api/posts/1"},"modify":{"href":"/api/posts/1"},"delete":{"href":"/api/posts/1"}}

class PostResponse {
  PostResponse({
      this.id, 
      this.title, 
      this.content, 
      this.slug, 
      this.picture, 
      this.user, 
      this.links,});

  PostResponse.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    slug = json['slug'];
    picture = json['picture'];
    user = json['user'];
    links = json['_links'] != null ? Links.fromJson(json['_links']) : null;
  }
  String? id;
  String? title;
  String? content;
  String? slug;
  String? picture;
  String? user;
  Links? links;
PostResponse copyWith({  String? id,
  String? title,
  String? content,
  String? slug,
  String? picture,
  String? user,
  Links? links,
}) => PostResponse(  id: id ?? this.id,
  title: title ?? this.title,
  content: content ?? this.content,
  slug: slug ?? this.slug,
  picture: picture ?? this.picture,
  user: user ?? this.user,
  links: links ?? this.links,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['content'] = content;
    map['slug'] = slug;
    map['picture'] = picture;
    map['user'] = user;
    if (links != null) {
      map['_links'] = links?.toJson();
    }
    return map;
  }

}

/// self : {"href":"/api/posts/1"}
/// modify : {"href":"/api/posts/1"}
/// delete : {"href":"/api/posts/1"}

class Links {
  Links({
      this.self, 
      this.modify, 
      this.delete,});

  Links.fromJson(dynamic json) {
    self = json['self'] != null ? Self.fromJson(json['self']) : null;
    modify = json['modify'] != null ? Modify.fromJson(json['modify']) : null;
    delete = json['delete'] != null ? Delete.fromJson(json['delete']) : null;
  }
  Self? self;
  Modify? modify;
  Delete? delete;
Links copyWith({  Self? self,
  Modify? modify,
  Delete? delete,
}) => Links(  self: self ?? this.self,
  modify: modify ?? this.modify,
  delete: delete ?? this.delete,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (self != null) {
      map['self'] = self?.toJson();
    }
    if (modify != null) {
      map['modify'] = modify?.toJson();
    }
    if (delete != null) {
      map['delete'] = delete?.toJson();
    }
    return map;
  }

}

/// href : "/api/posts/1"

class Delete {
  Delete({
      this.href,});

  Delete.fromJson(dynamic json) {
    href = json['href'];
  }
  String? href;
Delete copyWith({  String? href,
}) => Delete(  href: href ?? this.href,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['href'] = href;
    return map;
  }

}

/// href : "/api/posts/1"

class Modify {
  Modify({
      this.href,});

  Modify.fromJson(dynamic json) {
    href = json['href'];
  }
  String? href;
Modify copyWith({  String? href,
}) => Modify(  href: href ?? this.href,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['href'] = href;
    return map;
  }

}

/// href : "/api/posts/1"

class Self {
  Self({
      this.href,});

  Self.fromJson(dynamic json) {
    href = json['href'];
  }
  String? href;
Self copyWith({  String? href,
}) => Self(  href: href ?? this.href,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['href'] = href;
    return map;
  }

}