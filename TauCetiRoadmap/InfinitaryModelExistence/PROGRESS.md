# Progress log: InfinitaryModelExistence

An append-only record of what landed on the InfinitaryModelExistence roadmap, one section per window of
merged pull requests, oldest first. Generated; the prose is not security-validated.
For a current snapshot instead, read `STATUS.md` beside this file.

<!--tauceti-progress:v1 {"from_sha":"df756f64cabfaf8974fbae5c2c2a5138d23faac5","prs":[21392],"roadmap":"InfinitaryModelExistence","to_sha":"938acbb89c936ff7608191ef06108b13b32693b3"}-->
## InfinitaryModelExistence: 2026-10-26 to 2026-10-26 (`df756f6` to `938acbb`)

The roadmap's first code is the vocabulary of Lω₁ω theories: a [theory](https://taucetiproject.org/docs/TauCeti/ModelTheory/Infinitary/Theory.html#FirstOrder.Language.Theoryω) is a set of Lω₁ω sentences, a [model](https://taucetiproject.org/docs/TauCeti/ModelTheory/Infinitary/Theory.html#FirstOrder.Language.Theoryω.Model) satisfies all of them, and the expected bookkeeping is there: monotonicity, empty, singleton, insert and union theories, and [invariance under isomorphism](https://taucetiproject.org/docs/TauCeti/ModelTheory/Infinitary/Theory.html#FirstOrder.Language.StrongHomClass.theoryω_model_iff) (TauCeti#21392). The one substantive piece is the reduction of a countable theory to a single sentence: its [conjunction](https://taucetiproject.org/docs/TauCeti/ModelTheory/Infinitary/Theory.html#FirstOrder.Language.Theoryω.conjunction), coded along the parent roadmap's index coding, [holds in a structure exactly when the structure models the theory](https://taucetiproject.org/docs/TauCeti/ModelTheory/Infinitary/Theory.html#FirstOrder.Language.Theoryω.realize_conjunction_iff). That is how the later sentence-level theorems will apply to countable theories.

What's missing is the rest of Layer 1: satisfiability, entailment, omitted types, transfer along expansions, and all of fragments. Transfer along expansions needs the language maps of Layer 0, which has not started.
