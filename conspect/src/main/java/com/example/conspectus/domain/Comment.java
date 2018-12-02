package com.example.conspectus.domain;

import javax.persistence.*;

@Entity
@Table(name = "conmments")
public class Comment {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
    private String text;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User person;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "message_id")
    private Message conspect;

    public Comment() {
    }

    public Comment(Long id, Message message, User user, String text) {
        this.id = id;
        this.person = user;
        this.conspect = message;
        this.text = text;
    }

    public String getPersonName() {
        return person != null ? person.getUsername() : "<none>";
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public User getPerson() {
        return person;
    }

    public void setPerson(User person) {
        this.person = person;
    }

    public Message getConspect() {
        return conspect;
    }

    public void setConspect(Message conspect) {
        this.conspect = conspect;
    }
}
