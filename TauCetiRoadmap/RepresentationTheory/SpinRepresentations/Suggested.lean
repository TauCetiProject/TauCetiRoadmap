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
classification**, **no triality**, **no Lie-algebra action through the Clifford algebra** (the
quadratic realization of `𝔰𝔬(V, Q)` exists for no form, so no homomorphism `𝔤 → 𝔰𝔬(V, Q)` makes a
Clifford module a `𝔤`-module), and **no Kostant `ρ`-decomposition corollary** (`Cliff(𝔤, B) ≅ ⋀𝔤`
under left multiplication by the quadratic lift of the adjoint representation is isotypic).

The design follows the layers of `README.md`: the two gradings and the filtration (`filtration`,
`filtrationGradedEquiv`), the complex structure theorem, the Pin/Spin double covers (`orthogonalGroup`,
`ιRangeEquiv`, `pinToOrthogonal`, `spinToSpecialOrthogonal`, and the surjectivity/kernel), the Lie algebra `⋀²V`
(`soEquivBivector`), the spin modules (`spinAction`, `spinRep`, `spinPlus`), the low-dimensional
isomorphisms (`spin3_equiv_sl2`, `spin6_equiv_sl4`), the real forms and Bott periodicity
(`realCliffordForm`, `cliff_bott`, `spinPQ`), triality (`trialityAut`), and **Layer 9**, Lie
algebras acting through the Clifford algebra and Kostant's isotypy corollary (`cliffordBivector`,
`soEquivQuadratic`, `cliffordInducedRep`, `adjointSO`, `kostant_isotypic`, `kostant_multiplicity`,
and the CAR worked instance `traceQuadraticForm`, `glCliffordHom`, `car_isotypic`,
`car_simple_highestWeight`). `README.md` remains the definitive document.
-/

namespace TauCetiRoadmap.RepresentationTheory.SpinRepresentations

open CliffordAlgebra
open scoped Classical DirectSum Quaternion TensorProduct

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
**commutator** through the **half-normalized** embedding
`w₁ ∧ w₂ ↦ ⅟2 • (ι w₁ · ι w₂ - ι w₂ · ι w₁)` into the even Clifford algebra of the standard form
(the `⅟2` is forced by the action pin below: the raw commutator's adjoint action carries an extra
factor of two, and transporting the bracket through the raw embedding while pinning the halved
action would not be a Lie homomorphism). Defining the bracket on the Clifford side is what keeps
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

/-- **The action-normalization pin** for `soEquivBivector`: the image of `u ∧ v` (embedded with the
`⅟2` normalization of `bivectorLieRing`, whose Clifford adjoint action is then exactly
`x ↦ polar(v, x) • u - polar(u, x) • v` with `polar(u, x) = 2 ∑ᵢ uᵢ xᵢ` for the standard form) acts
by that formula. This pins which Lie equivalence `soEquivBivector` is (any automorphism of `so`
composed with it would otherwise also satisfy the bare equivalence), and fixes the `⅟2`-vs-raw
embedding choice consistently with the bracket transport. -/
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

/-! ### Layer 9: Lie algebras acting through the Clifford algebra, and Kostant's isotypy corollary

The Layer 3 realization freed from the standard form, the machine it powers (every Clifford module
is a `𝔤`-module along `θ : 𝔤 →ₗ⁅K⁆ 𝔰𝔬(V, Q)`), the adjoint embedding of a Lie algebra with an
invariant nondegenerate symmetric form, and Kostant's isotypy corollary. **Two different
`𝔤`-actions on `Cliff(𝔤, B)` live here, and only one is isotypic**: the commutator action
`x • c = ⁅q(x), c⁆` (`cliffordDerivationRep`) is the exterior extension of the adjoint
representation and is **not** isotypic (`⋀𝔰𝔩₂ ≅ 1 ⊕ V(2) ⊕ V(2) ⊕ 1`), while the **left-regular**
action `x • c = q(x) · c` is `L(ρ)`-isotypic; every isotypy and multiplicity statement below is
about the left-regular module. Isotypicity is stated in Mathlib's `LieModule` vocabulary (the name
`L(ρ)` lives in `../LieHighestWeight` and is not imported, the Layer 5 device); the highest weight
itself is pinned only in the `gl_N` worked instance, where the Cartan and Borel are concrete. The
carrier is the Clifford algebra itself; `CliffordAlgebra.equivExterior` and Layer 0's
`finrank_cliffordAlgebra` identify it with `⋀𝔤` of dimension `2^d`. Kostant's full
`ρ`-decomposition `C(𝔤) ≅ End(V_ρ) ⊗ C(P)` (with the primitive subspace `P`) is strictly stronger
than the isotypy pinned here and is named in `README.md` as a strengthening, not pinned.
Independent of Layers 6-8. -/

