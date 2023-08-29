
## Quick Obligations

| Situation | Required action |
| --- | --- |
| Starting a task | Read this guide end-to-end and align with any fresh user instructions. |
| Tool or command hangs | If a command runs longer than 5 minutes, stop it, capture logs, and check with the user. |
| Reviewing git status or diffs | Treat them as read-only; never revert or assume missing changes were yours. |
| Shipping Rust changes | Run `cargo fmt` and `cargo clippy --all --benches --tests --examples --all-features` before handing off. |
| Adding a dependency | Research well-maintained options and confirm fit with the user before adding. |

## Mindset & Process

- THINK A LOT PLEASE.
- **No breadcrumbs**. If you delete or move code, do not leave a comment in the old place. No "// moved to X", no "relocated". Just remove it.
- **Think hard, do not lose the plot**.
- Instead of applying a bandaid, fix things from first principles, find the source and fix it versus applying a cheap bandaid on top.
- When taking on new work, follow this order:
  1. Think about the architecture.
  1. Research official docs, blogs, or papers on the best architecture.
  1. Review the existing codebase.
  1. Compare the research with the codebase to choose the best fit.
  1. Implement the fix or ask about the tradeoffs the user is willing to make.
- Write idiomatic, simple, maintainable code. Always ask yourself if this is the most simple intuitive solution to the problem.
- Leave each repo better than how you found it. If something is giving a code smell, fix it for the next person.
- Clean up unused code ruthlessly. If a function no longer needs a parameter or a helper is dead, delete it and update the callers instead of letting the junk linger.
- **Search before pivoting**. If you are stuck or uncertain, do a quick web search for official docs or specs, then continue with the current approach. Do not change direction unless asked.
- If code is very confusing or hard to understand:
  1. Try to simplify it.
  1. Add an ASCII art diagram in a code comment if it would help.



## Testing Philosophy

- I HATE MOCK tests, either do unit or e2e, nothing inbetween. Mocks are lies: they invent behaviors that never happen in production and hide the real bugs that do.
- Test `EVERYTHING`. Tests must be rigorous. Our intent is ensuring a new person contributing to the same code base cannot break our stuff and that nothing slips by. We love rigour.
- Unless the user asks otherwise, run only the tests you added or modified instead of the entire suite to avoid wasting time.

## Language Guidance

### TypeScript
- NEVER, EVER use `any` we are better than that.
- Using `as` is bad, use the types given everywhere and model the real shapes.
- If the app is for a browser, assume we use all modern browsers unless otherwise specified, we don't need most polyfills.

### Python

- **Python repos standard**. We use `uv` and `pyproject.toml` in all Python repos. Prefer `uv sync` for env and dependency resolution. Do not introduce `pip` venvs, Poetry, or `requirements.txt` unless asked. If you add a Nix shell, include `uv`.
- Use strong types, prefer type hints everywhere, keep models explicit instead of loose dicts or strings.

## Final Handoff

Before finishing a task:

1. Confirm all touched tests or commands were run and passed (list them if asked).
1. Summarize changes with file and line references.
1. Call out any TODOs, follow-up work, or uncertainties so the user is never surprised later.
