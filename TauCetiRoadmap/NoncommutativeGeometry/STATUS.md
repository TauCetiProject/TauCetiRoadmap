<!--tauceti-status:v1 {"roadmap":"NoncommutativeGeometry","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284","ts":"2026-11-09T03:33:42Z"}-->
# Status: NoncommutativeGeometry

This file documents the status of the NoncommutativeGeometry roadmap up until `7ca783d` (2026-11-09T03:33:42Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The algebraic cyclic theory of N1 is largely done, and N2's pairings now descend to algebraic K₀ and K₁. N4's Dixmier traces are in place apart from the Tauberian bridge. N3, N5 and N6 have begun with foundations only, and N7 has not begun.

### Named results

- **The SBI exact sequence** — for a unital algebra, the sequence HH → H(Tot) → H(Tot) → HH of the total cyclic bicomplex is exact at every term. The three statements are [exactness at S](https://taucetiproject.org/docs/TauCeti/RingTheory/CyclicCohomology/ExactSequence.html#TauCeti.exact_cyclicTotalHomologyConnesB_cyclicTotalHomologyPeriodicity), [exactness at B](https://taucetiproject.org/docs/TauCeti/RingTheory/CyclicCohomology/ExactSequence.html#TauCeti.exact_homologyMap_cyclicTotalComplexToHochschild_cyclicTotalHomologyConnesB) and [exactness at I](https://taucetiproject.org/docs/TauCeti/RingTheory/CyclicCohomology/Periodicity.html#TauCeti.exact_cyclicTotalHomologyPeriodicity_homologyMap_cyclicTotalComplexToHochschild). Over a ring containing ℚ, the total complex computes cyclic cohomology ([`quasiIso_cyclicCochainComplexToTotal`](https://taucetiproject.org/docs/TauCeti/RingTheory/CyclicCohomology/Bicomplex.html#TauCeti.quasiIso_cyclicCochainComplexToTotal)).
- **Cyclic cocycles are characters of cycles** — the universal forms over A⁺ are a differential graded algebra, and every cyclic cocycle φ is the character of the universal-form cycle with trace ∫_φ ([`cycleCocycle_trace`](https://taucetiproject.org/docs/TauCeti/NoncommutativeGeometry/UniversalDifferential/Cycle.html#TauCeti.UniversalForms.cycleCocycle_trace)). With the earlier converse, this matches cycles and cocycles.
- **Connes' pairings on algebraic K-theory** — the odd pairing factors through K₁ = GL∞/E∞ ([`AlgebraicK1.oddPairing`](https://taucetiproject.org/docs/TauCeti/RingTheory/CyclicCohomology/OddPairing/AlgebraicK1.html#TauCeti.AlgebraicK1.oddPairing)) and through relative K₁ for nonunital algebras. The even pairing factors through K₀ of finitely generated projective modules ([`evenPairingK0`](https://taucetiproject.org/docs/TauCeti/RingTheory/CyclicCohomology/EvenPairing/AlgebraicK0.html#TauCeti.cyclicCohomology.evenPairingK0)).
- **The Dixmier trace is a trace** — for a dilation-invariant generalized limit ω, Tr_ω is additive on positive operators of L^(1,∞) and extends to a [continuous linear functional](https://taucetiproject.org/docs/TauCeti/Analysis/OperatorIdeal/Family/DixmierTrace/Linear.html#TauCeti.linearDixmierTrace) with Tr_ω(AT) = Tr_ω(TA) for bounded A ([`complexDixmierTrace_comp_comm`](https://taucetiproject.org/docs/TauCeti/Analysis/OperatorIdeal/Family/DixmierTrace/Linear.html#TauCeti.complexDixmierTrace_comp_comm)). It vanishes on the trace class, and an explicit operator has [traces that depend on ω](https://taucetiproject.org/docs/TauCeti/Analysis/OperatorIdeal/Family/DixmierTrace/Measurable.html#TauCeti.exists_isPositive_mem_logarithmic_not_isDixmierMeasurable).
- **Eigenbasis for compact resolvent** — a self-adjoint operator with compact resolvent has an orthonormal eigenbasis inside its domain ([`exists_hilbertBasis_forall_apply_eq_smul_of_hasCompactResolvent`](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/LinearPMap/Eigenbasis.html#IsSelfAdjoint.exists_hilbertBasis_forall_apply_eq_smul_of_hasCompactResolvent)).

### Notable definitions and infrastructure

- [Periodic cyclic cohomology](https://taucetiproject.org/docs/TauCeti/RingTheory/CyclicCohomology/PeriodicCohomology.html#TauCeti.periodicCyclicCohomology) is the direct limit of the bicomplex cohomology under S. It is [2-periodic](https://taucetiproject.org/docs/TauCeti/RingTheory/CyclicCohomology/PeriodicCohomology.html#TauCeti.periodicCyclicCohomology.shiftIso) and [stabilizes](https://taucetiproject.org/docs/TauCeti/RingTheory/CyclicCohomology/PeriodicCohomology.html#TauCeti.periodicCyclicCohomology.isIso_ι_of_isZero_hochschildCohomology) when Hochschild cohomology vanishes in high degree.
- [Continuous cyclic cohomology](https://taucetiproject.org/docs/TauCeti/RingTheory/CyclicCohomology/Continuous/Cohomology.html#TauCeti.continuousCyclicCohomology) is defined as the README asks: actual coboundaries rather than their closure, and the quotient topology. A [relative version](https://taucetiproject.org/docs/TauCeti/RingTheory/CyclicCohomology/Continuous/Relative.html#TauCeti.continuousRelativeCyclicCohomology) handles nonunital algebras.
- The [smooth noncommutative torus](https://taucetiproject.org/docs/TauCeti/NoncommutativeGeometry/SmoothTorus/Basic.html#TauCeti.SmoothNoncommutativeTorus) is the algebra of rapidly decreasing Fourier series with U₂U₁ = e^(2πiθ)U₁U₂ and a faithful trace. The source also gives it its Fréchet seminorm topology, its gauge derivations δ₁, δ₂ and continuous versions of the torus cocycles.

### Roadmap coverage

**N1 is partial.** Done:
- the algebraic theory for unital and relative cochains: the bicomplex comparison, SBI exactness and periodic cohomology;
- universal forms as a differential graded algebra, with cycles and cocycles matched in both directions, and exterior products of cocycles;
- normalized cochains and chains;
- continuous cyclic cohomology.

Missing:
- S as the product with σ₁, the comparison with the (b, B) totalization and its constants;
- homotopy and Morita invariance on cohomology, and the shuffle comparison;
- completed bar resolutions and the smooth-circle tensor identity.

**N2 is partial.** The pairings descend to algebraic K-theory, and the Chern chains satisfy (b + B)ch = 0. Missing are the relative K₀ pairing, topological homotopy, the Fréchet/C* transport and every calibration (circle, Bott and odd product).

**N4 is partial and nearly done.** The logarithmic ideal, generalized limits, the linear Dixmier trace, measurability and the pathological examples are proved. The Tauberian bridge with its residue formula is missing, and so are the weak-Schatten comparisons.

**N3, N5 and N6 have foundations only.** For N3, the source defines even and odd Fredholm modules with compact perturbation and unitary transport, but has no characters, normalization or index theorem. N5 has compact resolvent and the eigenbasis, but no spectral triples. N6 has the smooth torus and its derivations, but no C*-comparison, connections or cohomology computation.

**N7 is untouched.**

## The frontier

- **Normalizing S and the periodic comparison** — identify the column shift with the product by σ₁, then compare HP with the direct-sum (b, B) totalization using the pinned constants c₂ₘ and c₂ₖ₊₁.
- **The Tauberian bridge** — (s − 1)Tr(T^s) → L iff the logarithmic means converge, giving Tr_ω(T) = L. N7's Tr_ω(|D|⁻²) = 1/(2π) depends on this.
- **Fredholm-module characters** — the conditional trace Tr′, the cocycles τₙ, and normalization by the sine replacement and doubling. Then the character index theorem, which needs K4's index.
- **Topological invariance of the pairings** — smooth homotopy invariance and the transport through K3 to C*-K-theory for inverse-closed Fréchet subalgebras.
- **Periodic cyclic cohomology of the torus** — HP^even and HP^odd of 𝒜_θ are each ℂ², spanned by Sτ, φ and the classes τ(a₀δⱼa₁). This needs the continuous two-step resolution, which needs N1's completed bar resolutions.