/-- **The quadratic element of a pair of vectors**: `⅟2 • ⁅ι Q a, ι Q b⁆` in `CliffordAlgebra Q`
(the commutator bracket is the `LieRing.ofAssociativeRing` instance), the abstract-form counterpart
of the half-normalized embedding of Layer 3 (`bivectorLieRing`). The defining property is
`cliffordBivector_lie_ι` below, not the formula; it lies in `even Q` and in `filtration Q 2`
(Layer 0). -/
noncomputable def cliffordBivector (Q : QuadraticForm R M) [Invertible (2 : R)] (a b : M) :
    CliffordAlgebra Q := sorry

/-- **The action-normalization pin**, the abstract statement of the formula that
`soEquivBivector_wedge_mulVec` pins for the standard form: the quadratic element of `(a, b)`
brackets with a generator by the infinitesimal rotation
`x ↦ polar Q b x • a - polar Q a x • b`. This one identity forces the `⅟2` and fixes every scalar
downstream (the factors of two live exactly here, so the pin is an equation, not prose). -/
theorem cliffordBivector_lie_ι (Q : QuadraticForm R M) [Invertible (2 : R)] (a b x : M) :
    ⁅cliffordBivector Q a b, CliffordAlgebra.ι Q x⁆
      = CliffordAlgebra.ι Q
          (QuadraticMap.polar Q b x • a - QuadraticMap.polar Q a x • b) := sorry

/-- **Quadratic elements form a Lie subalgebra** of `CliffordAlgebra Q` under the commutator: the
span of the `cliffordBivector Q a b`, closed under bracket by the polarization identities,
contained in `even Q` and in `filtration Q 2`. Unlike Layer 3's `bivectorLieRing` (a transported
bracket on `⋀²`), this is a `LieSubalgebra` of the Clifford algebra itself, so no scoped instances
are needed. -/
def quadraticLieSubalgebra (Q : QuadraticForm R M) [Invertible (2 : R)] :
    LieSubalgebra R (CliffordAlgebra Q) := sorry

/-- **The quadratic realization for an abstract form**: for nondegenerate `Q` on a
finite-dimensional space over a field with `2` invertible, the skew-adjoint endomorphisms of the
polar form (Mathlib's `skewAdjointLieSubalgebra`, the abstract `𝔰𝔬(V, Q)`; never a private
synonym) are Lie-isomorphic to the quadratic elements of the Clifford algebra. The normalization
is pinned by `soEquivQuadratic_lie_ι` below, matching Layer 3's convention, so over the standard
form this and `soEquivBivector` realize the same formula. -/
noncomputable def soEquivQuadratic {K : Type u} [Field K] {V : Type v} [AddCommGroup V]
    [Module K V] [FiniteDimensional K V] [Invertible (2 : K)] (Q : QuadraticForm K V)
    (hQ : Q.Nondegenerate) :
    ↥(skewAdjointLieSubalgebra (QuadraticMap.polarBilin Q))
      ≃ₗ⁅K⁆ ↥(quadraticLieSubalgebra Q) := sorry

/-- **The pin for `soEquivQuadratic`**: the quadratic element realizing a skew-adjoint `f`
brackets with `ι Q x` to give `ι Q (f x)`. Together with `cliffordBivector_lie_ι` this fixes the
equivalence (any automorphism of `𝔰𝔬` composed with it would break this identity). -/
theorem soEquivQuadratic_lie_ι {K : Type u} [Field K] {V : Type v} [AddCommGroup V]
    [Module K V] [FiniteDimensional K V] [Invertible (2 : K)] (Q : QuadraticForm K V)
    (hQ : Q.Nondegenerate)
    (f : ↥(skewAdjointLieSubalgebra (QuadraticMap.polarBilin Q))) (x : V) :
    ⁅(soEquivQuadratic Q hQ f : CliffordAlgebra Q), CliffordAlgebra.ι Q x⁆
      = CliffordAlgebra.ι Q ((f : Module.End K V) x) := sorry

