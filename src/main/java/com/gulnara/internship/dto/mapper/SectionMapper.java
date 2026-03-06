package com.gulnara.internship.dto.mapper;

import com.gulnara.internship.dto.SectionDto;
import com.gulnara.internship.model.Section;

import java.util.List;

/**
 * Mapper for converting Section entities to SectionDto.
 */
public final class SectionMapper {

    private SectionMapper() {
        // Utility class, no instances allowed
    }
    public static SectionDto toDto(Section section) {
        if (section == null) return null;

        String lectureTitle = null;
        String lectureContent = null;

        if (section.getLectureContent() != null) {
            lectureTitle = section.getLectureContent().getTitle();
            lectureContent = section.getLectureContent().getContent();
        }

        return new SectionDto(
                section.getId(),
                section.getTitle(),
                lectureTitle,
                lectureContent
        );
    }
    public static List<SectionDto> toDtoList(List<Section> sections) {
        return sections.stream()
                .map(SectionMapper::toDto)
                .toList();
    }
}
