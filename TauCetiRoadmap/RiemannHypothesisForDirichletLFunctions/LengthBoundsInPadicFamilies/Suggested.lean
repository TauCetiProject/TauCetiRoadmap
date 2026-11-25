import Mathlib

/-!
# Length bounds in p-adic families: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti. Two of the three
headlines are commutative algebra over a discrete valuation ring and are stated below; the third
needs constructions the pins do not have, listed below, and nothing is stated in its place.

* The length bound for relative congruence modules (1.7a (4), (4′)): stated as
  `length_quot_annihilators_le_sum_rank_mul_relCongruence` and
  `length_quot_annihilators_le_sum_rank_mul_of_endomorphisms`. The congruence module `Ψ_Y(M)` is
  defined in 1.7a through the idempotent `e_Y` of `A ⊗ K` acting on `M ⊗ K`; the statements use
  its description by annihilators, `Ψ_Y(M) = M/(M[𝔞_Y] + M[𝔞_{X∖Y}])` with `𝔞_Y` the functions
  of `A` vanishing on `Y` (1.7a (3)), and read the multiplicity `mult(π)`, the dimension of the
  `π`-eigenspace of `M ⊗ K`, as the rank of `M[ker λ_π] = M ∩ V_π`, a lattice in that eigenspace.
  Both descriptions are part of the target 1.7a, so the statements have its generality. The
  valuation of a nonzero element or ideal of `O` is the length of the quotient of `O` by it.
* The determinant lemma (1.8b (1)): stated as `length_quot_le_sum_length_blockSolutions`. The
  solution module `Sol_b` is the submodule of `((K/O)^{d_b})^g` cut out by the relations, with
  `K/O` the quotient of `K` by the image of `O`; lengths take values in `ℕ∞`, so infinite lengths
  are allowed on the right, as in 1.8b. Its form with one array over a residue field with more
  than `g·Σ_b d_b` elements (1.8b (1′)), the form of the formal proof, is stated as
  `length_quot_le_sum_length_blockSolutions_of_card_residueField`.
* The Ribet-type bound by Selmer groups (1.8c (1), (3) with 1.8d (2), (3)): for a profinite group
  `G`, continuous representations `r_x : G → GL_n(O)` whose characteristic coefficients come from a
  determinant `A[G] → A` over a complete local split algebra `A`, a point `π` at which `r_π ⊗ K`
  splits into blocks `ρ_b` with absolutely irreducible, pairwise non-isomorphic reductions, one of
  them a character `χ`, and a set `Z` containing every point at which `χ` occurs, if the cut
  cocycles satisfy local conditions `L_{b,v}`, then `length_O(O/c(π))` is at most the sum over the
  blocks of the lengths of the Selmer groups `H¹_𝒮(G, ρ_b ⊗ χ^{−1} ⊗ K/O)` (the formal proof
  assumes there a residue field with more than `g·n` elements, `g` the number of generators of
  the module `Y_s` of 1.8c, except in the setting of 1.8e, where it proves the bound over every
  residue field). Its cohomology is at
  the pins: Mathlib's `continuousCohomology` of a `TopRep` over `O` is an `O`-module, with the
  restriction maps `ContinuousCohomology.map` along continuous homomorphisms; Tau Ceti has the
  continuous inhomogeneous `1`-cocycles and their classes (`TauCeti.ContCohomology.Z1`,
  `TauCeti.ContCohomology.H1`, `TauCeti.ContCohomology.H1pi`), identified with
  `continuousCohomology` by `TauCeti.ContCohomology.explicitH1AddEquivContinuousCohomology` and,
  for discrete coefficients over any scalars, by
  `TauCeti.ContCohomology.ofDiscreteModuleRestrictScalarsIntEquiv`, and Selmer groups of local
  conditions along compatible pairs as additive subgroups
  (`TauCeti.ContCohomology.SelmerStructure.selmerGroup`). Its determinant is a Mathlib
  `PolynomialLaw` satisfying Tau Ceti's `PolynomialLaw.IsMultiplicative` and
  `PolynomialLaw.IsHomogeneousOfDegree`, though its specialisation along `λ_x : A → O` has no
  carrier (the pins have no base change of polynomial laws). What the pins lack besides is the
  coefficient module and the cocycles of the hypothesis. The coefficients `ρ_b ⊗ χ^{−1} ⊗ K/O`
  are not a `TopRep`: `K/O`, for an abstract fraction field `K`, carries no topology, and Tau
  Ceti's `TauCeti.ofDiscreteModule` takes the discrete topology and the action as instances. The
  cut cocycles are built from the constructions of 1.8c (the algebra `𝒜` spanned by the `r(g)`,
  the block maps `ψ_b` of a conjugation over `K`, an idempotent `E`, the module `Y_s`, and its
  homomorphisms into `(K/O)^{d_b}` through `ψ_b`). Stating the headline would take a chain of
  definitions of this roadmap's own constructions, not a few simple ones, so it is stated in the
  README only.