/-- **Every Clifford module is a `𝔤`-module**: a Lie algebra homomorphism
`θ : 𝔤 →ₗ⁅K⁆ 𝔰𝔬(V, Q)` composed with the quadratic realization and a Clifford action
`ρ : CliffordAlgebra Q →ₐ[K] Module.End K S` (an `AlgHom`, a Lie homomorphism via
`AlgHom.toLieHom`) makes `S` a `𝔤`-module. The two instances that matter here: `ρ = spinAction Q P`
(Layer 4, the spin module) and `ρ = Algebra.lmul K (CliffordAlgebra Q)` (the left-regular module,
Kostant's setting). Pinned by `cliffordInducedRep_apply`. -/
noncomputable def cliffordInducedRep {K : Type u} [Field K] {V : Type v} [AddCommGroup V]
    [Module K V] [FiniteDimensional K V] [Invertible (2 : K)] (Q : QuadraticForm K V)
    (hQ : Q.Nondegenerate) {L : Type*} [LieRing L] [LieAlgebra K L]
    (θ : L →ₗ⁅K⁆ ↥(skewAdjointLieSubalgebra (QuadraticMap.polarBilin Q)))
    {S : Type*} [AddCommGroup S] [Module K S]
    (ρ : CliffordAlgebra Q →ₐ[K] Module.End K S) :
    L →ₗ⁅K⁆ Module.End K S := sorry

/-- The pin for `cliffordInducedRep`: it is the composite it claims to be. -/
theorem cliffordInducedRep_apply {K : Type u} [Field K] {V : Type v} [AddCommGroup V]
    [Module K V] [FiniteDimensional K V] [Invertible (2 : K)] (Q : QuadraticForm K V)
    (hQ : Q.Nondegenerate) {L : Type*} [LieRing L] [LieAlgebra K L]
    (θ : L →ₗ⁅K⁆ ↥(skewAdjointLieSubalgebra (QuadraticMap.polarBilin Q)))
    {S : Type*} [AddCommGroup S] [Module K S]
    (ρ : CliffordAlgebra Q →ₐ[K] Module.End K S) (x : L) :
    cliffordInducedRep Q hQ θ ρ x = ρ ↑(soEquivQuadratic Q hQ (θ x)) := sorry

/-- **The commutator (derivation) action** `x • c = ⁅q(θ x), c⁆` on the Clifford algebra, named
apart from the left-regular action because the two must never be conflated: under
`CliffordAlgebra.equivExterior` this one is the exterior extension of the action on `V`, and for
`θ = ad` it is **not** isotypic (`⋀𝔰𝔩₂ ≅ 1 ⊕ V(2) ⊕ V(2) ⊕ 1`, the `README.md` worked
non-example). Every isotypy statement below is about the left-regular action, not this one. -/
noncomputable def cliffordDerivationRep {K : Type u} [Field K] {V : Type v} [AddCommGroup V]
    [Module K V] [FiniteDimensional K V] [Invertible (2 : K)] (Q : QuadraticForm K V)
    (hQ : Q.Nondegenerate) {L : Type*} [LieRing L] [LieAlgebra K L]
    (θ : L →ₗ⁅K⁆ ↥(skewAdjointLieSubalgebra (QuadraticMap.polarBilin Q))) :
    L →ₗ⁅K⁆ Module.End K (CliffordAlgebra Q) := sorry

/-- **The adjoint embedding**: for a Lie algebra with a symmetric invariant bilinear form `B`
(`LinearMap.BilinForm.lieInvariant`; the trace form of a faithful representation, not necessarily
the Killing form), `ad x` is skew-adjoint, giving `ad : 𝔤 →ₗ⁅K⁆ 𝔰𝔬(𝔤, B)`. The codomain is
stated against the polar form of `B.toQuadraticMap` (which is `B + B.flip = 2 • B` for symmetric
`B`, Mathlib's `LinearMap.BilinMap.polarBilin_toQuadraticMap`; skew-adjointness for `B` and
`2 • B` agree), so it composes directly with `cliffordInducedRep`. Pinned by `adjointSO_apply`. -/
noncomputable def adjointSO {K : Type u} [Field K] {L : Type*} [LieRing L] [LieAlgebra K L]
    (B : LinearMap.BilinForm K L) (hsymm : B.IsSymm) (hinv : B.lieInvariant L) :
    L →ₗ⁅K⁆ ↥(skewAdjointLieSubalgebra
      (QuadraticMap.polarBilin (LinearMap.BilinMap.toQuadraticMap B))) := sorry

theorem adjointSO_apply {K : Type u} [Field K] {L : Type*} [LieRing L] [LieAlgebra K L]
    (B : LinearMap.BilinForm K L) (hsymm : B.IsSymm) (hinv : B.lieInvariant L) (x y : L) :
    (adjointSO B hsymm hinv x : Module.End K L) y = ⁅x, y⁆ := sorry

/-- **Rank is the Cartan dimension**: `LieAlgebra.rank ℂ L = finrank ℂ H` for a Cartan subalgebra
`H` of a Killing-semisimple `L` over `ℂ`. Absent from Mathlib (`rank` is defined via the nilpotency
degree of a generic element); the multiplicity exponents of Kostant's corollary below are stated in
`rank`, so this pin connects them to the weight theory. -/
theorem rank_eq_finrank_cartan (L : Type u) [LieRing L] [LieAlgebra ℂ L]
    [FiniteDimensional ℂ L] [LieAlgebra.IsKilling ℂ L] (H : LieSubalgebra ℂ L)
    [H.IsCartanSubalgebra] :
    LieAlgebra.rank ℂ L = Module.finrank ℂ H := sorry

/-- **The parity bookkeeping** `d = l + 2 · #Δ⁺`: the dimension of a Killing-semisimple `L` is the
rank plus twice the number of positive roots (root spaces are lines, `finrank_rootSpace_eq_one`).
Stated additively so no truncated subtraction appears; it makes the divisions in the exponents
`2^{(d-l)/2}` and `2^{(d+l)/2}` below exact. -/
theorem finrank_eq_rank_add_two_mul_card_isPos (L : Type u) [LieRing L] [LieAlgebra ℂ L]
    [FiniteDimensional ℂ L] [LieAlgebra.IsKilling ℂ L] (H : LieSubalgebra ℂ L)
    [H.IsCartanSubalgebra] [LieModule.IsTriangularizable ℂ H L]
    (base : (LieAlgebra.IsKilling.rootSystem H).Base) :
    Module.finrank ℂ L
      = LieAlgebra.rank ℂ L
        + 2 * (Finset.univ.filter fun i : H.root => base.IsPos i).card := sorry

/-- **The Killing quadratic form** `x ↦ κ(x, x)` of a Killing-semisimple `𝔤` over `ℂ`, the form of
Kostant's setting, pinned by `killingQuadraticForm_apply` and nondegenerate by `IsKilling`. -/
noncomputable def killingQuadraticForm (L : Type u) [LieRing L] [LieAlgebra ℂ L]
    [FiniteDimensional ℂ L] [LieAlgebra.IsKilling ℂ L] : QuadraticForm ℂ L := sorry

theorem killingQuadraticForm_apply (L : Type u) [LieRing L] [LieAlgebra ℂ L]
    [FiniteDimensional ℂ L] [LieAlgebra.IsKilling ℂ L] (x : L) :
    killingQuadraticForm L x = killingForm ℂ L x x := sorry

/-- **The adjoint quadratic lift** `𝔤 →ₗ⁅ℂ⁆ Cliff(𝔤, κ)`: the composite of `adjointSO` for the
Killing form with the quadratic realization, as a Lie algebra homomorphism into the Clifford
algebra under its commutator bracket. Pinned by `adjointCliffordHom_lie_ι`, the same shape as
`cliffordBivector_lie_ι`; the `gl_N` worked instance `glCliffordHom` below is its trace-form
sibling. -/
noncomputable def adjointCliffordHom (L : Type u) [LieRing L] [LieAlgebra ℂ L]
    [FiniteDimensional ℂ L] [LieAlgebra.IsKilling ℂ L] :
    L →ₗ⁅ℂ⁆ CliffordAlgebra (killingQuadraticForm L) := sorry

/-- The relation `⁅q(x), ι y⁆ = ι ⁅x, y⁆`: bracketing a generator with the adjoint quadratic lift
is the adjoint action, basis-free. -/
theorem adjointCliffordHom_lie_ι (L : Type u) [LieRing L] [LieAlgebra ℂ L]
    [FiniteDimensional ℂ L] [LieAlgebra.IsKilling ℂ L] (x y : L) :
    ⁅adjointCliffordHom L x, CliffordAlgebra.ι (killingQuadraticForm L) y⁆
      = CliffordAlgebra.ι (killingQuadraticForm L) ⁅x, y⁆ := sorry

/-- **Kostant's setting, packaged**: `Cliff(𝔤, κ)` as a `𝔤`-module under **left multiplication**
by the adjoint quadratic lift, `⁅x, c⁆ = adjointCliffordHom L x * c` (pinned by
`kostant_lie_def`). This is the left-regular action, the isotypic one; the commutator action is
`cliffordDerivationRep` and is a different module. `CliffordAlgebra.equivExterior` identifies the
carrier with `⋀𝔤`. Scoped instances: roadmap-local, following the `bivectorLieRing` precedent. -/
noncomputable scoped instance kostantLieRingModule (L : Type u) [LieRing L] [LieAlgebra ℂ L]
    [FiniteDimensional ℂ L] [LieAlgebra.IsKilling ℂ L] :
    LieRingModule L (CliffordAlgebra (killingQuadraticForm L)) := sorry

noncomputable scoped instance kostantLieModule (L : Type u) [LieRing L] [LieAlgebra ℂ L]
    [FiniteDimensional ℂ L] [LieAlgebra.IsKilling ℂ L] :
    LieModule ℂ L (CliffordAlgebra (killingQuadraticForm L)) := sorry

theorem kostant_lie_def (L : Type u) [LieRing L] [LieAlgebra ℂ L] [FiniteDimensional ℂ L]
    [LieAlgebra.IsKilling ℂ L] (x : L) (c : CliffordAlgebra (killingQuadraticForm L)) :
    ⁅x, c⁆ = adjointCliffordHom L x * c := sorry

/-- **Kostant's isotypy corollary** (B. Kostant, Adv. Math. 125 (1997)): for Killing-semisimple
`𝔤` over `ℂ`, any two simple submodules of the left-regular `Cliff(𝔤, κ)` are isomorphic.
Nonvacuous because the carrier is finite-dimensional (`finrank_cliffordAlgebra`), so simple
submodules exist. In the vocabulary of `../LieHighestWeight` the common simple constituent is
`L(ρ)`, the irreducible of highest weight the half-sum of positive roots; that name is prose here
(the Layer 5 device), and this statement carries the content without it. -/
theorem kostant_isotypic (L : Type u) [LieRing L] [LieAlgebra ℂ L] [FiniteDimensional ℂ L]
    [LieAlgebra.IsKilling ℂ L]
    (S₁ S₂ : LieSubmodule ℂ L (CliffordAlgebra (killingQuadraticForm L)))
    (h₁ : LieModule.IsIrreducible ℂ L S₁) (h₂ : LieModule.IsIrreducible ℂ L S₂) :
    Nonempty (S₁ ≃ₗ⁅ℂ,L⁆ S₂) := sorry

/-- **The multiplicity, as a pinned decomposition equivalence** (the summit of the layer):
`Cliff(𝔤, κ)` is a direct sum of `2^{(d+l)/2}` copies of one simple of dimension `2^{(d-l)/2}`,
`d = dim 𝔤`, `l = rank 𝔤`. The divisions are exact by `finrank_eq_rank_add_two_mul_card_isPos`,
and the bookkeeping check against Layer 0 is `2^{(d-l)/2} · 2^{(d+l)/2} = 2^d =
dim Cliff(𝔤, κ)`. -/
theorem kostant_multiplicity (L : Type u) [LieRing L] [LieAlgebra ℂ L] [FiniteDimensional ℂ L]
    [LieAlgebra.IsKilling ℂ L] :
    ∃ S : LieSubmodule ℂ L (CliffordAlgebra (killingQuadraticForm L)),
      LieModule.IsIrreducible ℂ L S ∧
      Module.finrank ℂ S = 2 ^ ((Module.finrank ℂ L - LieAlgebra.rank ℂ L) / 2) ∧
      Nonempty ((CliffordAlgebra (killingQuadraticForm L)) ≃ₗ⁅ℂ,L⁆
        ⨁ _ : Fin (2 ^ ((Module.finrank ℂ L + LieAlgebra.rank ℂ L) / 2)), S) := sorry

/-- **The spin-module variant**: the **full spinor module** `⋀·W` of `Cliff(𝔤, κ)` (Layer 4; in
even dimension this is `S⁺ ⊕ S⁻`, and the half-spin summands separately are smaller by a factor of
two, noted in `README.md`, not pinned), restricted to `𝔤` along the adjoint quadratic lift. Real
body: the composite of `adjointCliffordHom` with `spinAction` through `AlgHom.toLieHom`. -/
noncomputable def kostantSpinRep (L : Type u) [LieRing L] [LieAlgebra ℂ L]
    [FiniteDimensional ℂ L] [LieAlgebra.IsKilling ℂ L]
    (P : SpinPolarizationData (killingQuadraticForm L)) :
    L →ₗ⁅ℂ⁆ Module.End ℂ (ExteriorAlgebra ℂ P.W) :=
  ((spinAction (killingQuadraticForm L) P).toLieHom).comp (adjointCliffordHom L)

/-- The full spinor module is isotypic over `𝔤` with multiplicity `2^{⌊l/2⌋}`: a minimal invariant
subspace of dimension `2^{(d-l)/2}` whose dimension divides the whole with quotient `2^{⌊l/2⌋}`.
Stated with plain `Submodule` invariance because the module structure depends on the polarization
data `P`, which an instance cannot carry. -/
theorem kostantSpinRep_multiplicity (L : Type u) [LieRing L] [LieAlgebra ℂ L]
    [FiniteDimensional ℂ L] [LieAlgebra.IsKilling ℂ L]
    (P : SpinPolarizationData (killingQuadraticForm L)) :
    ∃ S₀ : Submodule ℂ (ExteriorAlgebra ℂ P.W),
      (∀ x : L, S₀.map (kostantSpinRep L P x) ≤ S₀) ∧ S₀ ≠ ⊥ ∧
      (∀ N' : Submodule ℂ (ExteriorAlgebra ℂ P.W), N' < S₀ →
        (∀ x : L, N'.map (kostantSpinRep L P x) ≤ N') → N' = ⊥) ∧
      Module.finrank ℂ S₀ = 2 ^ ((Module.finrank ℂ L - LieAlgebra.rank ℂ L) / 2) ∧
      Module.finrank ℂ (ExteriorAlgebra ℂ P.W)
        = 2 ^ (LieAlgebra.rank ℂ L / 2) * Module.finrank ℂ S₀ := sorry

/-! #### The worked instance: `gl_N` on `M_N(ℂ)` (the CAR algebra)

`𝔤 = gl_N = Matrix (Fin N) (Fin N) ℂ` is reductive, not Killing-semisimple, so its invariant form
is the **trace form** `⟨X, Y⟩ = tr (X * Y)` and its highest weight carries a half-integral central
component; the reductive highest-weight vocabulary is `../LieHighestWeight` Layer 9 and is cited in
prose only. The generators `d_ab = ι (Matrix.single a b 1)` satisfy the CAR relations
`d_ab d_cd + d_cd d_ab = 2 δ_bc δ_ad` (`polarBilin_traceQuadraticForm`), the normal-ordered
quadratics `F_ij = ½ Σ_k d_ik d_kj` are a Lie homomorphism (`glCliffordHom`), and the left-regular
module `Cliff(M_N)` (dimension `2^{N²}`, the fermionic Fock space `⋀(M_N)` via `equivExterior`) is
isotypic with `2^{N(N+1)/2}` simple summands of dimension `2^{N(N-1)/2}`, each generated by a
highest weight vector of weight `ν = (N - 1/2, …, 1/2)`. This is Panyushev's Prop. 2.4 and
Ex. 2.5(1), the decomposition behind the CAR-matrix analysis of Shlyakhtenko (arXiv:2606.28648);
`V* ⊗ L(ν) ≅ ⨁_t L(ν - ε_t)` is then the dual-standard Pieri rule of `../LieHighestWeight`. -/

/-- **The trace form on `N × N` matrices** as a quadratic form, `Q X = tr (X * X)`; the Killing
form of `gl_N` is degenerate, the trace form of the standard faithful representation is not, which
is why the layer is stated for an invariant form rather than the Killing form. -/
noncomputable def traceQuadraticForm (N : ℕ) :
    QuadraticForm ℂ (Matrix (Fin N) (Fin N) ℂ) := sorry

/-- Definitional pin for `traceQuadraticForm`. -/
theorem traceQuadraticForm_apply (N : ℕ) (X : Matrix (Fin N) (Fin N) ℂ) :
    traceQuadraticForm N X = Matrix.trace (X * X) := sorry

/-- **The CAR normalization, pinned as an equation**: the polar form of the trace quadratic form
is `2 tr (X * Y)`, so the generators anticommute by `d_ab d_cd + d_cd d_ab = 2 δ_bc δ_ad`. The
factors of two live exactly here. -/
theorem polarBilin_traceQuadraticForm (N : ℕ) (X Y : Matrix (Fin N) (Fin N) ℂ) :
    QuadraticMap.polarBilin (traceQuadraticForm N) X Y = 2 * Matrix.trace (X * Y) := sorry

/-- **The normal-ordered embedding** `E_ij ↦ F_ij = ½ Σ_k d_ik d_kj` as a Lie algebra
homomorphism `gl_N →ₗ⁅ℂ⁆ Cliff(M_N)`: the relations `[F_ij, F_kl] = δ_jk F_il - δ_li F_kj` are
the `gl_N` relations, carried by the bracket property. Pinned by `glCliffordHom_single` (the
formula) and `glCliffordHom_lie_ι` (the action on generators). -/
noncomputable def glCliffordHom (N : ℕ) :
    Matrix (Fin N) (Fin N) ℂ →ₗ⁅ℂ⁆ CliffordAlgebra (traceQuadraticForm N) := sorry

/-- The formula `F_ij = ½ Σ_k d_ik d_kj` on the elementary matrices (`Matrix.single i j 1` is
`E_ij`). -/
theorem glCliffordHom_single (N : ℕ) (i j : Fin N) :
    glCliffordHom N (Matrix.single i j 1)
      = (2⁻¹ : ℂ) • ∑ k : Fin N,
          CliffordAlgebra.ι (traceQuadraticForm N) (Matrix.single i k 1)
            * CliffordAlgebra.ι (traceQuadraticForm N) (Matrix.single k j 1) := sorry

/-- **The relation `[F_ij, d_kl] = δ_jk d_il - δ_li d_kj`, basis-free**: bracketing with a
generator is the adjoint action of `gl_N` on `M_N`. The `gl_N` instance of
`cliffordBivector_lie_ι`/`adjointCliffordHom_lie_ι`, and the compatibility that gives the Fock
space the correct infinitesimal action. -/
theorem glCliffordHom_lie_ι (N : ℕ) (X Y : Matrix (Fin N) (Fin N) ℂ) :
    ⁅glCliffordHom N X, CliffordAlgebra.ι (traceQuadraticForm N) Y⁆
      = CliffordAlgebra.ι (traceQuadraticForm N) ⁅X, Y⁆ := sorry

/-- **The normal-ordering constant**: `F_ij` differs from the antisymmetrized quadratic element by
the scalar `(N/2) δ_ij`. Summed against a diagonal matrix this is the central character
`X ↦ (N/2) tr X`, the source of the half-integral central component of the highest weight `ν`
below: the reductive answer is not the semisimple `ρ` alone. -/
theorem glCliffordHom_normalOrdering (N : ℕ) (i j : Fin N) :
    glCliffordHom N (Matrix.single i j 1)
      = (2⁻¹ : ℂ) • ∑ k : Fin N,
          cliffordBivector (traceQuadraticForm N) (Matrix.single i k 1) (Matrix.single k j 1)
        + algebraMap ℂ (CliffordAlgebra (traceQuadraticForm N))
            (if i = j then (N : ℂ) / 2 else 0) := sorry

/-- **The CAR module**: `Cliff(M_N)` as a `gl_N`-module under left multiplication by
`glCliffordHom` (pinned by `car_lie_def`); `equivExterior` identifies the carrier with the
fermionic Fock space `⋀(M_N)` of dimension `2^{N²}`. Scoped instances: roadmap-local. -/
noncomputable scoped instance carLieRingModule (N : ℕ) :
    LieRingModule (Matrix (Fin N) (Fin N) ℂ) (CliffordAlgebra (traceQuadraticForm N)) := sorry

noncomputable scoped instance carLieModule (N : ℕ) :
    LieModule ℂ (Matrix (Fin N) (Fin N) ℂ) (CliffordAlgebra (traceQuadraticForm N)) := sorry

theorem car_lie_def (N : ℕ) (X : Matrix (Fin N) (Fin N) ℂ)
    (c : CliffordAlgebra (traceQuadraticForm N)) :
    ⁅X, c⁆ = glCliffordHom N X * c := sorry

/-- **The CAR module is isotypic**: any two simple submodules of the left-regular `Cliff(M_N)` are
isomorphic, the `gl_N` case of Kostant's corollary for a reductive Lie algebra with the trace form
(Panyushev, Prop. 2.4, Ex. 2.5(1)). The name `L(ν)` is prose (`../LieHighestWeight` Layer 9). -/
theorem car_isotypic (N : ℕ)
    (S₁ S₂ : LieSubmodule ℂ (Matrix (Fin N) (Fin N) ℂ)
      (CliffordAlgebra (traceQuadraticForm N)))
    (h₁ : LieModule.IsIrreducible ℂ (Matrix (Fin N) (Fin N) ℂ) S₁)
    (h₂ : LieModule.IsIrreducible ℂ (Matrix (Fin N) (Fin N) ℂ) S₂) :
    Nonempty (S₁ ≃ₗ⁅ℂ, Matrix (Fin N) (Fin N) ℂ⁆ S₂) := sorry

/-- **The CAR multiplicity, as a pinned decomposition equivalence**: `2^{N(N+1)/2}` copies of one
simple of dimension `2^{N(N-1)/2}` (so `2^{N²}` in total, the general `d = N²`, `l = N`
bookkeeping). -/
theorem car_multiplicity (N : ℕ) :
    ∃ S : LieSubmodule ℂ (Matrix (Fin N) (Fin N) ℂ) (CliffordAlgebra (traceQuadraticForm N)),
      LieModule.IsIrreducible ℂ (Matrix (Fin N) (Fin N) ℂ) S ∧
      Module.finrank ℂ S = 2 ^ (N * (N - 1) / 2) ∧
      Nonempty ((CliffordAlgebra (traceQuadraticForm N))
        ≃ₗ⁅ℂ, Matrix (Fin N) (Fin N) ℂ⁆ ⨁ _ : Fin (2 ^ (N * (N + 1) / 2)), S) := sorry

/-- **The highest weight `ν = (N - 1/2, …, 1/2)`, pinned locally** (the Layer 5 device: the
Cartan and Borel of `gl_N` are concrete, so the statement uses `Matrix.single` and no
`../LieHighestWeight` vocabulary): every simple submodule contains a nonzero vector killed by the
strictly upper-triangular `E_ij` with `E_ii`-eigenvalue `N - i - 1/2` (zero-based `i`). The
half-integral entries are the normal-ordering constant (`glCliffordHom_normalOrdering`); the
integer consecutive differences are what make `ν` dominant for `gl_N`. -/
theorem car_simple_highestWeight (N : ℕ)
    (S : LieSubmodule ℂ (Matrix (Fin N) (Fin N) ℂ) (CliffordAlgebra (traceQuadraticForm N)))
    (hS : LieModule.IsIrreducible ℂ (Matrix (Fin N) (Fin N) ℂ) S) :
    ∃ s ∈ S, s ≠ 0 ∧
      (∀ i j : Fin N, i < j →
        ⁅(Matrix.single i j 1 : Matrix (Fin N) (Fin N) ℂ), s⁆ = 0) ∧
      ∀ i : Fin N,
        ⁅(Matrix.single i i 1 : Matrix (Fin N) (Fin N) ℂ), s⁆
          = (((N : ℂ) - ((i : ℕ) : ℂ)) - 1 / 2) • s := sorry

end TauCetiRoadmap.RepresentationTheory.SpinRepresentations
