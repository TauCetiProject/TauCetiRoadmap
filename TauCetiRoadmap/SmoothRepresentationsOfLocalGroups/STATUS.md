<!--tauceti-status:v1 {"roadmap":"SmoothRepresentationsOfLocalGroups","to_sha":"d25d526e576659755e7a68a568facb24cb7cf97f","ts":"2026-11-24T20:52:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer SR.0","remaining":"abelian structure, discrete comparison, invariants functor, averaging projector, exact invariants, smooth centre; parts of admissible, dual, twist, base change","state":"partial"},{"id":"Layer SR.1","remaining":"integration, convolution algebra, idempotents, level Hecke algebra and its action on invariants, Hecke ring comparison, SR.1.3 to SR.1.5","state":"partial"},{"id":"Layer SR.0d","state":"untouched"},{"id":"Layer SR.2","state":"untouched"},{"id":"Layer SR.3a","state":"untouched"},{"id":"Layer SR.3","state":"untouched"},{"id":"Layer SR.2a","state":"untouched"},{"id":"Layer SR.4","state":"untouched"},{"id":"Layer SR.5","remaining":"remaining WD operations, nilpotent exp-log, algebraic composition, Frobenius semisimplification, and all of SR.5.1 and SR.5.3","state":"partial"},{"id":"Layer SR.6","state":"untouched"}],"readme_sha":"801bc54501adea035cf60cac03a062cde4a9860802121ec29fad6d3a57d990d9","roadmap":"SmoothRepresentationsOfLocalGroups","to_sha":"d25d526e576659755e7a68a568facb24cb7cf97f"}-->
# Status: SmoothRepresentationsOfLocalGroups