The extension-module bound 1.8c (1), for an arbitrary group without topology, is algebra on finitely
many matrices and statable in Mathlib; it is the step of the route to the third headline that
precedes the passage to cohomology classes, not a headline, and it is not stated here. The bound
with local defects 1.8e refines the third headline, with the module with columns of 1.8e in place
of `Y_s`, and needs the same constructions.
-/

namespace TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.LengthBoundsInPadicFamilies

/-! ## Layer 1: Congruence modules and Ribet-type length bounds -/

/-- **The length bound for relative congruence modules** (1.7a (4), final clause). Let `O` be a
discrete valuation ring, `X` a finite set, `A ⊆ O^X` an `O`-subalgebra separating the points of
`X`, and `M` a finitely generated torsion-free `O`-module with an `O`-linear `A`-action. For
`Z ⊆ X`, the congruence module `Ψ_Z(M) = M/(M[𝔞_Z] + M[𝔞_{X∖Z}])` (1.7a (3)), where `𝔞_Y` is the
ideal of the functions of `A` vanishing on `Y`, has length
`η_Z(M) ≤ Σ_{π∈Z} mult(π)·v(cc_Z(π))`, with `mult(π)` the rank of `M[ker λ_π]` and
`cc_Z(π) = {f(π) : f ∈ A, f = 0 on X ∖ Z}` the relative congruence ideal. Follows from
[FormalProof], `Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/LenUnitLeOfFamily.lean`
(`GlobalTheory.EtaFromCut.congMod_le_of_family`), `Formalism/CharacterColumnKernels/StatementN.lean`
(`Formalism.NG.CongMod`). -/
theorem length_quot_annihilators_le_sum_rank_mul_relCongruence
    {O : Type*} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    {X : Type*} [Fintype X] [DecidableEq X]
    (A : Subalgebra O (X → O)) (hsep : ∀ x y : X, x ≠ y → ∃ f ∈ A, f x ≠ f y)
    {M : Type*} [AddCommGroup M] [Module O M] [Module A M] [IsScalarTower O A M]
    [Module.Finite O M] [Module.IsTorsionFree O M]
    (Z : Finset X) :
    Module.length O (M ⧸
        (Submodule.torsionBySet A M {f : A | ∀ y ∈ Z, (f : X → O) y = 0} ⊔
          Submodule.torsionBySet A M {f : A | ∀ y ∉ Z, (f : X → O) y = 0}).restrictScalars O) ≤
      ∑ π ∈ Z,
        (Module.finrank O
            ((Submodule.torsionBySet A M {f : A | (f : X → O) π = 0}).restrictScalars O) : ℕ∞) *
          Module.length O (O ⧸ Ideal.span
            ((fun f : A => (f : X → O) π) '' {f : A | ∀ y ∉ Z, (f : X → O) y = 0})) := by
  sorry

