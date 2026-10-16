# JimSkills

A curated, **Claude Code-compatible** set of Agent Skills, ready to drop into any project.

These skills were gathered from two upstream collections and pruned to the set that
actually works in Claude Code:

- [mattpocock/skills](https://github.com/mattpocock/skills) - engineering + productivity buckets
- [cursor/plugins](https://github.com/cursor/plugins/tree/main/pstack/skills) - pstack set (Cursor-only skills removed)

Cursor-specific skills that depend on Cursor's transcript store, model-rules file,
built-in `create-skill`, or Automations were removed. A handful of model-orchestration
skills were kept; they fall back to Claude defaults and use subagents.

## Install into a project

From the root of the project you want the skills in:

### macOS / Linux / Git Bash
```bash
curl -fsSL https://raw.githubusercontent.com/jhackney24/JimSkills/main/install.sh | bash
```

Or clone and copy manually:
```bash
git clone https://github.com/jhackney24/JimSkills.git /tmp/jimskills
mkdir -p .claude/skills
cp -r /tmp/jimskills/skills/. .claude/skills/
```

### Windows PowerShell
```powershell
git clone https://github.com/jhackney24/JimSkills.git $env:TEMP\jimskills
New-Item -ItemType Directory -Force .claude\skills | Out-Null
Copy-Item -Recurse -Force "$env:TEMP\jimskills\skills\*" .claude\skills```

Skills become available in a **new** Claude Code session (the skill list is loaded at session start).

## What's included (71 skills)

| Skill | Description |
|-------|-------------|
| `architect` | Sketch types, signatures, and module structure before code, then stay in the loop while implementation fills in. Use for |
| `arena` | Spawn N parallel candidates at the same task, pick a base, graft the strongest parts of the losers into it. Use for /are |
| `ask-matt` | Ask which skill or flow fits your situation. A router over the skills in this repo. |
| `benchmark-checklist` | Vet a perf measurement (limiter, tuning, limits, errors, repeatability, relevance, and whether the work happened) before |
| `blast-radius` | Find what a change could break somewhere else before it ships, beyond the diff, and prove the one fact it's safe because |
| `bro` | Restate the last message in plain human language, with no jargon. |
| `codebase-design` | Shared vocabulary for designing deep modules. Use when the user wants to design or improve a module's interface, find de |
| `code-review` | Review the changes since a fixed point (commit, branch, tag, or merge-base) along two axes: Standards (does the code fol |
| `correct` | Find the mistakes agents keep repeating in this repo and make each one impossible. Try architecture first, then types, t |
| `diagnosing-bugs` | Diagnosis loop for hard bugs and performance regressions. Use when the user says "diagnose"/"debug this", or reports som |
| `domain-modeling` | Build and sharpen a project's domain model. Use when discussing codebase terminology, writing or editing a GLOSSARY.md,  |
| `figure-it-out` | Design an auditable playbook when no narrower one fits: a large migration, an ambitious multi-part change, or work a hum |
| `grilling` | Grill the user relentlessly about a plan, decision, or idea. Use when the user wants to stress-test their thinking, or u |
| `grill-me` | A relentless interview to sharpen a plan or design. |
| `grill-with-docs` | A relentless interview to sharpen a plan or design, which also creates docs (ADR's and glossary) as we go. |
| `handoff` | Compact the current conversation into a handoff document for another agent to pick up. |
| `how` | Use for \"how does X work\", code walkthroughs before changing something, and placement / ownership / layering questions |
| `implement` | Implement a piece of work based on a spec or set of tickets. |
| `implement-spec` | Implement the result of /to-spec and /to-tickets in code. |
| `improve-codebase-architecture` | Scan a codebase for deepening opportunities, present them as a visual HTML report, then grill through whichever one you  |
| `interrogate` | Use for \"interrogate\", \"adversarial review\", \"multi-model review\", \"challenge this\", \"stress test this code\",  |
| `in-your-own-words` | Restate in your own words what you think the user's goals are and what problem they're trying to solve. Use for /in-your |
| `ketchup` | Catch the user up on what changed in this chat since their last message, in a few plain sentences and small visuals. Giv |
| `no-comments` | Spawn Comment Sicko, fix accepted findings, and offer encodings for claimed constraints. |
| `pr` | Use when writing a PR body. |
| `principle-attack-the-premise` | Apply when two or more fixes that share one premise have failed the same gate. Write the premise down and test it direct |
| `principle-boundary-discipline` | Apply when wiring validation, error handling, or framework adapters. Concentrate guards at system boundaries (CLI, confi |
| `principle-build-the-lever` | Apply to any non-trivial work, not just bulk work: edits, migrations, analyses, checks. Build the tool that does it or p |
| `principle-encode-lessons-in-structure` | Apply when you catch yourself writing the same instruction a second time, or notice a recurring correction. Encode the r |
| `principle-exhaust-the-design-space` | Apply when facing a novel UI interaction or architectural decision with no precedent in the codebase. Build 2-3 competin |
| `principle-experience-first` | Apply when product, UX, or feature-scope tradeoffs come up. Choose user delight over implementation convenience; ship fe |
| `principle-explain-the-number` | Apply before you trust, report, or act on a number you measured: a speedup, a regression, a throughput, a latency, or an |
| `principle-fix-root-causes` | Apply when debugging. Trace each symptom back to the first place the system went wrong and fix it there. A guard is a fi |
| `principle-foundational-thinking` | Apply before writing logic: choosing core types and data structures, sequencing scaffold-vs-feature work, asking what co |
| `principle-guard-the-context-window` | Apply when context is filling up: large outputs, long files, repeated reads, fan-out planning. Route bulk to subagents;  |
| `principle-laziness-protocol` | Apply when refactoring, evaluating diff size, or tempted to add abstractions, layers, or signal threading. Bias toward d |
| `principle-make-operations-idempotent` | Apply when designing commands, lifecycle steps, or processing loops that run amid crashes, restarts, and retries. Conver |
| `principle-migrate-callers-then-delete-legacy-apis` | Apply when introducing a new internal API while old callers still exist. Migrate callers and delete the old API in the s |
| `principle-minimize-reader-load` | Apply when reviewing or shaping code that's hard to trace. Count layers between question and answer, and hidden state in |
| `principle-model-the-domain` | Apply when writing stateful logic, or when code branches a lot or repeats a shape assumption across files. |
| `principle-never-block-on-the-human` | Apply when tempted to ask 'should I do X?' on reversible work. |
| `principle-outcome-oriented-execution` | Apply during planned rewrites and migrations with explicit phase boundaries. Converge on the target architecture; don't  |
| `principle-prove-it-works` | Apply after completing a task, before declaring done. Verify against the real artifact (run the feature, read the actual |
| `principle-redesign-from-first-principles` | Apply when integrating a new requirement into an existing design. |
| `principle-separate-before-serializing-shared-state` | Apply when concurrent actors might write to the same file, branch, key, or state object. Eliminate the sharing first; se |
| `principle-sequence-verifiable-units` | Apply to multi-step work (sweeps, migrations, runs of similar edits) and to how you stack commits and PRs. Break work in |
| `principle-subtract-before-you-add` | Apply when sequencing an addition, refactor, or rewrite. Remove dead code, redundant validators, and stub references fir |
| `principle-test-behavior-not-implementation` | Apply when you write, change, or keep a test. Assert what the code's users can observe, so that the test fails when that |
| `principle-type-system-discipline` | Apply when designing types, reviewing a function signature, or writing code in any statically-typed language. Make illeg |
| `prototype` | Build a throwaway prototype to answer a design question. Use when the user wants to sanity-check whether a state model o |
| `pstack-tdd` | Use only when the user explicitly asks for TDD, a failing test, or a regression test, OR when the bug has an obvious che |
| `pstack-teach` | Explain a body of work plainly so a person actually understands it. Runs the `how` and `why` skills and weaves what they |
| `research` | Investigate a question against high-trust primary sources and capture the findings as a Markdown file in the repo. Use w |
| `retro` | Conduct a retrospective on a coding session. |
| `setup-matt-pocock-skills` | Configure this repo for the engineering skills: set up its issue tracker, triage label vocabulary, and domain doc layout |
| `sharpen` | Sharpen a task before starting: the expert approach, what the user is really after, and the right level of specification |
| `swarm` | Fan out N parallel workers, drain them, and return one report. Use for /swarm, 'swarm this', or parallel coverage, races |
| `tdd` | Test-driven development. Use when the user wants to build features or fix bugs test-first, mentions "red-green-refactor" |
| `teach` | Teach the user a new skill or concept, within this workspace. |
| `technical-writing` | Layered technical-writing standard: Diátaxis structure, Google developer style sentences, STE instruction rules, Global |
| `to-questionnaire` | Turn a decision you can't fully answer into a questionnaire for someone else to fill in. |
| `to-spec` | Turn the current conversation into a spec and publish it to the project issue tracker: no interview, just synthesis of w |
| `to-tickets` | Break a plan, spec, or the current conversation into a set of tracer-bullet tickets, each declaring its blocking edges,  |
| `triage` | Move issues and external PRs through a state machine of triage roles, categorise, verify, grill if needed, and write age |
| `typescript-best-practices` | TypeScript best practices. Use when reading or editing any .ts or .tsx file. |
| `unslop` | Cut AI tells from any writing. |
| `wait-what` | Stop. That last message did not land: re-pitch it. |
| `wayfinder` | Plan a huge chunk of work (more than one agent session can hold) as a shared map of decision tickets on your issue track |
| `why` | Use for 'why does X work this way', 'why we picked Y', design rationale, regressions, postmortems, or data-backed thresh |
| `wizard` | Generate an interactive bash wizard that walks a human through steps only they can perform. Use when provisioning infras |
| `writing-for-agents` | Writing documents for agents. Use when creating or editing skills, or modifying AGENTS.md or CLAUDE.md. |

## Updating

Re-run the install command (or re-clone and copy). Vendored copies do not auto-update.

## Licensing

Skills retain their upstream licenses (both sources are MIT). See the upstream repos for details.
