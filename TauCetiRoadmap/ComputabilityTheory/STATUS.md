<!--tauceti-status:v1 {"roadmap":"ComputabilityTheory","to_sha":"d2083f0f1dd2136d02467ba36efbbe1af612e89c","ts":"2026-11-08T09:37:56Z"}-->
# Status: ComputabilityTheory

This file documents the status of the ComputabilityTheory roadmap up until `d2083f0` (2026-11-08T09:37:56Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The low simple set (L7) and the original Friedberg–Muchnik construction (L8) are proved, on top of a largely complete oracle, enumeration, jump, approximation and injury foundation (L0–L2, L3.1, L4, L6). The arithmetical hierarchy beyond level one, the Kleene–Post construction, and Sacks's cone-avoidance and low-splitting constructions (L9.2–L9.4) have not yet been built.

### Named results

- **Soare's low simple set** — a c.e. set built by finite injury that is [simple](https://taucetiproject.org/docs/TauCeti/Computability/Simple/Low.html#TauCeti.simple_lowSimpleSet) and [low](https://taucetiproject.org/docs/TauCeti/Computability/Simple/Lowness.html#TauCeti.low_lowSimpleSet), exported with an [ordinary program index](https://taucetiproject.org/docs/TauCeti/Computability/Simple/Lowness.html#TauCeti.exists_simple_low_code) and the corollary that its degree lies [strictly between 0 and 0′](https://taucetiproject.org/docs/TauCeti/Computability/Simple/Lowness.html#TauCeti.degree_lowSimpleSet_mem_Ioo).
- **The Friedberg–Muchnik theorem** — two c.e. sets, neither Turing reducible to the other, from the [original witness-and-restraint construction](https://taucetiproject.org/docs/TauCeti/Computability/FriedbergMuchnik/Basic.html#TauCeti.friedberg_muchnik), together with the [degree form](https://taucetiproject.org/docs/TauCeti/Computability/FriedbergMuchnik/Basic.html#TauCeti.exists_incomparable_ce_turingDegrees_mem_Ioo) placing both degrees strictly between 0 and 0′.
- **The Modulus Lemma** — for a c.e. oracle Z, a total function is computable in Z exactly when it has a computable approximation with a [Z-computable modulus](https://taucetiproject.org/docs/TauCeti/Computability/Approximation/CEOracle.html#TauCeti.Approximation.computableIn_iff_exists_isModulus_of_rePred).
- **The relativized Limit Lemma** — a limit of uniformly Z-computable functions is [computable in Z′](https://taucetiproject.org/docs/TauCeti/Computability/Approximation/Limit.html#TauCeti.Approximation.Converges.computableIn_jump); the source also contains the converse, so both directions hold for total functions and for sets.
- **Post's simple set** — Post's construction with the witness bound x > 2e is [simple](https://taucetiproject.org/docs/TauCeti/Computability/Simple/Post.html#TauCeti.simple_postSimpleSet), alongside a [computably inseparable pair](https://taucetiproject.org/docs/TauCeti/Computability/Inseparable.html#TauCeti.exists_computablyInseparable_rePred) of c.e. sets built from the diagonal fibres.

### Notable definitions and infrastructure

- **Single-oracle programs** — a numbered [oracle-program type](https://taucetiproject.org/docs/TauCeti/Computability/SingleOracle/Code.html#TauCeti.Oracle.Single.Code). Its bounded runs record output and use and satisfy the [use principle](https://taucetiproject.org/docs/TauCeti/Computability/SingleOracle/Evaln.html#TauCeti.Oracle.Single.Code.evaln_eq_some_of_eqOn), and these programs compute exactly the functions [recursive in the oracle](https://taucetiproject.org/docs/TauCeti/Computability/SingleOracle/Code.html#TauCeti.Oracle.Single.Code.exists_code). This lets negative reducibility results quantify over all of Mathlib's oracle reductions.
- **The concrete jump** — [Z′](https://taucetiproject.org/docs/TauCeti/Computability/Jump/Basic.html#Set.jump) is defined by diagonal halting of these programs, with strictness, monotonicity, completeness for Z-c.e. sets, strictly increasing iterates, and [low sets](https://taucetiproject.org/docs/TauCeti/Computability/Jump/Low.html#Set.Low).
- **Injury calculus** — public [injury sets](https://taucetiproject.org/docs/TauCeti/Computability/Priority/Injury/Basic.html#TauCeti.Priority.injurySet), injury stages and events, split into use-prefix breaches and boundary injuries, with label-carrying events for several oracles, priority records with reset and locality, and preservation theorems. Both constructions are clients of it.

### Roadmap coverage

L0 (oracle codes, use, adequacy, racing, padding and recursion), L1 (stages, entry stages, serialization) and L6 (injury sets, causes, initialization, preservation) appear essentially complete. Whether every uniformity and boundary example the README demands is present has not been checked item by item. L2 has the parity join as least upper bound, a `SemilatticeSup` on degrees, and the split reductions [S, VII.3.3] with a uniform program. L3.1 is done. L3.2 is partial: the pointclasses, their closure and contraction lemmas, and the Σ⁰₁ case of Post's theorem are proved, but the general Post equivalences and the classifications of `TOT`, `FIN` and `INF` are absent. L4 is done except the Δ⁰₂ form, which waits on L3.2. Only one direction of [S, III.3.4] is visible, via the [instability set](https://taucetiproject.org/docs/TauCeti/Computability/Approximation/CEDegree.html#TauCeti.Approximation.IsModulus.exists_rePred_turingEquivalent). L5 has the inseparable pair and simple sets but not Kleene–Post. L7 and L8 are done. In L9, only the L9.1 agreement-length machinery is present: the restraint, preservation, stabilization under a limiting disagreement, and the diagonal probe compiler. L9.2–L9.4 are untouched.

## The frontier

- **Sacks cone avoidance (L9.2)** — the simple set avoiding a given noncomputable c.e. cone. It is the shortest client of the L9.1 agreement machinery and the Post-style witness bounds, both of which exist.
- **Sacks splitting with low halves (L9.3)** — the routing stage machine, priority induction for finite injury and nonreduction, lowness via the probe compiler and the Limit Lemma, and the uniform output indices. All of these are still to be built.
- **Connective corollaries (L9.4)** — the low-join decomposition, the absence of minimal c.e. degrees, incomparable c.e. degrees, and the `K` example showing that the jump does not preserve joins. These follow from L9.3 and the existing split reductions.
- **Relativized Post's theorem (L3.2)** — the equivalences at every level n, which need iterated-jump normal forms. The index-set classifications of `TOT`, `FIN` and `INF` and the Δ⁰₂ form of the Limit Lemma depend on them.
- **Kleene–Post (L5)** — incomparable sets below ∅′ by a ∅′-computable finite-extension procedure. It is independent of the priority constructions.