This file documents the status of the SmoothRepresentationsOfLocalGroups roadmap up until `d25d526` (2026-11-24T20:52:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer SR.0 is well under way. Van Dantzig's theorem, smoothness, smooth vectors and the smooth category with its smooth-part coreflection are proved. Admissibility, smooth characters, the smooth dual and change of coefficients are partly in place. The abelian structure, averaging and the centre are missing. SR.1 has its function spaces and ring-valued Haar measures but no convolution yet, and SR.5 has raw Weil–Deligne parameters and their basic operations. Every other layer is untouched.

### Named results

- **Van Dantzig's theorem** — for a Hausdorff topological group, being locally compact and totally disconnected, being locally compact and nonarchimedean, and having a neighbourhood basis of compact open subgroups are equivalent ([`IsTopologicalGroup.locallyCompact_totallyDisconnected_tfae`](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/Group/OpenSubgroup/Compact.html#TauCeti.IsTopologicalGroup.locallyCompact_totallyDisconnected_tfae)).
- **The smooth-part coreflection** — sending a representation to its smooth vectors is right adjoint to the inclusion of smooth representations into all representations, and the counit is an isomorphism exactly on smooth ones ([`SmoothRep.smoothPartAdjunction`](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Smooth/Category.html#TauCeti.SmoothRep.smoothPartAdjunction)).
- **Uniqueness of ring-valued Haar measures** — every A-valued Haar measure on compact open sets is the normalised one scaled by its volume on a fixed compact open subgroup of invertible pro-order. Under the normalised measure, a compact open subgroup has unit volume exactly when its pro-order is invertible ([`HaarMeasureWithValues.apply_eq_normalized_mul`](https://taucetiproject.org/docs/TauCeti/MeasureTheory/Group/HaarMeasureWithValues/Basic.html#TauCeti.HaarMeasureWithValues.apply_eq_normalized_mul), [unit criterion](https://taucetiproject.org/docs/TauCeti/MeasureTheory/Group/HaarMeasureWithValues/Basic.html#TauCeti.HaarMeasureWithValues.isUnit_normalized_apply_toCompactOpens_iff)).
- **Duality for smooth contragredients** — for smooth V and W, Hom_G(V, W̃) ≃ Hom_G(W, Ṽ), both being invariant pairings ([`smoothDualHomEquiv`](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Smooth/Dual.html#Representation.smoothDualHomEquiv)). The evaluation map into the double smooth dual is [not surjective for ℚ[ℚ_p/ℤ_p]](https://taucetiproject.org/docs/TauCeti/Examples/RepresentationTheory/Smooth/Dual.html#TauCeti.Examples.SmoothDual.not_surjective_smoothDualEval_padic).
- **Permutation Hecke algebras as endomorphism rings** — for a G-set S with finitely many orbits, the diagonally invariant functions on S × S under matrix product are isomorphic to End_G(A[S]) ([`PermutationHecke.toIntertwiningMapAlgEquiv`](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/OfMulAction/Hecke.html#TauCeti.PermutationHecke.toIntertwiningMapAlgEquiv)).

### Notable definitions and infrastructure

- **Invertible pro-order** — [`HasUnitProOrder`](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/Group/Profinite/UnitProOrder.html#TauCeti.HasUnitProOrder) and its cofinal version [`HasCofinalUnitProOrder`](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/Group/Profinite/UnitProOrder.html#TauCeti.HasCofinalUnitProOrder), with the pro-p and ℤ_p criteria. These are the hypotheses under which averaging, normalised measures and Hecke idempotents exist over a general ring.
- **Compactly supported locally constant functions** — [`LocallyConstant.compactlySupported`](https://taucetiproject.org/docs/TauCeti/Topology/LocallyConstant/CompactSupport.html#LocallyConstant.compactlySupported). Every such function is a finite sum of disjoint compact-open indicators and is bi-invariant under some compact open subgroup. This is the carrier of the convolution Hecke algebra.
- **Raw Weil–Deligne parameters** — [`WeilDeligneParameter`](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/WeilDeligne/Basic.html#TauCeti.WeilDeligneParameter), with morphisms, transport, Frobenius semisimplicity, and direct sums, tensor products, duals (with [double duality](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/WeilDeligne/Operations.html#TauCeti.WeilDeligneParameter.dualDualIso)) and twists.

### Roadmap coverage

**SR.0 is partial.**
- *Done:* *van-dantzig*, *is-smooth*, *smooth-vectors*, *smooth-rep-category* and *unit-pro-order*.
- *Partly done:*
  - *admissible*: the basis criterion is proved over a noetherian A, and closure under subobjects and finite sums is proved; closure under quotients is missing.
  - *finiteness-conditions*: finite generation is characterised by permutation quotients; local admissibility is missing.
  - *smooth-character*: the predicate is proved, and twisting preserves smoothness; the twist autoequivalence of `SmoothRep` is missing.
  - *smooth-dual*: parts (1)–(2) are proved, but not the fixed-vector formula or exactness.
  - *coefficient-change*: smoothness of base change and the comparison map on invariants, injective for flat coefficients, are proved; the functors and adjunction are missing.
- *Not started:* *smooth-rep-abelian* (only limits exist), *smooth-discrete-comparison*, *compact-open-invariants* as a functor, *averaging-projector*, *invariants-exact* and *smooth-centre*.

**SR.1 is partial.**
- *Done:* *locally-constant-compact-support* and *a-valued-haar-measure*.
- *Partly done:*
  - *open-closed-sequence*: proved for modules, but not in its equivariant or filtered form.
  - *integration*: only the product measure is in place.
  - *permutation-hecke-algebra*: the identification Fun_G(S × S, A) ≃ End_G(A[S]) is proved, but not the level algebra or its action on invariants.
- *Not started:* convolution onwards.

**SR.5 is partial.**
- *Done:* *wd-raw-parameters*.
- *Partly done:* *wd-parameter-operations*.
- Groundwork for symmetric powers has started.

**Untouched:** SR.0d, SR.2, SR.3a, SR.3, SR.2a, SR.4 and SR.6.

## The frontier

- **The averaging projector and exact invariants** (*averaging-projector*, *invariants-exact*): this needs the operator e_U onto V^U for U of invertible pro-order, then exactness of U-invariants. Invertible pro-order is now available. The missing parts of *admissible*, *smooth-dual* and *coefficient-change* all wait on this.
- **The abelian category** (*smooth-rep-abelian*): `SmoothRep` has limits through the coreflection. It still needs colimits, kernels and cokernels computed in `Rep`, and exactness of the inclusion.
- **Integration and convolution** (*integration*, *convolution-algebra*): finite-sum integration of compactly supported locally constant functions against an A-valued measure, then the Hecke algebra H(G, A). The function space, the measures and their products are already in place.
- **The level Hecke algebra** (*permutation-hecke-algebra*): this needs H(G, U; A) for S = G/U, its right action on V^U, and the trace and inclusion maps. After that comes the comparison with the double-coset Hecke ring.
- **The remaining Weil–Deligne operations** (*wd-parameter-operations*, *wd-algebraic-composition*): determinants, Sp(n), restriction, induction and scalar extension remain. Symmetric powers of parameters also need *nilpotent-exp-log*, which is not in place.
