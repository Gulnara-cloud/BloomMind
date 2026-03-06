package com.gulnara.internship.model;

import jakarta.persistence.*;
import lombok.*;

import java.util.UUID;

@Entity
@Table(name = "lecture_content")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class LectureContent {

    @Id
    private UUID id;

    @OneToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "section_id", nullable = false, unique = true)
    private Section section;

    @Column(nullable = false)
    private String title;

    @Column(columnDefinition = "TEXT", nullable = false)
    private String content;
}