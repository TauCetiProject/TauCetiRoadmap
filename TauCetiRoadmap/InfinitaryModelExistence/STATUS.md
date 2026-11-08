<!--tauceti-status:v1 {"roadmap":"InfinitaryModelExistence","to_sha":"938acbb89c936ff7608191ef06108b13b32693b3","ts":"2026-10-26T19:49:38Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"language maps, occurrence sets and symbol locality, sublanguages and the small presentation, substitution for bound positions","state":"untouched"},{"id":"Layer 1","remaining":"satisfiability, entailment, OmitsType, transfer along expansions, the non-compactness example, and all of fragments","state":"partial"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"}],"readme_sha":"c8f46074c727640d1bc63e6aebd3b7a4a120920052eaa105b54011e03f2839b7","roadmap":"InfinitaryModelExistence","to_sha":"938acbb89c936ff7608191ef06108b13b32693b3"}-->
# Status: InfinitaryModelExistence

This file documents the status of the InfinitaryModelExistence roadmap up until `938acbb` (2026-10-26T19:49:38Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The roadmap has just begun. Lω₁ω theories, their models and the conjunction of a countable theory exist, the start of Layer 1. The signature calculus of Layer 0, the rest of Layer 1, and every layer from fragment elementarity through the well-ordering theorems have not been started.

### Notable definitions and infrastructure

- **Theories and models** — [`Theoryω`](https://taucetiproject.org/docs/TauCeti/ModelTheory/Infinitary/Theory.html#FirstOrder.Language.Theoryω) is a set of Lω₁ω sentences, and [`Theoryω.Model`](https://taucetiproject.org/docs/TauCeti/ModelTheory/Infinitary/Theory.html#FirstOrder.Language.Theoryω.Model) says that a structure satisfies all of them. They come with lemmas for subtheories, unions and insertion, and [isomorphic structures model the same theories](https://taucetiproject.org/docs/TauCeti/ModelTheory/Infinitary/Theory.html#FirstOrder.Language.StrongHomClass.theoryω_model_iff). These are the objects that satisfiability, entailment and every model-producing theorem below will be stated in terms of.
- **A countable theory is one sentence** — the [conjunction of a countable theory](https://taucetiproject.org/docs/TauCeti/ModelTheory/Infinitary/Theory.html#FirstOrder.Language.Theoryω.conjunction), coded into the carrier `ℕ`, [holds exactly in the models of the theory](https://taucetiproject.org/docs/TauCeti/ModelTheory/Infinitary/Theory.html#FirstOrder.Language.Theoryω.realize_conjunction_iff). The interpolation and separation theorems of Layer 7 are sentence-level, and this is how they will reach countable theories. The sibling roadmaps HanfNumbers and CountableModelCounting also consume it.

### Roadmap coverage

Layer 1 is partial. Of 1.1, theories, models, isomorphism invariance and the countable conjunction are done. Still missing from 1.1 are transfer along expansions, `Theoryω.IsSatisfiable`, `Theoryω.Entails` with its API, the comparison with first-order entailment, `OmitsType`, and the required non-compactness example. Fragments (1.2) have not been started. Layer 0 (language maps, occurrence sets, symbol sublanguages, the small presentation, bound substitution) is untouched. So are Layers 2 to 8: fragment elementarity and Löwenheim–Skolem, consistency properties and model existence, types and omitting types, Morleyization, the graph translation, interpolation, and well-ordering.

## The frontier

- **Satisfiability and entailment** — `Theoryω.IsSatisfiable`, `Theoryω.Entails` with reflexivity, transitivity, cut and `entails_iff_not_isSatisfiable`, and agreement with Mathlib's first-order entailment. All of it builds directly on the existing `Theoryω.Model`.
- **Language maps on infinitary formulas** — `onBoundedFormulaInf` and `realize_onBoundedFormulaInf` (0.1). Every later layer moves sentences between languages, and the transfer of models along expansions in 1.1 waits on this.
- **Fragments and their countability** — `Fragment`, `Fragment.generated` and `Fragment.generated_countable` (1.2), with the acceptance example: one sentence generates a countable fragment, even over a language with uncountably many relation symbols. This needs nothing beyond the parent roadmap's syntax.
- **Occurrences and symbol locality** — `functionsIn`, `relationsIn` and `realize_congr_of_agreeOn` (0.2). These come before the symbol sublanguages that let interpolation and well-ordering run over languages of any cardinality.
- **Omitted types and non-compactness** — `OmitsType`, and the example of an unsatisfiable Lω₁ω theory whose finite subsets all have models. This is what makes Layer 3 a countable enumeration rather than a Zorn argument.
