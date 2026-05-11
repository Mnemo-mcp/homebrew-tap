You have access to Mnemo - a persistent memory system for this project.
All project context, decisions, and chat history is below. Use it to answer questions without re-reading files.

AT THE START OF EVERY CHAT:
- Call `mnemo_recall` to get the latest context. The embedded context below may be stale.

ANSWERING QUESTIONS:
- If the recalled memory already contains the answer, USE IT DIRECTLY. Do not re-read files or re-run lookups for information already in memory.
- Only call `mnemo_lookup` or read files when memory does not have enough detail to answer.

SAVING MEMORY:
- Call `mnemo_remember` AFTER any of these happen in the conversation:
  - You made a code change that affects behavior (theme change, config change, new feature, refactor)
  - A bug was found and fixed
  - A design or architecture decision was made
  - The user stated a preference or convention
  - A TODO or follow-up was identified
  - You learned something non-obvious about the codebase
- Call `mnemo_remember` when the context window is getting long to summarize progress so far.
- Call `mnemo_remember` when the user explicitly asks to remember something.
- Do NOT save trivial things like "read a file" or "answered a question with no new insight".
- When in doubt, SAVE. It is better to remember too much than to forget something useful.
- RULE: If you called `mnemo_lookup`, `mnemo_similar`, or `mnemo_who_touched` AND produced a summary or analysis from the results, you MUST call `mnemo_remember` with a concise summary before ending your response.

AVAILABLE TOOLS:
- `mnemo_lookup` - get method-level details for a file or folder
- `mnemo_similar` - find similar implementations to follow as patterns
- `mnemo_intelligence` - architecture graph, patterns, dependencies
- `mnemo_discover_apis` - discover all API endpoints
- `mnemo_search_api` - search for a specific endpoint
- `mnemo_knowledge` - search team knowledge base
- `mnemo_decide` - record a decision
- `mnemo_context` - save project metadata
- `mnemo_map` - refresh code map after changes
- `mnemo_cross_search` - search across ALL linked repos (use when code might live in a sibling service)
- `mnemo_cross_impact` - cross-repo impact analysis (what breaks in other repos if you change something here)
- `mnemo_links` - show linked repos

CROSS-REPO AWARENESS:
- This repo has linked sibling repos. Use `mnemo_links` to see them.
- ALWAYS call `mnemo_cross_search` BEFORE using grep or reading files when:
  - The user asks about code that does not exist in this repo
  - The user mentions a service, project, or module name that is not a folder in this repo
  - `mnemo_lookup` or `mnemo_similar` returned no results
- If the user asks "what breaks if I change X", use `mnemo_cross_impact` for full cross-repo analysis.
- NEVER fall back to grep for code in other repos. Use `mnemo_cross_search` instead.

---

# Project Context
- **repo_root**: /Users/nikhil.tiwari/CodeRepo/homebrew-tap
- **initialized**: True

# Repo Map
(use mnemo_lookup for method-level details)

