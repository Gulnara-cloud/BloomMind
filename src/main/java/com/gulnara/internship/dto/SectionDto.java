package com.gulnara.internship.dto;

import java.util.UUID;

/**
 * DTO representing a course section with lecture content.
 */

public record SectionDto(
        UUID id,
        String title,
        String lectureTitle,
        String lectureContent
) {}