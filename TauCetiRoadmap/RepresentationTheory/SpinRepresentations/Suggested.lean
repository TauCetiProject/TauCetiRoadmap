import Mathlib

/-!
# Clifford algebras, the Pin and Spin groups, and spin representations: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap. `sorry` is allowed in this human-owned roadmap
library -- these are goals, not proofs.

Mathlib has the Clifford algebra `CliffordAlgebra Q` with its universal property (`lift`), the
`ℤ/2`-grading `evenOdd Q`, the even subalgebra, `involute`/`reverse`, the module isomorphism
`CliffordAlgebra.equivExterior`, and -- unusually -- the groups `lipschitzGroup`, `pinGroup`,
`spinGroup` with their `Group` instances and the twisted-conjugation lemmas
`spinGroup.conjAct_smul_range_ι` (see `README.md` for the file-by-file map). It has **no double-cover
theorem** (nothing says `Spin(V) → SO(V)` is onto with kernel `{±1}`), **no spin module** (`⋀·W` is
never made a Clifford module), **no `𝔰𝔬(V) ≅ ⋀²V`**, **no spin/half-spin representation**, **no
highest-weight identification**, **no exceptional isomorphisms**, **no Bott-periodic real
classification**, and **no triality**.

The design follows the layers of `README.md`: the two gradings and the filtration (`filtration`,
`filtrationGradedEquiv`), the complex structure theorem, the Pin/Spin double covers (`orthogonalGroup`,
`ιRangeEquiv`, `pinToOrthogonal`, `spinToSpecialOrthogonal`, and the surjectivity/kernel), the Lie algebra `⋀²V`
(`soEquivBivector`), the spin modules (`spinAction`, `spinRep`, `spinPlus`), the low-dimensional
isomorphisms (`spin3_equiv_sl2`, `spin6_equiv_sl4`), the real forms and Bott periodicity
(`realCliffordForm`, `cliff_bott`, `spinPQ`), and triality (`trialityAut`). `README.md` remains the
definitive document.
-/

namespace TauCetiRoadmap.RepresentationTheory.SpinRepresentations

open CliffordAlgebra
open scoped Quaternion TensorProduct

universe u v

variable {R : Type u} [CommRing R] {M : Type v} [AddCommGroup M] [Module R M]

/-! ### Layer 0: the Clifford algebra, its universal property, and the two gradings

The universal property (`CliffordAlgebra.lift`), the `ℤ/2`-grading (`CliffordAlgebra.evenOdd`,
`gradedAlgebra`), the even subalgebra, and `involute`/`reverse` are **consumed** from Mathlib. The
missing piece is the *degree* filtration and its associated graded, the exterior powers. -/

/-- **The degree filtration**: `filtration Q k` is the span of products of at most `k` generators `ι v`,
including the scalars as the empty product; `F₀ = range (algebraMap R _)`, `F₁` the scalars together with
`range ι`, and union `⊤` (`CliffordAlgebra.iSup_ι_range_eq_top`). This is the span of products, not a power
of a submodule. -/
def filtration (Q : QuadraticForm R M) (k : ℕ) : Submodule R (CliffordAlgebra Q) := sorry

/-- **The filtration is multiplicative**: `Fᵢ · Fⱼ ≤ Fᵢ₊ⱼ`, so the associated graded is an algebra. -/
theorem filtration_mul_le (Q : QuadraticForm R M) (i j : ℕ) :
    filtration Q i * filtration Q j ≤ filtration Q (i + j) := sorry

/-- **The associated graded is the exterior algebra** (a PBW-type theorem, not a read-off from the module
isomorphism `equivExterior`): the graded pieces of the algebra isomorphism `gr Cliff(V, Q) ≅ ExteriorAlgebra`
give `Fₖ₊₁ / Fₖ ≅ ⋀ᵏ⁺¹ V` in characteristic not two, once `equivExterior` is shown to carry the filtration to
the exterior grading. -/
noncomputable def filtrationGradedEquiv (Q : QuadraticForm R M) [Invertible (2 : R)] (k : ℕ) :
    (filtration Q (k + 1) ⧸ (filtration Q k).comap (filtration Q (k + 1)).subtype)
      ≃ₗ[R] ⋀[R]^(k + 1) M := sorry

