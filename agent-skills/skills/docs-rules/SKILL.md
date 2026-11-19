---
name: docs-rules
description: Apply when deciding whether to add, change, remove or review repository documentation, including README files and agent instructions. Code-comment guidance is separate.
---

# Docs rules

The repository must stand on its own. Document what a reader needs that the code and its conventions do not already tell them. Every addition creates something to read and maintain; accuracy alone does not earn it a place.

## Keep personal context out of the repository

- Instructions about how the agent should work on someone's machine are not project requirements. Follow them during execution without copying them into code, scripts, configuration, examples or documentation, including repository agent instructions.
- Do not carry personal paths, machine names, wrappers, preferences, policies or conversation history into project artifacts unless the user explicitly makes them part of the project.
- Saying "on the author's machine" or putting the detail in an optional note does not make it belong. Removing a name while retaining the personal assumption is still a leak.
- Write for someone with the repository and its declared prerequisites, with no access to the user or this conversation.

## Treat convention as documentation

- Do not document facts a reader can find where that kind of fact normally lives: versions and settings in tool configuration, scripts in the package manifest, an entrypoint in the conventional entrypoint file. Do not turn those sources into prose inventories.
- A standard setting in its standard file needs neither an explanation of its value nor a pointer telling readers where to find it. For example, a package manager's release-age setting does not need repeating in the README.
- Links and file pointers must resolve a real discovery problem. "The entrypoint is in main.c" adds nothing when that follows convention.
- Document consequential departures from convention, non-obvious prerequisites, contracts and decisions that readers cannot reasonably recover from the usual sources. Keep essential setup or usage instructions focused on completing the task; do not expand them into a tour of the configuration.

## Make the smallest necessary change

- Correct guidance affected by the change. "Update the docs" does not call for a new maintenance guide, generic tool tutorial or record of the investigation.
- Before adding a passage, identify its reader, the task or decision it helps with, and what would be missing without it. If convention, existing guidance or the authoritative source already supplies the answer, omit it.
- "It is accurate", "for completeness", "to make it explicit" and "future maintainers might find it useful" do not justify redundant documentation. When in doubt, leave it out.