/-- **The length bound for a family of endomorphisms** (1.7a (4′)). In the setting of
`length_quot_annihilators_le_sum_rank_mul_relCongruence`, let `S ⊆ X` and, for each `π ∈ S`, let
`α_π` be an `O`-linear endomorphism of `M` commuting with `A`, killing `M ∩ V_x = M[ker λ_x]` for
every `x ∉ S` and acting on `M ∩ V_π = M[ker λ_π]` by a nonzero scalar `a_π ∈ O`. Then
`η_S(M) ≤ Σ_{π∈S} mult(π)·v(a_π)`. Nothing is asked of `α_π` on `V_x` for the other `x ∈ S`.
Follows from [FormalProof],
`Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/LenUnitLeOfFamily.lean`
(`GlobalTheory.EtaFromCut.congMod_le_of_family`). -/
theorem length_quot_annihilators_le_sum_rank_mul_of_endomorphisms
    {O : Type*} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    {X : Type*} [Fintype X] [DecidableEq X]
    (A : Subalgebra O (X → O)) (hsep : ∀ x y : X, x ≠ y → ∃ f ∈ A, f x ≠ f y)
    {M : Type*} [AddCommGroup M] [Module O M] [Module A M] [IsScalarTower O A M]
    [Module.Finite O M] [Module.IsTorsionFree O M]
    (S : Finset X) (α : X → Module.End O M) (a : X → O)
    (hcomm : ∀ π ∈ S, ∀ (f : A) (m : M), α π (f • m) = f • α π m)
    (hkill : ∀ π ∈ S, ∀ x ∉ S,
      ∀ m ∈ Submodule.torsionBySet A M {f : A | (f : X → O) x = 0}, α π m = 0)
    (hact : ∀ π ∈ S,
      ∀ m ∈ Submodule.torsionBySet A M {f : A | (f : X → O) π = 0}, α π m = a π • m)
    (ha : ∀ π ∈ S, a π ≠ 0) :
    Module.length O (M ⧸
        (Submodule.torsionBySet A M {f : A | ∀ y ∈ S, (f : X → O) y = 0} ⊔
          Submodule.torsionBySet A M {f : A | ∀ y ∉ S, (f : X → O) y = 0}).restrictScalars O) ≤
      ∑ π ∈ S,
        (Module.finrank O
            ((Submodule.torsionBySet A M {f : A | (f : X → O) π = 0}).restrictScalars O) : ℕ∞) *
          Module.length O (O ⧸ Ideal.span {a π}) := by
  sorry

/-- **Lengths from generic determinants of block homomorphisms** (1.8b (1)). Let `O` be a discrete
valuation ring with fraction field `K`, `𝒜` an `O`-algebra, `ψ_b : 𝒜 → M_{d_b}(O)` (`b ∈ B`,
finitely many) surjective `O`-algebra homomorphisms, `g ≥ 1` and `Rel ⊆ 𝒜^g` a left
`𝒜`-submodule. If an ideal `J ⊆ O` contains every coefficient of
`∏_b det ψ_b(Σ_{k=1}^m X_k Θ_k) ∈ O[X_1, …, X_m]` for every `m` and all `g × g` arrays `Θ_k` over
`𝒜` with rows in `Rel` (`ψ_b(Θ)` being the `g·d_b × g·d_b` matrix over `O`), then
`length_O(O/J) ≤ Σ_b length_O Sol_b`, where
`Sol_b = {u ∈ ((K/O)^{d_b})^g : Σ_q ψ_b(θ_q) u_q = 0 for all θ ∈ Rel}`. This generic form is
the roadmap's variant; the formal proof has the form with one array over a large residue field,
stated next. -/
theorem length_quot_le_sum_length_blockSolutions
    {O : Type*} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    {K : Type*} [Field K] [Algebra O K] [IsFractionRing O K]
    {𝒜 : Type*} [Ring 𝒜] [Algebra O 𝒜]
    {B : Type*} [Fintype B] (d : B → ℕ)
    (ψ : ∀ b, 𝒜 →ₐ[O] Matrix (Fin (d b)) (Fin (d b)) O) (hψ : ∀ b, Function.Surjective (ψ b))
    (g : ℕ) (hg : 1 ≤ g) (Rel : Submodule 𝒜 (Fin g → 𝒜)) (J : Ideal O)
    (hJ : ∀ (m : ℕ) (Θ : Fin m → Fin g → Fin g → 𝒜), (∀ k r, Θ k r ∈ Rel) →
      ∀ s, (∏ b, Matrix.det (Matrix.of
        fun (ri qj : Fin g × Fin (d b)) =>
          ∑ k, MvPolynomial.X k * MvPolynomial.C (ψ b (Θ k ri.1 qj.1) ri.2 qj.2))).coeff s ∈ J) :
    Module.length O (O ⧸ J) ≤
      ∑ b, Module.length O
        (⨅ θ ∈ Rel, ⨅ i : Fin (d b), LinearMap.ker
          (∑ q : Fin g, ∑ j : Fin (d b), ψ b (θ q) i j •
            ((LinearMap.proj j : (Fin (d b) → K ⧸ LinearMap.range (Algebra.linearMap O K)) →ₗ[O]
                K ⧸ LinearMap.range (Algebra.linearMap O K)) ∘ₗ
              (LinearMap.proj q : (Fin g → Fin (d b) → K ⧸ LinearMap.range (Algebra.linearMap O K))
                →ₗ[O] Fin (d b) → K ⧸ LinearMap.range (Algebra.linearMap O K)))) :
          Submodule O (Fin g → Fin (d b) → K ⧸ LinearMap.range (Algebra.linearMap O K))) := by
  sorry