/-- The total dimension: `dim (Cliff Q) = 2 ^ dim M`, matching `∑ₖ (dim M).choose k`. -/
theorem finrank_cliffordAlgebra (Q : QuadraticForm R M) [Invertible (2 : R)]
    [Module.Free R M] [Module.Finite R M] :
    Module.finrank R (CliffordAlgebra Q) = 2 ^ Module.finrank R M := sorry

/-! ### Layer 1: the structure theorem (over an algebraically closed field, here `ℂ`) -/

/-- **Even dimension**: `Cliff(V, Q) ≅ M_{2^l}(ℂ)` for `Q` nondegenerate on a `2l`-dimensional `V`. -/
theorem cliffordAlgebra_equiv_matrix_of_even {V : Type v} [AddCommGroup V] [Module ℂ V]
    [FiniteDimensional ℂ V] (Q : QuadraticForm ℂ V) (hQ : Q.Nondegenerate) (l : ℕ)
    (hV : Module.finrank ℂ V = 2 * l) :
    Nonempty (CliffordAlgebra Q ≃ₐ[ℂ] Matrix (Fin (2 ^ l)) (Fin (2 ^ l)) ℂ) := sorry

/-- **Odd dimension**: `Cliff(V, Q) ≅ M_{2^l}(ℂ) × M_{2^l}(ℂ)` for `Q` nondegenerate on a
`(2l+1)`-dimensional `V`; the two factors are the source of the two `Pin` restrictions. -/
theorem cliffordAlgebra_equiv_matrix_prod_of_odd {V : Type v} [AddCommGroup V] [Module ℂ V]
    [FiniteDimensional ℂ V] (Q : QuadraticForm ℂ V) (hQ : Q.Nondegenerate) (l : ℕ)
    (hV : Module.finrank ℂ V = 2 * l + 1) :
    Nonempty (CliffordAlgebra Q ≃ₐ[ℂ]
      Matrix (Fin (2 ^ l)) (Fin (2 ^ l)) ℂ × Matrix (Fin (2 ^ l)) (Fin (2 ^ l)) ℂ) := sorry

/-! ### Layer 2: the Pin and Spin groups and the double covers

`pinGroup Q`, `spinGroup Q`, and the action lemma `spinGroup.involute_act_ι_mem_range_ι` are
**consumed**. The abstract orthogonal group and the double cover are **built here**. -/

