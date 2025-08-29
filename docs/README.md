# USLM Documentation Directory

This directory contains an experimental effort to reorganize and enhance the existing USLM (United States Legislative Markup) documentation. The goal is to create a more structured and accessible documentation system by combining original user guides with review guides (changelogs) and generating new documentation from XSD schema files.

## Purpose

This is a **new, experimental effort** being shared for comment and in case it's helpful to anyone. The documentation is being reorganized to:

- Merge original User Guides with Review Guides (changelogs) for comprehensive version information
- Generate new documentation directly from XSD schema files
- Create a more navigable structure for different USLM versions
- Provide both human-readable and machine-generated documentation

## Directory Structure

### Version-Specific Documentation

#### `1_0/` - USLM Version 1.0
- **USLM-User-Guide.md** - Original user guide in Markdown format
- **USLM-User-Guide.pdf** - Original user guide in PDF format

#### `2_0_0-11/` - USLM Versions 2.0.0 through 2.0.11
- **bill-version-samples/** - Sample bill files for testing and examples
- **project-documents/** - Project planning and development documents
- **review-guide/** - Review guides and changelogs for these versions
- **sample-files/** - Additional sample files for reference

#### `2_0_12/` - USLM Version 2.0.12
- **USLM-2_0-Review-Guide-v2_0_12.md** - Review guide in Markdown format
- **USLM-2_0-Review-Guide-v2_0_12.pdf** - Review guide in PDF format
- **USLM-2_0-Review-Guide-v2_0_12-clean.docx** - Clean version of the review guide
- **USLM-2_0-Review-Guide-v2_0_12-changes.docx** - Version with tracked changes
- **images-for-review-guide/** - Supporting images for the review guide
- **generated-merged/** - **NEW**: Merged documentation combining User Guide with Review Guide

#### `2_0_17/` - USLM Version 2.0.17
- **USLM-2_0-Review-Guide-2_0_17.md** - Review guide in Markdown format
- **USLM-2_0-Review-Guide-2_0_17.pdf** - Review guide in PDF format

#### `2_1_0/` - USLM Version 2.1.0
- **USLM-2_1-ReviewGuide.md** - Review guide in Markdown format
- **USLM-2_1-ReviewGuide.pdf** - Review guide in PDF format
- **bill-version-samples-september-2024/** - Recent bill samples for this version
- **generated-from-xsd/** - **NEW**: Documentation generated from XSD schema files

## New Experimental Content

### Generated Documentation

The subdirectories with "generated" in their names contain new content created through two approaches:

1. **Generated from XSD** (`generated-from-xsd/`)
   - **uslm-v2_1-reference.md** - Reference documentation extracted from schema
   - **uslm-v2_1-guide-state-codes-a.md** - State code documentation (Part A)
   - **uslm-v2_1-guide-state-codes-b.md** - State code documentation (Part B)

2. **Generated Merged** (`generated-merged/`)
   - **USLM-User-Guide.md** - User guide merged with review guide content

## How to Use This Documentation

- **For specific version information**: Navigate to the appropriate version subdirectory
- **For comprehensive guides**: Check the `generated-merged/` directories for combined content
- **For schema-based reference**: Use the `generated-from-xsd/` directories
- **For original content**: Use the root-level files in each version directory

## Feedback and Comments

This is an experimental organization effort. Please share any feedback, suggestions, or comments about:
- The directory structure
- The generated documentation quality
- Additional documentation needs
- Ways to improve the organization

## Note

This documentation is being actively developed and may change as the experimental approach evolves. The goal is to create a more maintainable and user-friendly documentation system for the USLM project.
