package com.gulnara.internship.repository;

import com.gulnara.internship.model.LectureContent;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;
import java.util.UUID;

public interface LectureContentRepository extends JpaRepository<LectureContent, UUID> {

    Optional<LectureContent> findBySectionId(UUID sectionId);
}