/-- **The orthogonal group of a quadratic form**, the `Q`-preserving linear automorphisms. Not in
Mathlib for an abstract form (Mathlib's `Matrix.orthogonalGroup` is the standard form only). -/
def orthogonalGroup (Q : QuadraticForm R M) : Subgroup (M ≃ₗ[R] M) := sorry

/-- The determinant-one subgroup. -/
def specialOrthogonalGroup (Q : QuadraticForm R M) : Subgroup (M ≃ₗ[R] M) := sorry

/-- **Vectors from the Clifford algebra**: the linear equivalence `M ≃ₗ range (ι Q)`, from injectivity of
`ι Q` over a field with nondegenerate `Q`. The twisted conjugation lands in `range ι`; turning it into an
automorphism of `M` needs this equivalence, so it is a named milestone rather than an implicit step. -/
noncomputable def ιRangeEquiv (Q : QuadraticForm R M) :
    M ≃ₗ[R] ↥(LinearMap.range (CliffordAlgebra.ι Q)) := sorry

/-- **Twisted conjugation** `x ↦ (v ↦ involute x · ι v · x⁻¹)`, the homomorphism `Pin(V) →* O(V)`;
this is Mathlib's `spinGroup.involute_act_ι_mem_range_ι` transported through `ιRangeEquiv` to a group
homomorphism into the automorphisms of `M`. -/
noncomputable def pinToOrthogonal (Q : QuadraticForm R M) [Invertible (2 : R)] :
    pinGroup Q →* orthogonalGroup Q := sorry

/-- Its restriction to the spin group lands in `SO(V)`. -/
noncomputable def spinToSpecialOrthogonal (Q : QuadraticForm R M) [Invertible (2 : R)] :
    spinGroup Q →* specialOrthogonalGroup Q := sorry

/-- **The double cover, surjectivity** (Cartan-Dieudonné: every isometry is a product of reflections),
for finite-dimensional `V` over `ℂ` (algebraically closed) with nondegenerate `Q`. Over a general field this
fails pointwise: the image is the kernel of the spinor norm `SO(Q) → K*/(K*)²`; state that separately. -/
theorem spinToSpecialOrthogonal_surjective {V : Type v} [AddCommGroup V] [Module ℂ V]
    [FiniteDimensional ℂ V] (Q : QuadraticForm ℂ V) (hQ : Q.Nondegenerate) :
    Function.Surjective (spinToSpecialOrthogonal Q) := sorry

/-- **The double cover, kernel `{±1}`**: `1 → ℤ/2 → Spin(V) → SO(V) → 1`. The positive-dimension
hypothesis is essential: for `V = 0` the spin group and `SO(0)` are both trivial and the kernel has
cardinality `1`. -/
theorem card_ker_spinToSpecialOrthogonal {V : Type v} [AddCommGroup V] [Module ℂ V]
    [FiniteDimensional ℂ V] (hV : 0 < Module.finrank ℂ V)
    (Q : QuadraticForm ℂ V) (hQ : Q.Nondegenerate) :
    Nat.card (MonoidHom.ker (spinToSpecialOrthogonal Q)) = 2 := sorry

/-! ### Layer 3: the Lie algebra `𝔰𝔬(V) ≅ ⋀²V` inside the Clifford algebra -/

/-- **The bivector Lie ring**: the bracket on `⋀[R]^2 (Fin n → R)` transported from the Clifford
**commutator** through the embedding `w₁ ∧ w₂ ↦ ι w₁ · ι w₂ - ι w₂ · ι w₁` into the even Clifford
algebra of the standard form. Defining the bracket on the Clifford side is what keeps
`soEquivBivector` below a faithful statement — a bracket transported backwards from `so` would make
the Lie equivalence tautological. `[Invertible (2 : R)]` is required for the normalization (and the
equivalence itself is **false in characteristic 2**: for `n = 1`, `⋀²(𝔽₂) = 0` while
`so(1, 𝔽₂) ≅ 𝔽₂`). Scoped instances: roadmap-local. -/
noncomputable scoped instance bivectorLieRing (n : ℕ) (R : Type u) [CommRing R]
    [Invertible (2 : R)] : LieRing (⋀[R]^2 (Fin n → R)) := sorry

noncomputable scoped instance bivectorLieAlgebra (n : ℕ) (R : Type u) [CommRing R]
    [Invertible (2 : R)] : LieAlgebra R (⋀[R]^2 (Fin n → R)) := sorry

/-- **Bivectors are `𝔰𝔬(V)`** — as **Lie algebras**, with the Clifford-commutator bracket of
`bivectorLieRing` on the left: a `LinearEquiv` would be pure rank-counting (`n(n-1)/2` on both
sides) and carry none of the content that bivectors under the Clifford commutator *are* `𝔰𝔬`.
The normalization is fixed by the action (`soEquivBivector_wedge_mulVec` below), not by a
hard-coded `½`. Stated for the standard form here; the bracket of a bivector with `ι v` is the
differential of the Layer-2 conjugation. -/
noncomputable def soEquivBivector (n : ℕ) (R : Type u) [CommRing R] [Invertible (2 : R)] :
    ⋀[R]^2 (Fin n → R) ≃ₗ⁅R⁆ ↥(LieAlgebra.Orthogonal.so (Fin n) R) := sorry

/-- **The action-normalization pin** for `soEquivBivector`: the image of `u ∧ v` acts on vectors by
`x ↦ polar(v, x) • u - polar(u, x) • v`, where `polar` of the standard form is
`polar(u, x) = 2 ∑ᵢ uᵢ xᵢ`. This is the advertised lemma that pins which Lie equivalence
`soEquivBivector` is (any automorphism of `so` composed with it would otherwise also satisfy the
bare equivalence). -/
theorem soEquivBivector_wedge_mulVec (n : ℕ) (R : Type u) [CommRing R] [Invertible (2 : R)]
    (u v x : Fin n → R) :
    ((soEquivBivector n R (exteriorPower.ιMulti R 2 ![u, v]) : Matrix (Fin n) (Fin n) R)).mulVec x
      = (2 * ∑ i, v i * x i) • u - (2 * ∑ i, u i * x i) • v := sorry

/-! ### Layer 4: the spin and half-spin representations (over `ℂ`) -/

/-- **A maximal isotropic subspace** `W ⊂ V`, of half the dimension, over `ℂ`. -/
theorem exists_maximalIsotropic {V : Type v} [AddCommGroup V] [Module ℂ V] [FiniteDimensional ℂ V]
    (Q : QuadraticForm ℂ V) (hQ : Q.Nondegenerate) (l : ℕ) (hV : Module.finrank ℂ V = 2 * l) :
    ∃ W : Submodule ℂ V, Module.finrank ℂ W = l ∧ ∀ x ∈ W, Q x = 0 := sorry

/-- **Polarization data** for a complex quadratic space: a maximal isotropic `W`, a complementary
isotropic `W'` in perfect `polar`-pairing with `W`, and an anisotropic line (`⊥` in even dimension,
one-dimensional in odd dimension, orthogonal to both). This is the data the spinor action needs to
be **well-defined**: acting by a general `v` uses its `W`/`W'`/line components, so with `W` alone
the advertised target can even be empty (`W = 0` against a 2-dimensional nondegenerate `V` would
ask for a unital algebra map `Mat₂(ℂ) → ℂ`). -/
structure SpinPolarizationData {V : Type v} [AddCommGroup V] [Module ℂ V]
    (Q : QuadraticForm ℂ V) where
  W : Submodule ℂ V
  W' : Submodule ℂ V
  line : Submodule ℂ V
  isotropic_W : ∀ x ∈ W, Q x = 0
  isotropic_W' : ∀ x ∈ W', Q x = 0
  pairing_nondegenerate_left : ∀ x ∈ W, (∀ y ∈ W', QuadraticMap.polar Q x y = 0) → x = 0
  pairing_nondegenerate_right : ∀ y ∈ W', (∀ x ∈ W, QuadraticMap.polar Q x y = 0) → y = 0
  line_orthogonal : ∀ e ∈ line, ∀ x ∈ W ⊔ W', QuadraticMap.polar Q e x = 0
  line_anisotropic : ∀ e ∈ line, e ≠ 0 → Q e ≠ 0
  line_rank_le_one : Module.finrank ℂ line ≤ 1
  disjoint_W_W' : Disjoint W W'
  disjoint_line : Disjoint (W ⊔ W') line
  span_top : W ⊔ W' ⊔ line = ⊤

/-- **The spinor representation of the Clifford algebra**: `Cliff(V, Q)` acts on `S = ⋀·W` by exterior
multiplication `w ∧ -` for `w ∈ W` and by interior product against `QuadraticMap.polar Q w'` for
`w' ∈ W'` — note the operator acts on `ExteriorAlgebra ℂ W = CliffordAlgebra (0)`, so the exact API
is the zero-form specialization `CliffordAlgebra.contractLeft` transported along
`CliffordAlgebra.equivExterior` (there is no bespoke exterior interior-product; name this route in
the implementation).
The coefficient is pinned to `polar` by the anticommutator identity `c x ∘ c y + c y ∘ c x = polar Q x y • 1`
(so `c v ∘ c v = Q v • 1` via `polar Q v v = 2 • Q v`), not a prose "twice". In **even** dimension this is an
isomorphism onto `End S` (`dim S = 2ˡ`), proved forward by generation and a dimension count, which supplies
the Layer-1 structure theorem. In **odd** dimension it is not injective (`dim Cliff = 2 · (2ˡ)²`): it factors
through one central-idempotent summand, with the extra vector `e` acting as the parity operator scaled so
`c e ∘ c e = Q e • 1`. -/
noncomputable def spinAction {V : Type v} [AddCommGroup V] [Module ℂ V] (Q : QuadraticForm ℂ V)
    (P : SpinPolarizationData Q) :
    CliffordAlgebra Q →ₐ[ℂ] Module.End ℂ (ExteriorAlgebra ℂ P.W) := sorry

/-- **The spin representation of the group**, the restriction of `spinAction` along
`spinGroup.toUnits`. -/
noncomputable def spinRep {V : Type v} [AddCommGroup V] [Module ℂ V] (Q : QuadraticForm ℂ V)
    (P : SpinPolarizationData Q) :
    Representation ℂ (spinGroup Q) (ExteriorAlgebra ℂ P.W) := sorry

/-- **The even half-spin summand** `S⁺ = ⋀ᵉᵛᵉⁿ W` (the odd part `S⁻` is defined dually); a
`spinGroup`-subrepresentation, since the spin group is even and preserves exterior parity. -/
noncomputable def spinPlus {V : Type v} [AddCommGroup V] [Module ℂ V] (Q : QuadraticForm ℂ V)
    (P : SpinPolarizationData Q) : Submodule ℂ (ExteriorAlgebra ℂ P.W) := sorry

/-- `S⁺` is invariant under the spin representation. -/
theorem spinPlus_invariant {V : Type v} [AddCommGroup V] [Module ℂ V] (Q : QuadraticForm ℂ V)
    (P : SpinPolarizationData Q) (g : spinGroup Q) :
    (spinPlus Q P).map (spinRep Q P g) ≤ spinPlus Q P := sorry

/-- The exterior algebra of an `l`-dimensional space has dimension `2ˡ` — a pure exterior-algebra
fact, genuinely absent from Mathlib, named for what it says (the previous name `finrank_spinRep`
referenced neither the representation nor `Q`). -/
theorem finrank_exteriorAlgebra {W : Type v} [AddCommGroup W] [Module ℂ W]
    [FiniteDimensional ℂ W] :
    Module.finrank ℂ (ExteriorAlgebra ℂ W) = 2 ^ Module.finrank ℂ W := sorry

/-- The dimension of the spin module is `2ˡ` — the representation-level corollary. -/
theorem finrank_spinRep {V : Type v} [AddCommGroup V] [Module ℂ V] (Q : QuadraticForm ℂ V)
    (P : SpinPolarizationData Q) [FiniteDimensional ℂ P.W] (l : ℕ)
    (hW : Module.finrank ℂ P.W = l) :
    Module.finrank ℂ (ExteriorAlgebra ℂ P.W) = 2 ^ l := sorry

/-- **Irreducibility in odd dimension**: `S` is a simple `spinGroup`-module (the Clifford action is
the full matrix algebra). -/
theorem spinRep_isIrreducible_of_odd {V : Type v} [AddCommGroup V] [Module ℂ V]
    [FiniteDimensional ℂ V] (Q : QuadraticForm ℂ V) (hQ : Q.Nondegenerate)
    (P : SpinPolarizationData Q) (l : ℕ) (hV : Module.finrank ℂ V = 2 * l + 1) :
    (spinRep Q P).IsIrreducible := sorry

/-! ### Layer 5: the fundamental representations of `Bₗ` and `Dₗ`

The highest-weight identification is a **Lie-algebra** statement (`S` as a `LieModule ℂ 𝔰𝔬(V) S` via the
bivector realization of Layer 3), stated against [`../LieHighestWeight`](../LieHighestWeight/README.md) and
[`../RootSystems`](../RootSystems/README.md); those objects are not yet in Mathlib, so only the dimension
milestones are pinned here. `S` (type `Bₗ`) has highest weight `ωₗ = ½(1,…,1)`; `S⁺, S⁻` (type `Dₗ`) have
highest weights `ωₗ, ωₗ₋₁`, the two fork-node fundamental weights, in the half-integral coset outside the
lattice generated by the vector weights `±eᵢ` (hence outside every tensor power of the standard module). The
passage from `Representation ℂ (spinGroup Q)` to this Lie module is the differential of the double cover, a
separate lemma, not folded into the highest-weight theorem. -/

/-- The half-spin representation of `𝔰𝔬(2l)` has dimension `2^{l-1}`. The intended domain is
`1 ≤ l`, carried explicitly: at `l = 0` the truncated subtraction would make the statement
coincidentally true but meaningless (there is no half-spin split of a point). -/
theorem finrank_spinPlus {V : Type v} [AddCommGroup V] [Module ℂ V] [FiniteDimensional ℂ V]
    (Q : QuadraticForm ℂ V) (P : SpinPolarizationData Q) (l : ℕ) (hl : 1 ≤ l)
    (hW : Module.finrank ℂ P.W = l) :
    Module.finrank ℂ (spinPlus Q P) = 2 ^ (l - 1) := sorry

/-! ### Layer 6: the low-dimensional exceptional isomorphisms -/

/-- **`Spin₃ ≅ SL₂`** (type `B₁ = A₁`); the `2`-dimensional spin representation is the standard
representation of `SL₂`. Over `ℝ` this is `Spin(3) ≅ SU(2)`. The isomorphism needs three steps:
`even Cliff(V, Q) ≅ M₂(ℂ)`; the spin group is the reversal-norm-one subgroup, identified with the
determinant-one subgroup; and the image is exactly `SL₂`, both directions. Definitional-matching
risk (review): Mathlib's `spinGroup Q` is the even units with its norm/`star` condition, not by
construction the `ℂ`-points of algebraic Spin — this `Spin₃` case is the early sanity check that
the norm condition yields the connected simply connected group with no spurious center or
component, and it should land before the higher cases are attempted. -/
theorem spin3_equiv_sl2 {V : Type v} [AddCommGroup V] [Module ℂ V] [FiniteDimensional ℂ V]
    (Q : QuadraticForm ℂ V) (hQ : Q.Nondegenerate) (hV : Module.finrank ℂ V = 3) :
    Nonempty (spinGroup Q ≃* Matrix.SpecialLinearGroup (Fin 2) ℂ) := sorry

/-- **`Spin₆ ≅ SL₄`** (type `D₃ = A₃`); `S⁺ ≅ ℂ⁴` is the standard representation, `S⁻ ≅ (ℂ⁴)*`. The
intermediate `Spin₄ ≅ SL₂ × SL₂` and `Spin₅ ≅ Sp₄` are stated likewise, `Sp₄` via the symplectic form on
`S` from the reversal antiautomorphism. Each needs the even-Clifford identification and the norm-condition
match, and proves the image is exactly the classical group. -/
theorem spin6_equiv_sl4 {V : Type v} [AddCommGroup V] [Module ℂ V] [FiniteDimensional ℂ V]
    (Q : QuadraticForm ℂ V) (hQ : Q.Nondegenerate) (hV : Module.finrank ℂ V = 6) :
    Nonempty (spinGroup Q ≃* Matrix.SpecialLinearGroup (Fin 4) ℂ) := sorry

/-! ### Layer 7: real Clifford algebras, Bott periodicity, and `Spin(p, q)` -/

/-- **The real form `Cliff(p, q)`**: the diagonal form with `p` entries `+1` and `q` entries `-1`. -/
def realCliffordForm (p q : ℕ) : QuadraticForm ℝ (Fin (p + q) → ℝ) := sorry

/-- **`Cliff(0,2) ≅ ℍ`**, the second entry of the Bott table (with `Cliff(0,1) ≅ ℂ` from
`CliffordAlgebraComplex.equiv`). -/
theorem cliff_zero_two_equiv_quaternion :
    Nonempty (CliffordAlgebra (realCliffordForm 0 2) ≃ₐ[ℝ] ℍ[ℝ]) := sorry

/-- **`Cliff(1,1) ≅ M₂(ℝ)`**, the periodicity step and a definitional acceptance test that pins the
sign/indexing convention of the mod-`8` table (`Cliff(1,0) ≅ ℝ × ℝ`, `Cliff(0,1) ≅ ℂ`, `Cliff(0,2) ≅ ℍ`,
`Cliff(1,1) ≅ M₂(ℝ)`). -/
theorem cliff_one_one_equiv_matrix :
    Nonempty (CliffordAlgebra (realCliffordForm 1 1) ≃ₐ[ℝ] Matrix (Fin 2) (Fin 2) ℝ) := sorry

/-- **Bott periodicity** `Cliff(p+1, q+1) ≅ Cliff(p, q) ⊗ M₂(ℝ)`, built from
`CliffordAlgebra.equivEven` and `CliffordAlgebra.prodEquiv`; iterating gives the mod-`8` table, indexed by
`(q - p) mod 8` in the convention fixed by the base entries above. -/
theorem cliff_bott (p q : ℕ) :
    Nonempty (CliffordAlgebra (realCliffordForm (p + 1) (q + 1)) ≃ₐ[ℝ]
      TensorProduct ℝ (CliffordAlgebra (realCliffordForm p q)) (Matrix (Fin 2) (Fin 2) ℝ)) := sorry

/-- **The real spin group `Spin(p, q)`**, the Layer-2 double cover of `SO(p, q)`; the compact
`Spin(n) = spinPQ n 0`. -/
abbrev spinPQ (p q : ℕ) := spinGroup (realCliffordForm p q)

/-! ### Layer 8: triality for `Spin₈` -/

/-- **Triality**: an order-three automorphism of `Spin₈` (`V = ℂ⁸`, type `D₄`) whose action on
representations cyclically permutes the three `8`-dimensional irreducibles `V ≅ S⁰`, `S⁺`, `S⁻`. Stage one
(cheaper) is representation-level: the order-three symmetry of the `D₄` Dynkin diagram from
[`../RootSystems`](../RootSystems/README.md) permutes the three highest weights. Stage two, this group
automorphism, lifts that diagram symmetry to the simply connected group and depends on an
integration/classification theorem for simply connected semisimple groups. -/
noncomputable def trialityAut {V : Type v} [AddCommGroup V] [Module ℂ V] [FiniteDimensional ℂ V]
    (Q : QuadraticForm ℂ V) (hQ : Q.Nondegenerate) (hV : Module.finrank ℂ V = 8) :
    spinGroup Q ≃* spinGroup Q := sorry

/-- **Triality has order three** (and is not inner). The nontriviality conjunct is the anti-vacuity
half: order dividing three alone is satisfied by the identity, so without `≠ refl` the target would
pin nothing. The full rep-permutation statement (`V ≅ S⁰ ↦ S⁺ ↦ S⁻ ↦ V`) is the Layer-8 companion
recorded in the comment below. -/
theorem trialityAut_order_three {V : Type v} [AddCommGroup V] [Module ℂ V] [FiniteDimensional ℂ V]
    (Q : QuadraticForm ℂ V) (hQ : Q.Nondegenerate) (hV : Module.finrank ℂ V = 8) :
    (trialityAut Q hQ hV).trans ((trialityAut Q hQ hV).trans (trialityAut Q hQ hV))
      = MulEquiv.refl (spinGroup Q) ∧
    trialityAut Q hQ hV ≠ MulEquiv.refl (spinGroup Q) := sorry

-- The `Spin₈`-invariant trilinear form `V ⊗ S⁺ ⊗ S⁻ → ℂ` permuted by triality (the octonion
-- multiplication as the triality form) is the concrete outcome; see `README.md` Layer 8.

end TauCetiRoadmap.RepresentationTheory.SpinRepresentations