/-- **One array over a large residue field** (1.8b (1′)). In the setting of
`length_quot_le_sum_length_blockSolutions`, if `Rel` is finitely generated and the residue field of
`O` has more than `g·Σ_b d_b` elements, an ideal `J` containing `∏_b det ψ_b(Θ)` for every `g × g`
array `Θ` over `𝒜` with rows in `Rel` satisfies `length_O(O/J) ≤ Σ_b length_O Sol_b`. -/
theorem length_quot_le_sum_length_blockSolutions_of_card_residueField
    {O : Type*} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    {K : Type*} [Field K] [Algebra O K] [IsFractionRing O K]
    {𝒜 : Type*} [Ring 𝒜] [Algebra O 𝒜]
    {B : Type*} [Fintype B] (d : B → ℕ)
    (ψ : ∀ b, 𝒜 →ₐ[O] Matrix (Fin (d b)) (Fin (d b)) O) (hψ : ∀ b, Function.Surjective (ψ b))
    (g : ℕ) (hg : 1 ≤ g) (Rel : Submodule 𝒜 (Fin g → 𝒜)) (hRel : Rel.FG) (J : Ideal O)
    (hk : ((g * ∑ b, d b : ℕ) : Cardinal) < Cardinal.mk (IsLocalRing.ResidueField O))
    (hJ : ∀ Θ : Fin g → Fin g → 𝒜, (∀ r, Θ r ∈ Rel) →
      (∏ b, Matrix.det (Matrix.of
        fun (ri qj : Fin g × Fin (d b)) => ψ b (Θ ri.1 qj.1) ri.2 qj.2)) ∈ J) :
    Module.length O (O ⧸ J) ≤
      ∑ b, Module.length O
        (⨅ θ ∈ Rel, ⨅ i : Fin (d b), LinearMap.ker
          (∑ q : Fin g, ∑ j : Fin (d b), ψ b (θ q) i j •
            ((LinearMap.proj j : (Fin (d b) → K ⧸ LinearMap.range (Algebra.linearMap O K)) →ₗ[O]
                K ⧸ LinearMap.range (Algebra.linearMap O K)) ∘ₗ
              (LinearMap.proj q : (Fin g → Fin (d b) → K ⧸ LinearMap.range (Algebra.linearMap O K))
                →ₗ[O] Fin (d b) → K ⧸ LinearMap.range (Algebra.linearMap O K)))) :
          Submodule O (Fin g → Fin (d b) → K ⧸ LinearMap.range (Algebra.linearMap O K))) := by
  sorry

end TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.LengthBoundsInPadicFamilies
