package com.example.conspectus.domain.dto;

import com.example.conspectus.domain.Message;
import com.example.conspectus.domain.User;
import com.example.conspectus.domain.util.MessageHelper;

public class MessageDto {
    private Long id;
    private String title;
    private String text;
    private int num;
    private String tag;
    private User author;
    private String filename;
    private Long likes;
    private Boolean meLiked;

    public MessageDto(Message message, Long likes, Boolean meLiked) {
        this.id = message.getId();
        this.author = message.getAuthor();
        this.title = message.getTitle();
        this.text = message.getText();
        this.num = message.getNum();
        this.tag = message.getTag();
        this.filename = message.getFilename();
        this.likes = likes;
        this.meLiked = meLiked;
    }

    public String getAuthorName() {
        return MessageHelper.getAuthorName(author);
    }

    public Long getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getText() {
        return text;
    }

    public int getNum() {
        return num;
    }

    public String getTag() {
        return tag;
    }

    public User getAuthor() {
        return author;
    }

    public String getFilename() {
        return filename;
    }

    public Long getLikes() {
        return likes;
    }

    public Boolean getMeLiked() {
        return meLiked;
    }

    @Override
    public String toString() {
        return "MessageDto{" +
                "id=" + id +
                ", author=" + author +
                ", likes=" + likes +
                ", meLiked=" + meLiked  +
                '}';
    }
}
