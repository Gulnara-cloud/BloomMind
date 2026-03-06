package com.gulnara.internship.repository;

import com.gulnara.internship.model.Section;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface SectionRepository extends JpaRepository<Section, UUID> {
    // Returns all sections ordered by id for a specific course
    List<Section> findByCourseIdOrderByIdAsc(UUID courseId);

    @Query("""
    SELECT s
    FROM Section s
    LEFT JOIN FETCH s.lectureContent
    WHERE s.id = :sectionId AND s.course.id = :courseId
""")
    Optional<Section> findByIdForCourseWithLecture(UUID courseId, UUID sectionId);
}
