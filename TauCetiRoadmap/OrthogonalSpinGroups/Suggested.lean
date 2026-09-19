import Mathlib
import TauCetiRoadmap.RestrictedProducts.Suggested
import TauCetiRoadmap.LocalFieldsRamification.Suggested
import TauCetiRoadmap.QuadraticFormInvariants.Suggested

/-!
# Orthogonal and spin groups: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The statements here suggest Lean forms for particular milestones, so that contributors and
reviewers converge on names and signatures; discharging all of them finishes neither a layer nor
the roadmap.

This roadmap owns the algebraic orthogonal, special-orthogonal, Pin and Spin interfaces over a
general field, their determinant and spinor-norm exact sequences, the orthogonal transvections,
and their local and finite-adelic spinor-norm specializations. Generic restricted-product maps,
adelic-point carriers, and rational diagonals are imported from `RestrictedProducts`; local
quadratic invariants and local-field power classes come from their final supplier namespaces. No
supplier carrier is restated below.

The spinor norm uses the canonical multiplicative square-class quotient
`Kˣ ⧸ Subgroup.square Kˣ` directly. There is no local `SquareClass` alias or generic pushforward
API in this namespace. ⚠ In particular `specialOrthogonalGroup Q` is a subgroup of
`V ≃ₗ[K] V`, **not** of `orthogonalGroup Q`; the determinant kernel inside
`orthogonalGroup Q` is the separately named `specialOrthogonalWithin`.

Conventions follow `README.md`. `K` is a field with `[Invertible (2 : K)]`. The bilinear form is
Mathlib's un-halved `QuadraticMap.polarBilin Q`, so `B x x = 2 • Q x`; the two reflection
spellings `B x v / Q v` and `2 * B x v / B v v` are therefore **equal**, which
`reflectionCoeff_eq` records, and the genuinely wrong form is the mixed `2 * B x v / Q v`. The
Clifford norm is the **`reverse`** norm, with `cliffordNorm_ι` an equality `N (ι v) = Q v` and no
sign ambiguity; Mathlib's `star = reverse ∘ involute` gives the other anti-involution, with value
`-Q v` on a vector, and the two differ by `(-1)^r` on a product of `r` vectors, a difference the
square-class codomain does **not** absorb, since `[-1]` is generally nontrivial.

The orthogonal local topologies are declared as **instances**, fixed to Mathlib's
`moduleTopology`, and never carried as data or as typeclass parameters a caller may choose. The
specialized compact-open compatibility record below feeds those instances to the imported generic
restricted-product constructors.

⚠ Two things are stated against **Mathlib's carriers as Mathlib defines them**, and neither may be
quoted from the classical theory. `lipschitzGroup Q` is a `Subgroup.closure` of the invertible
vectors, not the "twisted conjugation preserves `V`" Clifford group, which Mathlib does not know to
be the same object; so `vectorUnit_mem_lipschitzGroup`,
`product_vectorUnits_mem_lipschitzGroup`, `mem_lipschitzGroup_iff_exists_list`,
`scalarUnits_mem_lipschitzGroup`, `vectorRepresentation_surjective` and
`ker_vectorRepresentation_eq_scalarUnits` are theorems about that closure, with their hypotheses in
the type. And `pinGroup`/`spinGroup` are cut out by the `star`-unitary condition while every norm
here is the `reverse` norm; `star_mul_self_eq_reverse_mul_self_of_mem_even`,
`mem_spinGroup_iff_cliffordNorm_eq_one` and `exists_scalarUnits_mul_mem_spinGroup_iff` are the
three comparisons that make `range_spinToSpecialOrthogonal` a theorem about Mathlib's
`spinGroup`.

Strong approximation, reduction theory, Tamagawa measures, and central-isogeny volume formulas are
outside this file; they belong to `OrthogonalTamagawaAndLatticeMass`, over the generic suppliers
`AlgebraicGroupStrongApproximation`, `ArithmeticReductionTheory` and `TamagawaMeasures`. The
reduced norm of a central simple algebra and the group `SU(A, σ)` are likewise outside, and belong
to `AlgebrasWithInvolution`; what is stated here at dimension six is the strictness of
`spinGroup ≤ evenUnitaryGroup`, not the identification. In particular this file replaces no missing
contract by a `Prop`-valued stand-in.
-/

namespace TauCetiRoadmap.OrthogonalSpinGroups

open QuadraticMap

universe u v w

/-! ## Exact supplier-name checks

These are deliberately closed references to the imported final namespaces. Supplier renames or a
reintroduced local replacement therefore fail visibly at this consumer. -/

#check RestrictedProducts.integralSubgroup
#check RestrictedProducts.restrictedProductMap
#check RestrictedProducts.restrictedProductMapOfForall
#check RestrictedProducts.restrictedProductMapOfForall_apply
#check RestrictedProducts.restrictedProductCongr
#check RestrictedProducts.rationalDiagonal
#check RestrictedProducts.restrictAway
#check RestrictedProducts.RestrictedProductGroup
#check RestrictedProducts.RestrictedProductGroupAway
#check RestrictedProducts.RestrictedProductGroupWithFactor
#check QuadraticFormInvariants.hilbertSymbol
#check QuadraticFormInvariants.localHasse
#check QuadraticFormInvariants.hasseInvariant_eq_localHasse
#check LocalFieldsRamification.unitFiltration_le_range_powMonoidHom_two
#check LocalFieldsRamification.square_eq_range_powMonoidHom
#check LocalFieldsRamification.isOpen_range_powMonoidHom

/-! ## Layer 0: the orthogonal group, its determinant, and reflections -/

section Layer0

variable {K : Type u} [Field K] [Invertible (2 : K)]
variable {V : Type v} [AddCommGroup V] [Module K V]

/-- **The orthogonal group** of a quadratic form, the general-field carrier used throughout this
roadmap. -/
def orthogonalGroup (Q : QuadraticForm K V) : Subgroup (V ≃ₗ[K] V) where
  carrier := {f | ∀ x, Q (f x) = Q x}
  mul_mem' := by sorry
  one_mem' := by sorry
  inv_mem' := by sorry

/-- **The special orthogonal group**, as a subgroup of `V ≃ₗ[K] V`, not of
`orthogonalGroup Q`. -/
def specialOrthogonalGroup (Q : QuadraticForm K V) : Subgroup (V ≃ₗ[K] V) := sorry

theorem specialOrthogonalGroup_le (Q : QuadraticForm K V) :
    specialOrthogonalGroup Q ≤ orthogonalGroup Q := by
  sorry

/-- The canonical inclusion of `SO(Q)` into `O(Q)`, as a homomorphism, which is what later
statements restrict along. -/
def specialOrthogonalToOrthogonal (Q : QuadraticForm K V) :
    specialOrthogonalGroup Q →* orthogonalGroup Q :=
  Subgroup.inclusion (specialOrthogonalGroup_le Q)

/-- **The determinant homomorphism** on the orthogonal group, Layer 0A. Named `orthogonalDet`
rather than `det` so that it does not collide with the many other determinants in scope. -/
noncomputable def orthogonalDet (Q : QuadraticForm K V) : orthogonalGroup Q →* Kˣ :=
  (LinearEquiv.det (R := K) (M := V)).comp (orthogonalGroup Q).subtype

/-- **Layer 0A**: for a nondegenerate form the determinant of an isometry squares to one, so it
lands in `μ₂`. Proved from the Gram congruence `Mᵀ G M = G` with `det G ≠ 0`. -/
theorem orthogonalDet_sq [FiniteDimensional K V] (Q : QuadraticForm K V) (hQ : Q.Nondegenerate)
    (g : orthogonalGroup Q) : orthogonalDet Q g ^ 2 = 1 := by
  sorry

/-- The determinant kernel **inside** `orthogonalGroup Q`, kept typographically distinct from the
accepted `specialOrthogonalGroup`. Layer 0A. -/
noncomputable def specialOrthogonalWithin (Q : QuadraticForm K V) : Subgroup (orthogonalGroup Q) :=
  (orthogonalDet Q).ker

/-- **Layer 0A**: the two descriptions agree, so `specialOrthogonalWithin` really is the pullback
of the accepted subgroup along the inclusion. This is the lemma that lets a proof move between the
two spellings. -/
theorem specialOrthogonalWithin_eq_comap (Q : QuadraticForm K V) :
    specialOrthogonalWithin Q = (specialOrthogonalGroup Q).comap (orthogonalGroup Q).subtype := by
  sorry

/-- **Layer 0A**: and the resulting groups are canonically isomorphic. -/
noncomputable def specialOrthogonalWithinEquiv (Q : QuadraticForm K V) :
    specialOrthogonalWithin Q ≃* specialOrthogonalGroup Q :=
  sorry

/-- **Layer 0A**: index exactly two in positive dimension. Dimension zero is genuinely different
and is why the hypothesis is stated. -/
theorem index_specialOrthogonalWithin [FiniteDimensional K V] (Q : QuadraticForm K V)
    (hQ : Q.Nondegenerate) (hV : 0 < Module.finrank K V) :
    (specialOrthogonalWithin Q).index = 2 := by
  sorry

/-- The functional cutting out the reflection hyperplane of an anisotropic vector. -/
noncomputable def reflectionForm (Q : QuadraticForm K V) (v : V) : Module.Dual K V :=
  (Q v)⁻¹ • Q.polarBilin v

/-- **⚠ Layer 0D, the factor of two.** The two coefficient spellings in the literature are
*equal*, because Mathlib's `polar` is un-halved and `B v v = 2 • Q v`. The genuinely wrong form,
which sends `v` to `-3v`, is the mixed `2 * B x v / Q v`, obtained by substituting the un-halved
`B` into a half-polar source's numerator while leaving `Q v` in the denominator. -/
theorem reflectionCoeff_eq (Q : QuadraticForm K V) {v : V} (hv : Q v ≠ 0) (x : V) :
    polar Q x v / Q v = 2 * polar Q x v / polar Q v v := by
  sorry

theorem reflectionForm_apply_self (Q : QuadraticForm K V) {v : V} (hv : Q v ≠ 0) :
    reflectionForm Q v v = 2 := by
  sorry

/-- **The reflection** in an anisotropic vector, through `Module.reflection` so that involutivity
and `τ_v v = -v` come from Mathlib. -/
noncomputable def reflection (Q : QuadraticForm K V) {v : V} (hv : Q v ≠ 0) : V ≃ₗ[K] V :=
  Module.reflection (reflectionForm_apply_self Q hv)

theorem reflection_apply (Q : QuadraticForm K V) {v : V} (hv : Q v ≠ 0) (x : V) :
    reflection Q hv x = x - (Q v)⁻¹ • polar Q x v • v := by
  sorry

theorem reflection_mem (Q : QuadraticForm K V) {v : V} (hv : Q v ≠ 0) :
    reflection Q hv ∈ orthogonalGroup Q := by
  sorry

/-- **Layer 0D**: absent from Mathlib for `Module.reflection` in any form, and what makes the
parity statement of 0F meaningful. -/
theorem det_reflection [FiniteDimensional K V] (Q : QuadraticForm K V) {v : V} (hv : Q v ≠ 0) :
    LinearEquiv.det (reflection Q hv) = -1 := by
  sorry

/-- **Layer 0D**: what makes the spinor norm constant on a conjugacy class of reflections. -/
theorem reflection_conj (Q : QuadraticForm K V) {v : V} (hv : Q v ≠ 0) (g : orthogonalGroup Q)
    (hgv : Q (g.1 v) ≠ 0) :
    (g : V ≃ₗ[K] V) * reflection Q hv * (g : V ≃ₗ[K] V)⁻¹ = reflection Q hgv := by
  sorry

/-- **Layer 0E**, the transitivity engine. The reflection coefficient is exactly `1`, so `τ_{v-w}`
carries `v` to `w` on the nose. Witt's extension theorem gives existence of *an* isometry and says
nothing about its spinor norm, which is why the explicit reflection is the milestone. -/
theorem reflection_sub_apply (Q : QuadraticForm K V) {v w : V} (hQ : Q v = Q w)
    (h : Q (v - w) ≠ 0) : reflection Q h v = w := by
  sorry

/-- **Layer 0E**, the complementary case; one of the two hypotheses always holds. -/
theorem reflection_add_apply (Q : QuadraticForm K V) {v w : V} (hQ : Q v = Q w)
    (h : Q (v + w) ≠ 0) : reflection Q h v = -w := by
  sorry

end Layer0

/-! ## Layer 1: the Clifford norm, the spinor norm, and the comparison sequence -/

section Layer1

variable {K : Type u} [Field K] [Invertible (2 : K)]
variable {V : Type v} [AddCommGroup V] [Module K V]

/-! ### Layer 1A/1B: Mathlib's carrier, and what is actually known to lie in it

⚠ Mathlib defines `lipschitzGroup Q` as `Subgroup.closure ((↑) ⁻¹' Set.range (ι Q))`, the subgroup
generated by the **invertible vectors**, and its own module docstring records that agreement with
the usual "twisted conjugation preserves `V`" Clifford group is available in one direction only,
the converse being an open TODO. So nothing may be quoted here from the classical theory of the
latter group. Each membership, surjectivity and kernel statement below is against Mathlib's
closure carrier, with the finite-dimensionality, nondegeneracy and positive-dimensionality
hypotheses its proof uses visible in the type. -/

/-- An anisotropic vector as a unit of the Clifford algebra, through Mathlib's
`invertibleιOfInvertible`. These units are exactly the generators of Mathlib's closure. -/
noncomputable def vectorUnit (Q : QuadraticForm K V) {v : V} (hv : Q v ≠ 0) :
    (CliffordAlgebra Q)ˣ :=
  letI : Invertible (Q v) := invertibleOfNonzero hv
  letI := CliffordAlgebra.invertibleιOfInvertible Q v
  unitOfInvertible (CliffordAlgebra.ι Q v)

@[simp]
theorem vectorUnit_val (Q : QuadraticForm K V) {v : V} (hv : Q v ≠ 0) :
    ((vectorUnit Q hv : (CliffordAlgebra Q)ˣ) : CliffordAlgebra Q) = CliffordAlgebra.ι Q v :=
  rfl

/-- **Layer 1B**: an anisotropic vector lies in Mathlib's carrier. This is the one place
`Subgroup.subset_closure` is used, and everything else about the carrier goes through
`mem_lipschitzGroup_iff_exists_list`. -/
theorem vectorUnit_mem_lipschitzGroup (Q : QuadraticForm K V) {v : V} (hv : Q v ≠ 0) :
    vectorUnit Q hv ∈ lipschitzGroup Q :=
  Subgroup.subset_closure ⟨v, rfl⟩

/-- The generating set is already closed under inversion, `(ι v)⁻¹ = ι ((Q v)⁻¹ • v)`. This is why
the closure in Mathlib's definition is the *submonoid* generated by the vector units, and hence
why `mem_lipschitzGroup_iff_exists_list` may be stated with no inverses. -/
theorem vectorUnit_inv (Q : QuadraticForm K V) {v : V} (hv : Q v ≠ 0)
    (hv' : Q ((Q v)⁻¹ • v) ≠ 0) :
    (vectorUnit Q hv)⁻¹ = vectorUnit Q hv' := by
  sorry

/-- **Layer 1B**: a product of anisotropic vectors lies in Mathlib's carrier. -/
theorem product_vectorUnits_mem_lipschitzGroup (Q : QuadraticForm K V)
    (l : List {v : V // Q v ≠ 0}) :
    (l.map fun v => vectorUnit Q v.2).prod ∈ lipschitzGroup Q := by
  sorry

/-- **⚠ Layer 1B, the characterization of Mathlib's carrier.** `lipschitzGroup Q` is exactly the
set of products of anisotropic vectors, with no inverses needed. Every theorem this roadmap proves
about the carrier factors through this one; none is inherited from the "twisted conjugation
preserves `V`" group, which Mathlib does not know to be the same object. -/
theorem mem_lipschitzGroup_iff_exists_list (Q : QuadraticForm K V) (x : (CliffordAlgebra Q)ˣ) :
    x ∈ lipschitzGroup Q ↔
      ∃ l : List {v : V // Q v ≠ 0}, x = (l.map fun v => vectorUnit Q v.2).prod := by
  sorry

/-- **The Clifford norm**, Layer 1A: the **`reverse`** norm `N g = reverse g * g`. The milestone
hidden in the signature is that the value is a scalar. -/
noncomputable def cliffordNorm (Q : QuadraticForm K V) : lipschitzGroup Q →* Kˣ :=
  sorry

/-- **Layer 1A**: the defining equation of `cliffordNorm`, without which the signature above is
satisfied by the trivial homomorphism. -/
theorem cliffordNorm_spec (Q : QuadraticForm K V) (g : lipschitzGroup Q) :
    algebraMap K (CliffordAlgebra Q) (cliffordNorm Q g) =
      CliffordAlgebra.reverse ((g : (CliffordAlgebra Q)ˣ) : CliffordAlgebra Q) *
        ((g : (CliffordAlgebra Q)ˣ) : CliffordAlgebra Q) := by
  sorry

/-- **Layer 1A**: an equality, with no sign ambiguity, from `reverse_ι` and `ι_sq_scalar`. -/
theorem cliffordNorm_vectorUnit (Q : QuadraticForm K V) {v : V} (hv : Q v ≠ 0) :
    ((cliffordNorm Q ⟨vectorUnit Q hv, vectorUnit_mem_lipschitzGroup Q hv⟩ : Kˣ) : K) = Q v := by
  sorry

/-- **Layer 1A**: the other anti-involution, kept separate. Mathlib's `star` is
`reverse ∘ involute`, so its norm takes the value `-Q v` on a vector. ⚠ `[Q v]` and `[-Q v]`
differ by `[-1]`, which is generally nontrivial, so the two conventions disagree on `O(Q)` at odd
reflection length and agree only on `SO(Q)`. -/
theorem starNorm_ι (Q : QuadraticForm K V) (v : V) :
    star (CliffordAlgebra.ι Q v) * CliffordAlgebra.ι Q v
      = algebraMap K (CliffordAlgebra Q) (-Q v) := by
  sorry

/-! ### ⚠ Layer 1A: reconciling the `reverse` norm with Mathlib's `star`-unitary Pin and Spin

Mathlib cuts `pinGroup Q` and `spinGroup Q` out of the algebra with the **`star`**-unitary
condition, `star x * x = 1` for `star = reverse ∘ involute`, while every norm in this roadmap is
the **`reverse`** norm. The two agree on even elements and differ by `(-1)^r` on a product of `r`
vectors, and the square-class codomain does not absorb that: `[Q v]` and `[-Q v]` differ by `[-1]`,
nontrivial over ℚ and over `ℚ_p`. The three declarations below are what license the use of
Mathlib's `spinGroup` in the sequence of 1E; they are explicit statements, not steps inside a
proof. -/

/-- **Layer 1A, comparison (i)**: on even elements the two anti-involutions agree, so the star
norm *is* the `reverse` norm there. This is `involute_eq_of_mem_even` together with `star_def`. -/
theorem star_mul_self_eq_reverse_mul_self_of_mem_even (Q : QuadraticForm K V)
    {x : CliffordAlgebra Q} (hx : x ∈ CliffordAlgebra.even Q) :
    star x * x = CliffordAlgebra.reverse x * x := by
  sorry

/-- **⚠ Layer 1A, comparison (i), sharpened**: on a product of `r` vectors the two norms differ by
`(-1)^r`, so the agreement above is exactly an even-degree phenomenon and not a cosmetic one. -/
theorem star_mul_self_eq_neg_one_pow_reverse_mul_self (Q : QuadraticForm K V)
    (l : List {v : V // Q v ≠ 0}) (x : CliffordAlgebra Q)
    (hx : x = ((l.map fun v => vectorUnit Q v.2).prod : (CliffordAlgebra Q)ˣ)) :
    star x * x = (-1 : K) ^ l.length • (CliffordAlgebra.reverse x * x) := by
  sorry

/-- **⚠ Layer 1A, comparison (ii)**: Mathlib's `spinGroup Q` is exactly the even elements of
Mathlib's Lipschitz carrier whose **`reverse`** norm is one. This is the theorem that lets the
exact sequence of 1E, whose norms are all `reverse` norms, be stated about `spinGroup`. -/
theorem mem_spinGroup_iff_cliffordNorm_eq_one (Q : QuadraticForm K V) (g : lipschitzGroup Q) :
    ((g : (CliffordAlgebra Q)ˣ) : CliffordAlgebra Q) ∈ spinGroup Q ↔
      ((g : (CliffordAlgebra Q)ˣ) : CliffordAlgebra Q) ∈ CliffordAlgebra.even Q ∧
        cliffordNorm Q g = 1 := by
  sorry

/-- The scalar units of the Clifford algebra, before the Lipschitz membership theorem. -/
noncomputable def scalarUnit (Q : QuadraticForm K V) : Kˣ →* (CliffordAlgebra Q)ˣ :=
  Units.map (algebraMap K (CliffordAlgebra Q)).toMonoidHom

/-- **⚠ Layer 1B**: the scalar units lie in Mathlib's closure carrier, and the proof is why the
hypotheses are there. A nondegenerate form on a space of positive dimension over a field of
characteristic not two has an anisotropic `v`, and then `λ = ι (λ • v) · (ι v)⁻¹`, a product of two
generators. Drop either hypothesis and there need be no anisotropic vector at all, which is what
`scalarUnits_injective_finZero_rejected` records at dimension zero. -/
theorem scalarUnits_mem_lipschitzGroup [FiniteDimensional K V] (Q : QuadraticForm K V)
    (hQ : Q.Nondegenerate) (hV : 0 < Module.finrank K V) (lam : Kˣ) :
    scalarUnit Q lam ∈ lipschitzGroup Q := by
  sorry

/-- The scalar units inside the Lipschitz group, Layer 1B. ⚠ Real data, not a `sorry`-bodied
definition: the carrier has to be visible, or `ker_vectorRepresentation_eq_scalarUnits` would be
an equation between two opaque subgroups. -/
noncomputable def scalarUnits [FiniteDimensional K V] (Q : QuadraticForm K V)
    (hQ : Q.Nondegenerate) (hV : 0 < Module.finrank K V) : Kˣ →* lipschitzGroup Q :=
  (scalarUnit Q).codRestrict (lipschitzGroup Q) (scalarUnits_mem_lipschitzGroup Q hQ hV)

@[simp]
theorem scalarUnits_apply [FiniteDimensional K V] (Q : QuadraticForm K V)
    (hQ : Q.Nondegenerate) (hV : 0 < Module.finrank K V) (lam : Kˣ) :
    ((scalarUnits Q hQ hV lam : lipschitzGroup Q) : (CliffordAlgebra Q)ˣ) = scalarUnit Q lam :=
  rfl

theorem scalarUnits_injective [FiniteDimensional K V] (Q : QuadraticForm K V)
    (hQ : Q.Nondegenerate) (hV : 0 < Module.finrank K V) :
    Function.Injective (scalarUnits Q hQ hV) := by
  sorry

/-- **Layer 1A**: the scalar rescaling law `N (λ · g) = λ² · N g`, which is what makes the spinor
norm well defined and what the Spin-lift criterion below runs on. -/
theorem cliffordNorm_scalarUnits_mul [FiniteDimensional K V] (Q : QuadraticForm K V)
    (hQ : Q.Nondegenerate) (hV : 0 < Module.finrank K V) (lam : Kˣ) (g : lipschitzGroup Q) :
    cliffordNorm Q (scalarUnits Q hQ hV lam * g) = lam ^ 2 * cliffordNorm Q g := by
  sorry

/-- **Layer 1C**: the vector representation, by twisted conjugation. -/
noncomputable def vectorRepresentation (Q : QuadraticForm K V) :
    lipschitzGroup Q →* orthogonalGroup Q :=
  sorry

/-- **Layer 1C**: an anisotropic vector acts as the reflection in it, with **no sign**. This is the
twisted-conjugation convention paying for itself, and it is what makes `vectorRepresentation`
surjective by Cartan–Dieudonné. -/
theorem vectorRepresentation_vectorUnit (Q : QuadraticForm K V) {v : V} (hv : Q v ≠ 0) :
    (vectorRepresentation Q ⟨vectorUnit Q hv, vectorUnit_mem_lipschitzGroup Q hv⟩ :
        V ≃ₗ[K] V) = reflection Q hv := by
  sorry

/-- **Layer 1C**: surjectivity onto Mathlib's carrier's image, which is Cartan–Dieudonné together
with `vectorRepresentation_vectorUnit` and `mem_lipschitzGroup_iff_exists_list`. -/
theorem vectorRepresentation_surjective [FiniteDimensional K V] (Q : QuadraticForm K V)
    (hQ : Q.Nondegenerate) : Function.Surjective (vectorRepresentation Q) := by
  sorry

/-- **⚠ Layer 1B, the linchpin**, stated as an equality of subgroups against Mathlib's carrier. The
classical proof computes the centre of `CliffordAlgebra Q` over a **general** field, which is `K`
in even dimension and `K ⊕ K·ω` in odd dimension, while the graded centre is `K` in both parities.
The spin representations roadmap's structure theorem is over an algebraically closed field and does
not supply this. -/
theorem ker_vectorRepresentation_eq_scalarUnits [FiniteDimensional K V] (Q : QuadraticForm K V)
    (hQ : Q.Nondegenerate) (hV : 0 < Module.finrank K V) :
    (vectorRepresentation Q).ker = (scalarUnits Q hQ hV).range := by
  sorry

/-- The excluded edge case: in dimension zero the Lipschitz group collapses, so scalar units
cannot embed. This prevents downstream code from silently dropping the positivity hypothesis. -/
theorem lipschitzGroup_finZero_subsingleton
    (Q : QuadraticForm ℚ (Fin 0 → ℚ)) : Subsingleton (lipschitzGroup Q) := by
  sorry

theorem scalarUnits_injective_finZero_rejected
    (Q : QuadraticForm ℚ (Fin 0 → ℚ)) :
    ¬ ∃ f : ℚˣ →* lipschitzGroup Q, Function.Injective f := by
  sorry

/-- **The spinor norm**, Layer 1D. ⚠ Both hypotheses are carried because the construction uses
both: Cartan–Dieudonné needs finite dimension, and the kernel theorem needs nondegeneracy. -/
noncomputable def spinorNorm [FiniteDimensional K V] (Q : QuadraticForm K V)
    (hQ : Q.Nondegenerate) : orthogonalGroup Q →* (Kˣ ⧸ Subgroup.square Kˣ) :=
  sorry

/-- **Layer 1D**: the value on a single reflection, which with multiplicativity and
Cartan–Dieudonné is the whole computational API the lattice side needs. -/
theorem spinorNorm_reflection [FiniteDimensional K V] (Q : QuadraticForm K V)
    (hQ : Q.Nondegenerate) {v : V} (hv : Q v ≠ 0) (u : Kˣ) (hu : (u : K) = Q v) :
    spinorNorm Q hQ ⟨reflection Q hv, reflection_mem Q hv⟩ =
      QuotientGroup.mk' (Subgroup.square Kˣ) u := by
  sorry

/-- **⚠ Layer 1D/1E, the bridge**: the spinor norm of the isometry induced by a Lipschitz element
is the square class of that element's Clifford norm. This is what the well-definedness argument of
1D produces, and it is the theorem `range_spinToSpecialOrthogonal` runs on. -/
theorem spinorNorm_vectorRepresentation [FiniteDimensional K V] (Q : QuadraticForm K V)
    (hQ : Q.Nondegenerate) (g : lipschitzGroup Q) :
    spinorNorm Q hQ (vectorRepresentation Q g) =
      QuotientGroup.mk' (Subgroup.square Kˣ) (cliffordNorm Q g) := by
  sorry

/-- The canonical general-field `Spin → SO`. ⚠ No theorem below quantifies over a replacement for
it: at the trivial homomorphism the range theorem would be false. -/
noncomputable def spinToSpecialOrthogonal (Q : QuadraticForm K V) :
    spinGroup Q →* specialOrthogonalGroup Q :=
  sorry

/-- **Layer 1E**: and it is the vector representation read on `spinGroup`, which is what ties the
comparison theorems above to the sequence below. -/
theorem spinToSpecialOrthogonal_eq_vectorRepresentation (Q : QuadraticForm K V)
    (x : spinGroup Q) (g : lipschitzGroup Q)
    (hg : (g : (CliffordAlgebra Q)ˣ) = spinGroup.toUnits x) :
    ((spinToSpecialOrthogonal Q x : specialOrthogonalGroup Q) : V ≃ₗ[K] V) =
      ((vectorRepresentation Q g : orthogonalGroup Q) : V ≃ₗ[K] V) := by
  sorry

/-- **⚠ Layer 1E, comparison (iii)**: an even Lipschitz element can be rescaled by a scalar into
Mathlib's `spinGroup` exactly when its Clifford norm is a square, that is exactly when the spinor
norm of the isometry it induces is trivial. Together with `mem_spinGroup_iff_cliffordNorm_eq_one`
and `spinorNorm_vectorRepresentation` this is the whole of `im (Spin) = ker θ`; it is stated rather
than left inside the proof of `range_spinToSpecialOrthogonal`. -/
theorem exists_scalarUnits_mul_mem_spinGroup_iff [FiniteDimensional K V] (Q : QuadraticForm K V)
    (hQ : Q.Nondegenerate) (hV : 0 < Module.finrank K V) (g : lipschitzGroup Q)
    (hg : ((g : (CliffordAlgebra Q)ˣ) : CliffordAlgebra Q) ∈ CliffordAlgebra.even Q) :
    (∃ lam : Kˣ, (((scalarUnits Q hQ hV lam * g : lipschitzGroup Q) :
          (CliffordAlgebra Q)ˣ) : CliffordAlgebra Q) ∈ spinGroup Q) ↔
      spinorNorm Q hQ (vectorRepresentation Q g) = 1 := by
  sorry

/-- The central `μ₂` inside `Spin`. -/
noncomputable def muTwoToSpin (Q : QuadraticForm K V) : (rootsOfUnity 2 K) →* spinGroup Q :=
  sorry

/-- **Layer 1E**: the kernel is `μ₂` in **positive** dimension. Dimension zero is separate, where
the kernel is trivial rather than of order two. -/
theorem ker_spinToSpecialOrthogonal [FiniteDimensional K V] (Q : QuadraticForm K V)
    (hQ : Q.Nondegenerate) (hV : 0 < Module.finrank K V) :
    (spinToSpecialOrthogonal Q).ker = (muTwoToSpin Q).range := by
  sorry

/-- **Layer 1E**: the image is the **spinor kernel**, that is the kernel of the spinor norm
restricted along the inclusion of `SO` into `O`. ⚠ The spinor norm need not be surjective, so this
is not a short exact sequence and is never written as one. -/
theorem range_spinToSpecialOrthogonal [FiniteDimensional K V] (Q : QuadraticForm K V)
    (hQ : Q.Nondegenerate) (hV : 0 < Module.finrank K V) :
    (spinToSpecialOrthogonal Q).range =
      ((spinorNorm Q hQ).comp (specialOrthogonalToOrthogonal Q)).ker := by
  sorry

/-! ### Layer 1F: the low-rank identifications, against a named carrier

⚠ `Spin(Q) ≅ Sp(C₀, σ)` names nothing until `Sp(C₀, σ)` is a declaration. The carrier is supplied
here, as the unitary group of the even Clifford algebra for the canonical involution `σ = reverse`:
that is `U(C₀, σ)`, and in dimension five, where `σ` is symplectic on a central simple algebra of
degree four, it *is* `Sp(C₀, σ)`. Dimension six is the one case this roadmap does not own; see
`exists_spinGroup_ne_evenUnitaryGroup_finrank_six`. -/

/-- **Layer 1F, the carrier**: `U(C₀, σ)`, the group of units of the Clifford algebra that are
even and satisfy `σ(x) x = 1` for the canonical involution `σ = reverse`. On even elements
`star = reverse` (`star_mul_self_eq_reverse_mul_self_of_mem_even`), so this is Mathlib's `unitary`
condition read inside `C₀`, and it is a subgroup of the units of the ambient algebra rather than a
submonoid of it, which is the type `lipschitzGroup` already uses. -/
def evenUnitaryGroup (Q : QuadraticForm K V) : Subgroup (CliffordAlgebra Q)ˣ where
  carrier := {x | ((x : (CliffordAlgebra Q)ˣ) : CliffordAlgebra Q) ∈ CliffordAlgebra.even Q ∧
    CliffordAlgebra.reverse ((x : (CliffordAlgebra Q)ˣ) : CliffordAlgebra Q) *
      ((x : (CliffordAlgebra Q)ˣ) : CliffordAlgebra Q) = 1}
  mul_mem' := by sorry
  one_mem' := by sorry
  inv_mem' := by sorry

theorem mem_evenUnitaryGroup_iff (Q : QuadraticForm K V) (x : (CliffordAlgebra Q)ˣ) :
    x ∈ evenUnitaryGroup Q ↔
      ((x : (CliffordAlgebra Q)ˣ) : CliffordAlgebra Q) ∈ CliffordAlgebra.even Q ∧
        CliffordAlgebra.reverse ((x : (CliffordAlgebra Q)ˣ) : CliffordAlgebra Q) *
          ((x : (CliffordAlgebra Q)ˣ) : CliffordAlgebra Q) = 1 :=
  Iff.rfl

/-- **Layer 1F**: Mathlib's `spinGroup` is its Lipschitz carrier intersected with `U(C₀, σ)`. This
is `spinGroup`'s definition read through `star_mul_self_eq_reverse_mul_self_of_mem_even`, and it is
the statement every low-rank identification is a difference from. -/
theorem range_spinGroup_toUnits (Q : QuadraticForm K V) :
    (spinGroup.toUnits (Q := Q)).range = lipschitzGroup Q ⊓ evenUnitaryGroup Q := by
  sorry

/-- **Layer 1F**: functoriality of the carrier along an isometry of quadratic spaces, through
`CliffordAlgebra.equivOfIsometry`, the only declaration turning an isometry of forms into an
isomorphism of Clifford algebras. -/
theorem map_evenUnitaryGroup_equivOfIsometry {V' : Type v} [AddCommGroup V'] [Module K V']
    (Q : QuadraticForm K V) (Q' : QuadraticForm K V') (e : Q.IsometryEquiv Q') :
    (evenUnitaryGroup Q).map
        (Units.mapEquiv
          (CliffordAlgebra.equivOfIsometry e).toRingEquiv.toMulEquiv).toMonoidHom =
      evenUnitaryGroup Q' := by
  sorry

/-- **⚠ Layer 1F, dimensions at most five**: `U(C₀, σ)` is contained in Mathlib's Lipschitz
carrier, so `Spin(Q)` is *equal* to `U(C₀, σ)` there. This one statement carries all four low-rank
identifications over a general field, including the twisted forms:

* dimension three, `C₀` a quaternion algebra with its conjugation, `U(C₀, σ)` its norm-one group;
* dimension four, `C₀` a quaternion algebra over the discriminant quadratic étale algebra `E`, and
  `U(C₀, σ)` the restriction of scalars from `E` to `K` of its norm-one group — one
  `K`-almost-simple group when `E` is a field, two `K`-rank-one factors when `E ≅ K × K`;
* dimension five, `C₀` central simple of degree four with `σ` symplectic, so `U(C₀, σ)` is
  `Sp(C₀, σ)`, which is `Sp₄` exactly when `C₀` splits. -/
theorem evenUnitaryGroup_le_lipschitzGroup [FiniteDimensional K V] (Q : QuadraticForm K V)
    (hQ : Q.Nondegenerate) (hV0 : 0 < Module.finrank K V) (hV : Module.finrank K V ≤ 5) :
    evenUnitaryGroup Q ≤ lipschitzGroup Q := by
  sorry

/-- **⚠ Layer 1F, the rejection test at dimension zero.** The positive-dimension hypothesis above is
not decoration. In dimension zero there is no anisotropic vector, so Mathlib's closure carrier is
trivial (`lipschitzGroup_finZero_subsingleton`), while `evenUnitaryGroup Q` is `μ₂(K)`, which is not
trivial whenever `-1 ≠ 1`. So `Spin(Q) = U(C₀, σ)` fails there, in the direction one would not
guess: the unitary group is too big, not too small. -/
theorem exists_not_evenUnitaryGroup_le_lipschitzGroup_finZero :
    ∃ Q : QuadraticForm ℚ (Fin 0 → ℚ), ¬ evenUnitaryGroup Q ≤ lipschitzGroup Q := by
  sorry

/-- **⚠ Layer 1F, the rejection test at dimension six.** The previous theorem is sharp: at
dimension six `σ = reverse` acts on the centre `E` of `C₀` by `ω ↦ -ω`, so it is an involution of
the *second* kind, `U(C₀, σ)` is a unitary group of degree four, and `Spin(Q)` is its
reduced-norm-one subgroup `SU(C₀, σ)` — strictly smaller. A witness is a split rational form of
dimension six, where `U(C₀, σ) ≅ GL₄(ℚ)` and `Spin(Q) ≅ SL₄(ℚ)`.

⚠ The reduced norm of a degree-four central simple algebra exists in neither Mathlib nor any Tau
Ceti roadmap, so `SU(C₀, σ)` has no carrier, and the dimension-six identification is **not** a
milestone here: it belongs to `AlgebrasWithInvolution`, together with the reduced norm, the
symplectic/unitary classification of involutions, and the groups `Sp(A, σ)` and `SU(A, σ)` of a
central simple algebra with involution. -/
theorem exists_spinGroup_ne_evenUnitaryGroup_finrank_six :
    ∃ Q : QuadraticForm ℚ (Fin 6 → ℚ), Q.Nondegenerate ∧
      (spinGroup.toUnits (Q := Q)).range ≠ evenUnitaryGroup Q := by
  sorry

end Layer1

/-! ## Layer 2: the local topology, and the transvections

⚠ The topology is Mathlib's `moduleTopology`, not a private basis transport, and it is declared
**once, as an instance**, so that the orthogonal group, the special orthogonal group, every compact
open subgroup of either, and the restricted products of Layer 3 all carry the same topology with
nothing to relate. A topology carried as data would leave the topology a subgroup is proved compact
open in unconnected to the topology its restricted product is formed with.

⚠ `IsModuleTopology` is necessary and **not sufficient**. Each statement below also carries the
separation, the local compactness or the openness of the squares that its proof uses, because with
`K` indiscrete — a topological field whose finite-dimensional spaces do carry the module topology —
both the closedness of the isometry set (take `Q x = x²`, where the set is `{±1}`) and the openness
of `ker θ` (take `Q x = a x²` with `a` a nonsquare, where the kernel is trivial and proper) are
false. Omitting them would not weaken these theorems, it would make them wrong.
-/

section PointGroupTopology

variable {K : Type u} [Field K] {V : Type v} [AddCommGroup V] [Module K V]
variable [TopologicalSpace (Module.End K V)]

/-- **Layer 2B**: the canonical topology on the point group, induced by `f ↦ (f, f⁻¹)`. ⚠ An
instance, not a definition to be quoted: every `Subgroup (V ≃ₗ[K] V)` then carries the subspace
topology from this one declaration, and so does every restricted product built from such subgroups
in Layer 3. -/
instance pointGroupTopology : TopologicalSpace (V ≃ₗ[K] V) :=
  TopologicalSpace.induced
    (fun f : V ≃ₗ[K] V => ((f : Module.End K V), (f.symm : Module.End K V))) inferInstance

/-- **Layer 2B**: it makes `V ≃ₗ[K] V` a topological group, hence every subgroup of it too. ⚠ The
hypotheses are the ones the proof uses: `Module.End K V` is a topological ring by
`IsModuleTopology.isTopologicalRing`, which needs the module topology and finite dimension, and
inversion is continuous because the topology was induced by a map recording `f⁻¹`. -/
instance isTopologicalGroup_pointGroup [TopologicalSpace K] [IsTopologicalRing K]
    [IsModuleTopology K (Module.End K V)] [FiniteDimensional K V] :
    IsTopologicalGroup (V ≃ₗ[K] V) :=
  sorry

end PointGroupTopology

section Layer2

variable {K : Type u} [Field K] [Invertible (2 : K)] [TopologicalSpace K] [IsTopologicalRing K]
variable {V : Type v} [AddCommGroup V] [Module K V]
variable [TopologicalSpace V] [IsModuleTopology K V]
variable [TopologicalSpace (Module.End K V)] [IsModuleTopology K (Module.End K V)]

/-- **⚠ Layer 2B**: the isometry set is closed in `Module.End K V` for the module topology. Stated
about `End` rather than about `V ≃ₗ[K] V`, since the latter is not a module and so has no module
topology of its own. `T2Space K` is load-bearing and not decoration: the set is an intersection of
equalizers of continuous maps into `K`, which are closed only when `{0}` is, and with `K`
indiscrete and `Q x = x²` the set is `{±1}` in an indiscrete space. -/
theorem isClosed_isometrySet [T2Space K] [FiniteDimensional K V] (Q : QuadraticForm K V) :
    IsClosed {f : Module.End K V | ∀ x, Q (f x) = Q x} := by
  sorry

/-- **Layer 2B**: and the orthogonal group is closed in the point group. -/
theorem isClosed_orthogonalGroup [T2Space K] [FiniteDimensional K V] (Q : QuadraticForm K V) :
    IsClosed (orthogonalGroup Q : Set (V ≃ₗ[K] V)) := by
  sorry

/-- **Layer 2B**: `SO` is closed in `V ≃ₗ[K] V`, which is what makes `U_p^O ∩ SO(V_p)` compact in
Layer 3C, and open in `O(Q)` because the determinant is continuous with image in the discrete
`μ₂`. -/
theorem isClosed_specialOrthogonalGroup [T2Space K] [FiniteDimensional K V]
    (Q : QuadraticForm K V) :
    IsClosed (specialOrthogonalGroup Q : Set (V ≃ₗ[K] V)) := by
  sorry

/-- **Layer 2B**: local compactness, from closedness inside a finite-dimensional space over a
locally compact field. -/
theorem locallyCompactSpace_orthogonalGroup [T2Space K] [LocallyCompactSpace K]
    [FiniteDimensional K V] (Q : QuadraticForm K V) :
    LocallyCompactSpace (orthogonalGroup Q) := by
  sorry

/-- **⚠ Layer 2E**: discreteness of the square-class group makes a *continuous* map into it
locally constant; it does not make an arbitrary map continuous. The content is that the kernel is
**open**, obtained by factoring through the continuous Clifford norm and the open quotient map.
⚠ `hsq` is the local-field input and cannot be dropped: it is LocalFieldsRamification's
`U(K, 2e+1) ⊆ (Kˣ)²`, it does not follow from the module topology, and without it the statement is
false at `K` indiscrete with `Q x = a x²` for a nonsquare `a`. -/
theorem isOpen_ker_spinorNorm [T2Space K] [FiniteDimensional K V] (Q : QuadraticForm K V)
    (hQ : Q.Nondegenerate) (hsq : IsOpen ((Subgroup.square Kˣ : Subgroup Kˣ) : Set Kˣ)) :
    IsOpen ((spinorNorm Q hQ).ker : Set (orthogonalGroup Q)) := by
  sorry

end Layer2

/-! ## Layers 2F and 2G: the local spinor-norm image, by field, dimension and signature

⚠ The table splits three ways and the split is mathematical, not presentational.

* Over a nonarchimedean local field the image on `SO` is everything from dimension three on, and
  in dimension two it is the image of the norm group of the discriminant algebra, of index two.
* Over ℝ an **indefinite** form gives everything and a **definite** one gives the **trivial**
  subgroup, because every value of a positive definite form is a positive real and hence a square,
  and every value of a negative definite form lies in the single class `[-1]`, so on `SO`, where
  reflections come in pairs, the classes cancel.
* On `O` the two definite cases differ from each other: positive definite gives the trivial image
  and negative definite gives all of `ℝˣ/(ℝˣ)²`.

A single "dimension at least three implies surjective" statement would therefore be **false** at
the real place, and a statement that a definite real form has image all square classes is false
twice over. -/

section LocalSpinorNormTable

variable {K : Type u} [Field K] [Invertible (2 : K)]
variable {W : Type v} [AddCommGroup W] [Module K W] [FiniteDimensional K W]

/-- **Layer 2F, dimension zero**, over any field: both groups are trivial and the image is
trivial. Stated because no later statement may silently assume positive dimension. -/
theorem spinorNorm_range_orthogonal_finrank_zero (Q : QuadraticForm K W) (hQ : Q.Nondegenerate)
    (hW : Module.finrank K W = 0) : (spinorNorm Q hQ).range = ⊥ := by
  sorry

/-- **Layer 2F, dimension one**, over any field: `O(Q) = {±1}` and the image is generated by the
class of the single value `Q v`. ⚠ The scalar has to be carried: at `Q x = x²` the class is trivial
and the instance tests nothing, while at `Q x = a x²` with `a` a nonsquare it is not. -/
theorem spinorNorm_range_orthogonal_finrank_one (Q : QuadraticForm K W) (hQ : Q.Nondegenerate)
    (hW : Module.finrank K W = 1) {v : W} (hv : v ≠ 0) (a : Kˣ) (ha : (a : K) = Q v) :
    (spinorNorm Q hQ).range =
      Subgroup.closure {QuotientGroup.mk' (Subgroup.square Kˣ) a} := by
  sorry

/-- **⚠ Layer 2F, the `O` column from the `SO` column**, over any field. In positive dimension
`O(Q)` is `SO(Q)` together with any one reflection, so the image of `θ` on `O` is its image on `SO`
joined with the class of `Q v`. Every `θ(O)` entry of the local table is this lemma applied to the
corresponding `θ(SO)` entry, which is why the two columns can differ only by a factor of two — and
why a positive definite and a negative definite real form, which agree on `SO`, disagree on `O`. -/
theorem spinorNorm_range_orthogonal_eq_sup (Q : QuadraticForm K W) (hQ : Q.Nondegenerate)
    {v : W} (hv : Q v ≠ 0) (a : Kˣ) (ha : (a : K) = Q v) :
    (spinorNorm Q hQ).range =
      ((spinorNorm Q hQ).comp (specialOrthogonalToOrthogonal Q)).range ⊔
        Subgroup.closure {QuotientGroup.mk' (Subgroup.square Kˣ) a} := by
  sorry

/-- **Layer 2F, dimension one**, on `SO`: trivial, since `SO(Q)` itself is. -/
theorem spinorNorm_range_specialOrthogonal_finrank_one (Q : QuadraticForm K W)
    (hQ : Q.Nondegenerate) (hW : Module.finrank K W = 1) :
    ((spinorNorm Q hQ).comp (specialOrthogonalToOrthogonal Q)).range = ⊥ := by
  sorry

end LocalSpinorNormTable

section NonarchimedeanSpinorNorm

variable {p : ℕ} [Fact p.Prime]
variable {W : Type v} [AddCommGroup W] [Module ℚ_[p] W] [FiniteDimensional ℚ_[p] W]

/-- **Layer 2F, nonarchimedean, dimension at least three**: the spinor norm is onto the square
classes on `SO`. This is O'Meara 55:6, and it is the statement a spinor-genus computation quotes.
⚠ It holds at `p = 2` as well as at odd `p`; the dyadic square-class count is larger but the
surjectivity is not affected. -/
theorem spinorNorm_range_specialOrthogonal_padic (Q : QuadraticForm ℚ_[p] W)
    (hQ : Q.Nondegenerate) (hW : 3 ≤ Module.finrank ℚ_[p] W) :
    ((spinorNorm Q hQ).comp (specialOrthogonalToOrthogonal Q)).range = ⊤ := by
  sorry

/-- **Layer 2F, nonarchimedean, dimension two, isotropic**: the hyperbolic plane, where `SO(Q)` is
the diagonal torus and `θ` is the square class of its parameter, so the image is everything. -/
theorem spinorNorm_range_specialOrthogonal_padic_finrank_two_isotropic
    (Q : QuadraticForm ℚ_[p] W) (hQ : Q.Nondegenerate) (hW : Module.finrank ℚ_[p] W = 2)
    (hiso : ∃ v : W, v ≠ 0 ∧ Q v = 0) :
    ((spinorNorm Q hQ).comp (specialOrthogonalToOrthogonal Q)).range = ⊤ := by
  sorry

/-- **⚠ Layer 2F, nonarchimedean, dimension two, anisotropic**: the image is the image of the norm
group of the discriminant quadratic field extension, which has index exactly two in the square
classes. So `θ` is **not** onto in dimension two, and the dimension hypothesis of
`spinorNorm_range_specialOrthogonal_padic` is load-bearing rather than decoration. -/
theorem index_spinorNorm_range_specialOrthogonal_padic_finrank_two_anisotropic
    (Q : QuadraticForm ℚ_[p] W) (hQ : Q.Nondegenerate) (hW : Module.finrank ℚ_[p] W = 2)
    (haniso : Q.Anisotropic) :
    (((spinorNorm Q hQ).comp (specialOrthogonalToOrthogonal Q)).range).index = 2 := by
  sorry

/-- **⚠ Layer 2F**: and the corresponding image on `O` is **not** all square classes either. It is
the previous subgroup joined with the class of any value of `Q`, by
`spinorNorm_range_orthogonal_eq_sup`, and for `Q = N_{E/ℚ_p}` that value is `1`, so the two images
coincide and both have index two. A table row reading "all square classes" for `O` in dimension two
would be false. -/
theorem index_spinorNorm_range_orthogonal_padic_finrank_two_anisotropic_norm
    (Q : QuadraticForm ℚ_[p] W) (hQ : Q.Nondegenerate) (hW : Module.finrank ℚ_[p] W = 2)
    (haniso : Q.Anisotropic) (hrep : ∃ v : W, Q v = 1) :
    ((spinorNorm Q hQ).range).index = 2 := by
  sorry

/-- **Layer 2F**: the local spinor kernel, the image of `Spin(V_p) → SO(V_p)`, is the kernel of the
restricted spinor norm in every dimension — this is `range_spinToSpecialOrthogonal` localized — and
from dimension three on its index is the number of square classes, `4` for odd `p` and `8` at
`p = 2` by the LocalFieldsRamification counts. -/
theorem index_range_spinToSpecialOrthogonal_padic (Q : QuadraticForm ℚ_[p] W)
    (hQ : Q.Nondegenerate) (hW : 3 ≤ Module.finrank ℚ_[p] W) :
    (spinToSpecialOrthogonal Q).range.index
      = Nat.card (ℚ_[p]ˣ ⧸ Subgroup.square ℚ_[p]ˣ) := by
  sorry

end NonarchimedeanSpinorNorm

section RealSpinorNorm

variable {W : Type v} [AddCommGroup W] [Module ℝ W] [FiniteDimensional ℝ W]

/-- **Layer 2G, real, indefinite**: the image on `SO` is all of `ℝˣ/(ℝˣ)²`, from the product of a
reflection in a vector of positive norm and one in a vector of negative norm. -/
theorem spinorNorm_range_specialOrthogonal_real_indefinite (Q : QuadraticForm ℝ W)
    (hQ : Q.Nondegenerate) (hpos : ∃ v : W, 0 < Q v) (hneg : ∃ w : W, Q w < 0) :
    ((spinorNorm Q hQ).comp (specialOrthogonalToOrthogonal Q)).range = ⊤ := by
  sorry

/-- **⚠ Layer 2G, real, definite**: the image on `SO` is **trivial**, in either sign. For a
positive definite form every value is a positive real, hence a square; for a negative definite form
every value lies in the class `[-1]`, and a proper isometry is a product of an even number of
reflections, so the classes cancel. -/
theorem spinorNorm_range_specialOrthogonal_real_posDef (Q : QuadraticForm ℝ W)
    (hQ : Q.Nondegenerate) (hdef : Q.PosDef) :
    ((spinorNorm Q hQ).comp (specialOrthogonalToOrthogonal Q)).range = ⊥ := by
  sorry

theorem spinorNorm_range_specialOrthogonal_real_negDef (Q : QuadraticForm ℝ W)
    (hQ : Q.Nondegenerate) (hdef : (-Q).PosDef) :
    ((spinorNorm Q hQ).comp (specialOrthogonalToOrthogonal Q)).range = ⊥ := by
  sorry

/-- **⚠ Layer 2G, real, positive definite, on `O`**: still **trivial**, not all square classes.
Every reflection norm is positive and hence a square, so the whole orthogonal group has trivial
spinor norm. This is the case a "the image is all square classes" statement gets wrong. -/
theorem spinorNorm_range_orthogonal_real_posDef (Q : QuadraticForm ℝ W) (hQ : Q.Nondegenerate)
    (hdef : Q.PosDef) : (spinorNorm Q hQ).range = ⊥ := by
  sorry

/-- **⚠ Layer 2G, real, negative definite, on `O`**: all of `ℝˣ/(ℝˣ)²`, generated by `[-1]`, so the
two definite cases genuinely differ on `O` while agreeing on `SO`. The positive-dimension
hypothesis is what supplies a reflection at all. -/
theorem spinorNorm_range_orthogonal_real_negDef (Q : QuadraticForm ℝ W) (hQ : Q.Nondegenerate)
    (hdef : (-Q).PosDef) (hW : 0 < Module.finrank ℝ W) : (spinorNorm Q hQ).range = ⊤ := by
  sorry

end RealSpinorNorm

section Transvections

variable {K : Type u} [Field K] [Invertible (2 : K)]
variable {V : Type v} [AddCommGroup V] [Module K V]

/-- **Layer 2C**: the Eichler transvection attached to an isotropic `u` and an orthogonal `w`. -/
noncomputable def transvection (Q : QuadraticForm K V) {u w : V} (hu : Q u = 0)
    (huw : polar Q u w = 0) : V ≃ₗ[K] V :=
  sorry

theorem transvection_apply (Q : QuadraticForm K V) {u w : V} (hu : Q u = 0)
    (huw : polar Q u w = 0) (x : V) :
    transvection Q hu huw x
      = x + polar Q x u • w - polar Q x w • u - (Q w * polar Q x u) • u := by
  sorry

theorem transvection_mem (Q : QuadraticForm K V) {u w : V} (hu : Q u = 0)
    (huw : polar Q u w = 0) : transvection Q hu huw ∈ orthogonalGroup Q := by
  sorry

/-- **Layer 2C**: the spinor norm of a transvection is trivial, which is why the transvections lie
in the spinor kernel and lift to `Spin` at all. -/
theorem spinorNorm_transvection [FiniteDimensional K V] (Q : QuadraticForm K V)
    (hQ : Q.Nondegenerate) {u w : V} (hu : Q u = 0) (huw : polar Q u w = 0) :
    spinorNorm Q hQ ⟨transvection Q hu huw, transvection_mem Q hu huw⟩ = 1 := by
  sorry

/-- **Layer 2C**: only the class of `w` modulo `K u` matters. -/
theorem transvection_add_smul (Q : QuadraticForm K V) {u w : V} (hu : Q u = 0)
    (huw : polar Q u w = 0) (c : K) (h' : polar Q u (w + c • u) = 0) :
    transvection Q hu h' = transvection Q hu huw := by
  sorry

/-- **Layer 2C**: the conjugation law. -/
theorem transvection_conj (Q : QuadraticForm K V) {u w : V} (hu : Q u = 0)
    (huw : polar Q u w = 0) (g : orthogonalGroup Q) (hu' : Q (g.1 u) = 0)
    (huw' : polar Q (g.1 u) (g.1 w) = 0) :
    (g : V ≃ₗ[K] V) * transvection Q hu huw * (g : V ≃ₗ[K] V)⁻¹
      = transvection Q hu' huw' := by
  sorry

/-- **Layer 2C**: the canonical Clifford lift of a single transvection. -/
noncomputable def transvectionLift (Q : QuadraticForm K V) {u w : V} (hu : Q u = 0)
    (huw : polar Q u w = 0) : spinGroup Q :=
  sorry

theorem spinToSpecialOrthogonal_transvectionLift (Q : QuadraticForm K V) {u w : V} (hu : Q u = 0)
    (huw : polar Q u w = 0) :
    ((spinToSpecialOrthogonal Q (transvectionLift Q hu huw) : V ≃ₗ[K] V))
      = transvection Q hu huw := by
  sorry

/-- **Layer 2C**: additivity in `w`, which is what upgrades a family of lifts to a subgroup. -/
theorem transvectionLift_add (Q : QuadraticForm K V) {u w w' : V} (hu : Q u = 0)
    (huw : polar Q u w = 0) (huw' : polar Q u w' = 0) (hsum : polar Q u (w + w') = 0) :
    transvectionLift Q hu hsum = transvectionLift Q hu huw * transvectionLift Q hu huw' := by
  sorry

/-- **⚠ Layer 2C, the milestone**: the lift bundled as a **homomorphism** out of `u^⊥ / K u`, not
a family of individually chosen lifts. `OrthogonalTamagawaAndLatticeMass` has no root
subgroup to generate with until this exists, and `transvection_add_smul` together with
`transvectionLift_add` is what makes it well defined. -/
noncomputable def transvectionLiftHom (Q : QuadraticForm K V) {u : V} (hu : Q u = 0) :
    (LinearMap.ker (polarBilin Q u) ⧸
        Submodule.comap (LinearMap.ker (polarBilin Q u)).subtype (K ∙ u)) →+
      Additive (spinGroup Q) :=
  sorry

/-- **Layer 2C**: and it agrees with the element-level lift. -/
theorem transvectionLiftHom_apply (Q : QuadraticForm K V) {u w : V} (hu : Q u = 0)
    (huw : polar Q u w = 0) :
    Additive.toMul (transvectionLiftHom Q hu (Submodule.Quotient.mk ⟨w, by sorry⟩))
      = transvectionLift Q hu huw := by
  sorry

end Transvections

/-! ## Layer 3: orthogonal adelic points

The generic restricted-product API is imported from `RestrictedProducts`. This roadmap keeps
only the quadratic-form localization maps, orthogonal compatibility data, the three specialized
adelic point groups, and the adelic spinor norm.
-/

/-! ## Layers 3C to 3F: the specialized adelic objects

⚠ Everything below is built **from `Q`**, and for **all three groups**. A future
strong-approximation application needs adelic `Spin`, and its transported statement needs the adelic
spinor kernel inside `SO`; constructing only `O(V)(𝔸_f)` would supply neither. An `O`-statement
carrying the name of a `Spin` theorem would be false: a rational reflection of nonsquare spinor
norm lies in the diagonal image and not in the spinor kernel.

Conventions, matching the README's Layer 3D. Finite places are indexed by `Nat.Primes`; the
archimedean place is carried by a product decomposition rather than by a dependent type of places,
so `G(𝔸) = G(ℝ) × G(𝔸_f)` is a definition; and `G(𝔸^S)` for a set of places containing `∞` is the
restricted product over the finite places outside `S`, so at `S = {∞}` it is `G(𝔸_f)` on the nose.

⚠ The local topologies are **instances**, fixed as Mathlib's `moduleTopology`, not typeclass
parameters a caller may choose. That is what makes the compact-open hypotheses of
`OrthogonalCompactOpens` say something about the restricted products below, and what stops
`discreteTopology_fullAdelicDiagonal` from being refuted by an indiscrete choice.
-/

section Adelic

open scoped RestrictedProduct TensorProduct

instance factPrimeOfPrimes (p : Nat.Primes) : Fact (Nat.Prime (p : ℕ)) := ⟨p.2⟩

variable {V : Type v} [AddCommGroup V] [Module ℚ V] [FiniteDimensional ℚ V]

/-- The local quadratic space at a finite place. -/
noncomputable abbrev localForm (Q : QuadraticForm ℚ V) (p : Nat.Primes) :
    QuadraticForm ℚ_[(p : ℕ)] (ℚ_[(p : ℕ)] ⊗[ℚ] V) :=
  Q.baseChange ℚ_[(p : ℕ)]

/-- The local quadratic space at the real place. -/
noncomputable abbrev realForm (Q : QuadraticForm ℚ V) : QuadraticForm ℝ (ℝ ⊗[ℚ] V) :=
  Q.baseChange ℝ

/-- **⚠ Layer 2A, as an instance**: the canonical local topology at a finite place, Mathlib's
module topology on the endomorphism algebra. Everything downstream — the local point groups, their
compact open subgroups, and the restricted products of 3D — inherits from this one declaration. -/
noncomputable instance localEndTopology (p : Nat.Primes) :
    TopologicalSpace (Module.End ℚ_[(p : ℕ)] (ℚ_[(p : ℕ)] ⊗[ℚ] V)) :=
  moduleTopology ℚ_[(p : ℕ)] _

instance isModuleTopology_localEnd (p : Nat.Primes) :
    IsModuleTopology ℚ_[(p : ℕ)] (Module.End ℚ_[(p : ℕ)] (ℚ_[(p : ℕ)] ⊗[ℚ] V)) :=
  ⟨rfl⟩

/-- The same at the real place. -/
noncomputable instance realEndTopology : TopologicalSpace (Module.End ℝ (ℝ ⊗[ℚ] V)) :=
  moduleTopology ℝ _

instance isModuleTopology_realEnd : IsModuleTopology ℝ (Module.End ℝ (ℝ ⊗[ℚ] V)) :=
  ⟨rfl⟩

/-- And on the Clifford algebra, which is what topologizes the local spin group. -/
noncomputable instance localCliffordTopology (Q : QuadraticForm ℚ V) (p : Nat.Primes) :
    TopologicalSpace (CliffordAlgebra (localForm Q p)) :=
  moduleTopology ℚ_[(p : ℕ)] _

noncomputable instance realCliffordTopology (Q : QuadraticForm ℚ V) :
    TopologicalSpace (CliffordAlgebra (realForm Q)) :=
  moduleTopology ℝ _

/-- **Layer 2B**: the local spin group is a topological group in that topology. Stated as an
instance for the same reason as `pointGroupTopology`: the restricted product of 3D must not be
formed with a topology unrelated to the one 3C's compactness is proved in. -/
instance isTopologicalGroup_localSpin (Q : QuadraticForm ℚ V) (p : Nat.Primes) :
    IsTopologicalGroup (spinGroup (localForm Q p)) :=
  sorry

instance isTopologicalGroup_realSpin (Q : QuadraticForm ℚ V) :
    IsTopologicalGroup (spinGroup (realForm Q)) :=
  sorry

/-- **Layer 0B**: base change of a nondegenerate form along a field extension is nondegenerate,
which is what lets the local spinor norms of 2F and 3F be formed at every place. -/
theorem nondegenerate_localForm {Q : QuadraticForm ℚ V} (hQ : Q.Nondegenerate) (p : Nat.Primes) :
    (localForm Q p).Nondegenerate :=
  sorry

theorem nondegenerate_realForm {Q : QuadraticForm ℚ V} (hQ : Q.Nondegenerate) :
    (realForm Q).Nondegenerate :=
  sorry

/-! ### Layer 0B, localized: the base-change maps for all three groups -/

noncomputable def orthogonalBaseChange (Q : QuadraticForm ℚ V) (p : Nat.Primes) :
    orthogonalGroup Q →* orthogonalGroup (localForm Q p) :=
  sorry

noncomputable def specialOrthogonalBaseChange (Q : QuadraticForm ℚ V) (p : Nat.Primes) :
    specialOrthogonalGroup Q →* specialOrthogonalGroup (localForm Q p) :=
  sorry

noncomputable def spinBaseChange (Q : QuadraticForm ℚ V) (p : Nat.Primes) :
    spinGroup Q →* spinGroup (localForm Q p) :=
  sorry

noncomputable def orthogonalBaseChangeReal (Q : QuadraticForm ℚ V) :
    orthogonalGroup Q →* orthogonalGroup (realForm Q) :=
  sorry

noncomputable def specialOrthogonalBaseChangeReal (Q : QuadraticForm ℚ V) :
    specialOrthogonalGroup Q →* specialOrthogonalGroup (realForm Q) :=
  sorry

noncomputable def spinBaseChangeReal (Q : QuadraticForm ℚ V) :
    spinGroup Q →* spinGroup (realForm Q) :=
  sorry

/-! ### Layer 3E, the standard integral family, as data

⚠ `OrthogonalCompactOpens` carries `eventually_mem_orth` as a hypothesis, which is right for a
consumer that brings its own lattice stabilizers. But the roadmap's own objects must rest on
something, so one family is built here and its hypothesis discharged: the isometries whose matrix
and inverse matrix in a chosen basis have `p`-adically integral entries, which is the stabilizer of
the `ℤ`-span of that basis, written as data rather than left `sorry`-bodied. -/

/-- The base-changed basis at `p`, against which integrality of a local isometry is measured. -/
noncomputable def localBasis {n : ℕ} (b : Module.Basis (Fin n) ℚ V) (p : Nat.Primes) :
    Module.Basis (Fin n) ℚ_[(p : ℕ)] (ℚ_[(p : ℕ)] ⊗[ℚ] V) :=
  Algebra.TensorProduct.basis _ b

/-- **Layer 3E**: the stabilizer of the `ℤ`-span of `b` at `p`, cut out by integrality of the
matrix entries of an isometry **and of its inverse**; one condition alone gives a submonoid and not
a subgroup. -/
def integralOrthogonalSubgroup {n : ℕ} (Q : QuadraticForm ℚ V) (b : Module.Basis (Fin n) ℚ V)
    (p : Nat.Primes) : Subgroup (orthogonalGroup (localForm Q p)) where
  carrier := {g | ∀ i j : Fin n,
    ‖LinearMap.toMatrix (localBasis b p) (localBasis b p)
      ((g : (ℚ_[(p : ℕ)] ⊗[ℚ] V) ≃ₗ[ℚ_[(p : ℕ)]] (ℚ_[(p : ℕ)] ⊗[ℚ] V)) :
        (ℚ_[(p : ℕ)] ⊗[ℚ] V) →ₗ[ℚ_[(p : ℕ)]] (ℚ_[(p : ℕ)] ⊗[ℚ] V)) i j‖ ≤ 1 ∧
    ‖LinearMap.toMatrix (localBasis b p) (localBasis b p)
      (((g : (ℚ_[(p : ℕ)] ⊗[ℚ] V) ≃ₗ[ℚ_[(p : ℕ)]] (ℚ_[(p : ℕ)] ⊗[ℚ] V)).symm) :
        (ℚ_[(p : ℕ)] ⊗[ℚ] V) →ₗ[ℚ_[(p : ℕ)]] (ℚ_[(p : ℕ)] ⊗[ℚ] V)) i j‖ ≤ 1}
  mul_mem' := by sorry
  one_mem' := by sorry
  inv_mem' := by sorry

theorem isOpen_integralOrthogonalSubgroup {n : ℕ} (Q : QuadraticForm ℚ V)
    (b : Module.Basis (Fin n) ℚ V) (p : Nat.Primes) :
    IsOpen (integralOrthogonalSubgroup Q b p :
      Set (orthogonalGroup (localForm Q p))) := by
  sorry

theorem isCompact_integralOrthogonalSubgroup {n : ℕ} (Q : QuadraticForm ℚ V)
    (b : Module.Basis (Fin n) ℚ V) (p : Nat.Primes) :
    IsCompact (integralOrthogonalSubgroup Q b p :
      Set (orthogonalGroup (localForm Q p))) := by
  sorry

/-- **⚠ Layer 3E, the absolute integrality theorem**: every rational isometry is integral at almost
every prime, by clearing denominators in its matrix and in the matrix of its inverse. This is
`OrthogonalCompactOpens.eventually_mem_orth` **discharged** rather than assumed, and it is what
makes the diagonal of 3E exist for a family this roadmap builds itself. -/
theorem eventually_mem_integralOrthogonalSubgroup {n : ℕ} (Q : QuadraticForm ℚ V)
    (b : Module.Basis (Fin n) ℚ V) (g : orthogonalGroup Q) :
    ∀ᶠ p in Filter.cofinite,
      orthogonalBaseChange Q p g ∈ integralOrthogonalSubgroup Q b p := by
  sorry

/-! ### Layer 3C, the square-class codomain: discreteness, openness, and the unramified value -/

/-- **Layer 2E/3C**: the local square-class group is **discrete**. This is
`LocalFieldsRamification.isOpen_range_powMonoidHom` at `n = 2`, read on `Subgroup.square` through
that roadmap's `square_eq_range_powMonoidHom`, and then `QuotientGroup.discreteTopology`. It is
also what makes the local spinor norm's kernel open in 2E. -/
theorem discreteTopology_localSquareClasses (p : Nat.Primes) :
    DiscreteTopology (ℚ_[(p : ℕ)]ˣ ⧸ Subgroup.square ℚ_[(p : ℕ)]ˣ) := by
  sorry

/-- **Layer 3C**: the **unit square classes** at `p`, the image of `ℤ_pˣ` in `ℚ_pˣ/(ℚ_pˣ)²`. This
is the subgroup the reference images equal at almost every prime for an integral family, and it is
named so that the identification below is a statement about a declaration rather than about a
description. -/
noncomputable def unitSquareClasses (p : Nat.Primes) :
    Subgroup (ℚ_[(p : ℕ)]ˣ ⧸ Subgroup.square ℚ_[(p : ℕ)]ˣ) :=
  ((Units.map (PadicInt.Coe.ringHom (p := (p : ℕ))).toMonoidHom).range).map
    (QuotientGroup.mk' (Subgroup.square ℚ_[(p : ℕ)]ˣ))

/-- **Layer 3C**: at odd `p` the unit classes are a proper nontrivial subgroup, of index two in a
group of order four. This is what makes the identification below say something. -/
theorem unitSquareClasses_index (p : Nat.Primes) (hp : (p : ℕ) ≠ 2) :
    (unitSquareClasses p).index = 2 := by
  sorry


/-- **⚠ Layer 3C**: the compatible compact-open data. A single family `U p ≤ O(V_p)` does not
determine the reference subgroups for `SO`, for `Spin`, or for the square-class codomain, so the
parameter is a tuple carrying its compatibility hypotheses.

⚠ It stores **no topology**. Openness and compactness below are against the instances above, which
are the same ones the restricted products of 3D are formed with; a `TopologicalSpace` field would
leave the compact-open hypotheses unrelated to the adelic groups they are supposed to be about, and
every theorem stated against them would be vacuous. -/
structure OrthogonalCompactOpens (Q : QuadraticForm ℚ V) where
  /-- The compact open subgroup of the local orthogonal group. -/
  orth : Π p : Nat.Primes, Subgroup (orthogonalGroup (localForm Q p))
  /-- ⚠ The `Spin` datum is supplied, not obtained as a preimage: a preimage of a compact set under
  `Spin → SO` is compact only once properness is known (2D). -/
  spin : Π p : Nat.Primes, Subgroup (spinGroup (localForm Q p))
  isOpen_orth : ∀ p, IsOpen (orth p : Set (orthogonalGroup (localForm Q p)))
  isCompact_orth : ∀ p, IsCompact (orth p : Set (orthogonalGroup (localForm Q p)))
  isOpen_spin : ∀ p, IsOpen (spin p : Set (spinGroup (localForm Q p)))
  isCompact_spin : ∀ p, IsCompact (spin p : Set (spinGroup (localForm Q p)))
  /-- ⚠ The compatibility, stated through `SO` and not merely into `O`: the spin datum lands in
  `U_p^{SO} = U_p^O ∩ SO(V_p)`, which is `OrthogonalCompactOpens.soPart` below and is what the
  adelic map `Spin(V)(𝔸_f) → SO(V)(𝔸_f)` of 3D is built from. -/
  spin_maps : ∀ p, ∀ g ∈ spin p,
    (specialOrthogonalToOrthogonal (localForm Q p)) (spinToSpecialOrthogonal (localForm Q p) g)
      ∈ orth p
  /-- Every rational isometry is integral at almost every place, which is what makes the orthogonal
  diagonal of 3E well defined. -/
  eventually_mem_orth : ∀ g : orthogonalGroup Q,
    ∀ᶠ p in Filter.cofinite, orthogonalBaseChange Q p g ∈ orth p
  /-- ⚠ And the same for rational spin points, which the previous hypothesis does not give and
  which the spin diagonal of 3E needs. -/
  eventually_mem_spin : ∀ g : spinGroup Q,
    ∀ᶠ p in Filter.cofinite, spinBaseChange Q p g ∈ spin p

namespace OrthogonalCompactOpens

variable {Q : QuadraticForm ℚ V}

/-- **Layer 3C**: the third member of the tuple, **derived** rather than supplied:
`U_p^{SO} = U_p^O ∩ SO(V_p)`. -/
noncomputable def soPart (U : OrthogonalCompactOpens Q) (p : Nat.Primes) :
    Subgroup (specialOrthogonalGroup (localForm Q p)) :=
  (U.orth p).comap (specialOrthogonalToOrthogonal (localForm Q p))

omit [FiniteDimensional ℚ V] in
theorem mem_soPart (U : OrthogonalCompactOpens Q) (p : Nat.Primes)
    (g : specialOrthogonalGroup (localForm Q p)) :
    g ∈ U.soPart p ↔ (specialOrthogonalToOrthogonal (localForm Q p)) g ∈ U.orth p :=
  Iff.rfl

/-- **Layer 3C**: open, from openness of `U_p^O` and continuity of the inclusion. -/
theorem isOpen_soPart (U : OrthogonalCompactOpens Q) (p : Nat.Primes) :
    IsOpen (U.soPart p : Set (specialOrthogonalGroup (localForm Q p))) :=
  sorry

/-- **Layer 3C**: compact, from compactness of `U_p^O` and closedness of `SO(V_p)` in `O(V_p)`. -/
theorem isCompact_soPart (U : OrthogonalCompactOpens Q) (p : Nat.Primes) :
    IsCompact (U.soPart p : Set (specialOrthogonalGroup (localForm Q p))) :=
  sorry

omit [FiniteDimensional ℚ V] in
/-- **Layer 3C**: and the spin datum maps into the chosen `SO` subgroup, not merely into the `O`
one. This is `spin_maps` read through `mem_soPart`. -/
theorem spin_mapsTo_soPart (U : OrthogonalCompactOpens Q) (p : Nat.Primes) :
    ∀ g ∈ U.spin p, spinToSpecialOrthogonal (localForm Q p) g ∈ U.soPart p :=
  U.spin_maps p

/-- **Layer 3C**: the integrality hypothesis for `SO` is derived, not assumed: a rational proper
isometry lying in `U_p^O` lies in `U_p^O ∩ SO(V_p)`. -/
theorem eventually_mem_soPart (U : OrthogonalCompactOpens Q) (g : specialOrthogonalGroup Q) :
    ∀ᶠ p in Filter.cofinite, specialOrthogonalBaseChange Q p g ∈ U.soPart p :=
  sorry

/-- **Layer 3C**: the reference subgroup `θ_p(U_p^{SO})` in the local square-class group, defined
as the image of the derived `U_p^{SO}` and not as a further parameter. ⚠ Without it there is no
such thing as "the restricted product of the local square-class groups". -/
noncomputable def localSpinorNormImage (hQ : Q.Nondegenerate) (U : OrthogonalCompactOpens Q)
    (p : Nat.Primes) : Subgroup (ℚ_[(p : ℕ)]ˣ ⧸ Subgroup.square ℚ_[(p : ℕ)]ˣ) :=
  (U.soPart p).map
    ((spinorNorm (localForm Q p) (nondegenerate_localForm hQ p)).comp
      (specialOrthogonalToOrthogonal (localForm Q p)))

/-- **⚠ Layer 3C**: the reference subgroups of the codomain restricted product are **open**.
Continuity of the local spinor norm does not give this: the image of a compact open subgroup under
a continuous homomorphism is compact but need not be open, and no general theorem makes it so. It
is proved instead from `discreteTopology_localSquareClasses`, in which *every* subgroup is open, so
the openness input is the openness of `(ℚ_pˣ)²` and nothing about `U`. -/
theorem isOpen_localSpinorNormImage (hQ : Q.Nondegenerate) (U : OrthogonalCompactOpens Q)
    (p : Nat.Primes) :
    IsOpen (U.localSpinorNormImage hQ p :
      Set (ℚ_[(p : ℕ)]ˣ ⧸ Subgroup.square ℚ_[(p : ℕ)]ˣ)) := by
  sorry

/-- **⚠ Layer 3C, the reference images at almost every prime**, for the standard integral family of
a basis and a form of dimension at least three: the reference image is exactly the unit square
classes off a finite set of primes — those at which the `ℤ`-span of `b` fails to be unimodular,
together with `2`. This is the computation `IntegralLattices` quotes when it reads `θ_p(K_p⁺(L))`
off Jordan data.

⚠ The hypothesis `hU` is not removable, and the theorem is **false** for a general compatible
tuple. In dimension one `SO(V_p)` is trivial, so every reference image is trivial and never the
unit classes: `exists_localSpinorNormImage_ne_unitSquareClasses` witnesses that. Nor is either
inclusion automatic in higher dimension, since a compact open subgroup may contain a product of two
reflections whose norms differ by a uniformizer. -/
theorem eventually_localSpinorNormImage_eq_unitSquareClasses {n : ℕ} (hQ : Q.Nondegenerate)
    (b : Module.Basis (Fin n) ℚ V) (U : OrthogonalCompactOpens Q)
    (hU : ∀ p, U.orth p = integralOrthogonalSubgroup Q b p)
    (hdim : 3 ≤ Module.finrank ℚ V) :
    ∀ᶠ p in Filter.cofinite, U.localSpinorNormImage hQ p = unitSquareClasses p := by
  sorry

end OrthogonalCompactOpens

end Adelic

/-- **⚠ Layer 3C, the rejection test** for
`OrthogonalCompactOpens.eventually_localSpinorNormImage_eq_unitSquareClasses`: its hypotheses are
not removable. In dimension one `SO(V_p)` is trivial at every prime, so every compatible tuple has
trivial reference images, while `unitSquareClasses p` has index two at every odd prime. Openness is
what holds for an arbitrary tuple; the *value* of the reference image is a theorem about the
family, and it is the integral family of `integralOrthogonalSubgroup` that supplies it. -/
theorem exists_localSpinorNormImage_ne_unitSquareClasses :
    ∃ (Q : QuadraticForm ℚ (Fin 1 → ℚ)) (hQ : Q.Nondegenerate) (U : OrthogonalCompactOpens Q),
      ∀ p : Nat.Primes, (p : ℕ) ≠ 2 → U.localSpinorNormImage hQ p ≠ unitSquareClasses p := by
  sorry

/-! ## Layers 3D to 3F: the three adelic point groups and spinor norm -/

section AdelicSpecialization

open scoped RestrictedProduct TensorProduct

variable {V : Type v} [AddCommGroup V] [Module ℚ V] [FiniteDimensional ℚ V]
variable (Q : QuadraticForm ℚ V)

/-! ### Layer 3D: finite adelic points -/

/-- **Layer 3D**: the finite adelic orthogonal group. -/
abbrev finiteAdelicOrthogonal (U : OrthogonalCompactOpens Q) : Type _ :=
  RestrictedProducts.RestrictedProductGroup (fun p : Nat.Primes => U.orth p)

/-- **Layer 3D**: the finite adelic special orthogonal group, relative to the derived `U_p^{SO}`.
This is the group in which `OrthogonalTamagawaAndLatticeMass` will formulate the
spinor-kernel consequence. -/
abbrev finiteAdelicSpecialOrthogonal (U : OrthogonalCompactOpens Q) : Type _ :=
  RestrictedProducts.RestrictedProductGroup (fun p : Nat.Primes => U.soPart p)

/-- **Layer 3D**: the finite adelic spin group needed by `OrthogonalTamagawaAndLatticeMass`. -/
abbrev finiteAdelicSpin (U : OrthogonalCompactOpens Q) : Type _ :=
  RestrictedProducts.RestrictedProductGroup (fun p : Nat.Primes => U.spin p)

/-! ### Layer 3D: points away from `S` -/

/-- **Layer 3D**: points away from a set `S` of places containing `∞`, which is the supplier's
index-generic `RestrictedProductGroupAway` at the finite places outside `S`. At `S = {∞}`, that is
`S ∩ Nat.Primes = ∅`, this is the finite adelic group up to the supplier's own reindexing and no
separate carrier is introduced. -/
abbrev orthogonalAway (U : OrthogonalCompactOpens Q) (S : Set Nat.Primes) : Type _ :=
  RestrictedProducts.RestrictedProductGroupAway S (fun p : Nat.Primes => U.orth p)

abbrev specialOrthogonalAway (U : OrthogonalCompactOpens Q) (S : Set Nat.Primes) : Type _ :=
  RestrictedProducts.RestrictedProductGroupAway S (fun p : Nat.Primes => U.soPart p)

abbrev spinAway (U : OrthogonalCompactOpens Q) (S : Set Nat.Primes) : Type _ :=
  RestrictedProducts.RestrictedProductGroupAway S (fun p : Nat.Primes => U.spin p)

/-- **Layer 3D**: the restriction map to the places away from `S`, for each of the three groups.
These are the supplier's `restrictAway` and are not rebuilt; they are named here so that a
consumer can cite the orthogonal instance. -/
noncomputable def restrictAwayOrthogonal (U : OrthogonalCompactOpens Q) (S : Set Nat.Primes) :
    finiteAdelicOrthogonal Q U →* orthogonalAway Q U S :=
  RestrictedProducts.restrictAway S (fun p : Nat.Primes => U.orth p)

noncomputable def restrictAwaySpecialOrthogonal (U : OrthogonalCompactOpens Q)
    (S : Set Nat.Primes) :
    finiteAdelicSpecialOrthogonal Q U →* specialOrthogonalAway Q U S :=
  RestrictedProducts.restrictAway S (fun p : Nat.Primes => U.soPart p)

noncomputable def restrictAwaySpin (U : OrthogonalCompactOpens Q) (S : Set Nat.Primes) :
    finiteAdelicSpin Q U →* spinAway Q U S :=
  RestrictedProducts.restrictAway S (fun p : Nat.Primes => U.spin p)

theorem restrictAwaySpin_apply (U : OrthogonalCompactOpens Q) (S : Set Nat.Primes)
    (x : finiteAdelicSpin Q U) (p : {p : Nat.Primes // p ∉ S}) :
    restrictAwaySpin Q U S x p = x p.1 := rfl

/-! ### Layer 3D: full adelic points, and the componentwise maps -/

abbrev fullAdelicOrthogonal (U : OrthogonalCompactOpens Q) : Type _ :=
  RestrictedProducts.RestrictedProductGroupWithFactor (orthogonalGroup (realForm Q))
    (fun p : Nat.Primes => U.orth p)

abbrev fullAdelicSpecialOrthogonal (U : OrthogonalCompactOpens Q) : Type _ :=
  RestrictedProducts.RestrictedProductGroupWithFactor (specialOrthogonalGroup (realForm Q))
    (fun p : Nat.Primes => U.soPart p)

abbrev fullAdelicSpin (U : OrthogonalCompactOpens Q) : Type _ :=
  RestrictedProducts.RestrictedProductGroupWithFactor (spinGroup (realForm Q))
    (fun p : Nat.Primes => U.spin p)

/-- **Layer 3D**: the componentwise `Spin → SO`, from 3B's functoriality and 3C's compatibility.
A future density theorem transports along this map; without 3C's `spin_maps` it does not exist. -/
noncomputable def finiteAdelicSpinToSpecialOrthogonal (U : OrthogonalCompactOpens Q) :
    finiteAdelicSpin Q U →* finiteAdelicSpecialOrthogonal Q U :=
  RestrictedProducts.restrictedProductMapOfForall (fun p => U.spin p) (fun p => U.soPart p)
    (fun p => spinToSpecialOrthogonal (localForm Q p)) U.spin_mapsTo_soPart

theorem finiteAdelicSpinToSpecialOrthogonal_apply (U : OrthogonalCompactOpens Q)
    (x : finiteAdelicSpin Q U) (p : Nat.Primes) :
    finiteAdelicSpinToSpecialOrthogonal Q U x p = spinToSpecialOrthogonal (localForm Q p) (x p) :=
  RestrictedProducts.restrictedProductMapOfForall_apply _ _ _ _ x p

/-- **Layer 3D**: the componentwise `SO → O`, whose compact-open compatibility is `mem_soPart`. -/
noncomputable def finiteAdelicSpecialOrthogonalToOrthogonal (U : OrthogonalCompactOpens Q) :
    finiteAdelicSpecialOrthogonal Q U →* finiteAdelicOrthogonal Q U :=
  RestrictedProducts.restrictedProductMapOfForall (fun p => U.soPart p) (fun p => U.orth p)
    (fun p => specialOrthogonalToOrthogonal (localForm Q p)) (fun _ _ hg => hg)

theorem finiteAdelicSpecialOrthogonalToOrthogonal_apply (U : OrthogonalCompactOpens Q)
    (x : finiteAdelicSpecialOrthogonal Q U) (p : Nat.Primes) :
    finiteAdelicSpecialOrthogonalToOrthogonal Q U x p =
      specialOrthogonalToOrthogonal (localForm Q p) (x p) :=
  RestrictedProducts.restrictedProductMapOfForall_apply _ _ _ _ x p

/-! ### Layer 3E: the diagonal maps, one for each group -/

/-- **Layer 3E**: the diagonal embedding of the rational orthogonal points, whose defining
hypothesis is `OrthogonalCompactOpens.eventually_mem_orth`. -/
noncomputable def adelicDiagonalOrthogonal (U : OrthogonalCompactOpens Q) :
    orthogonalGroup Q →* finiteAdelicOrthogonal Q U :=
  RestrictedProducts.rationalDiagonal (fun p => orthogonalBaseChange Q p)
    (fun p => U.orth p) U.eventually_mem_orth

/-- **Layer 3E**: the diagonal embedding of the rational **proper** isometries, whose hypothesis is
derived from the orthogonal one. -/
noncomputable def adelicDiagonalSpecialOrthogonal (U : OrthogonalCompactOpens Q) :
    specialOrthogonalGroup Q →* finiteAdelicSpecialOrthogonal Q U :=
  RestrictedProducts.rationalDiagonal (fun p => specialOrthogonalBaseChange Q p)
    (fun p => U.soPart p) U.eventually_mem_soPart

/-- **⚠ Layer 3E**: the diagonal embedding of the rational **spin** points. This is the map a
`OrthogonalTamagawaAndLatticeMass` needs, and it is not obtainable from the orthogonal one. -/
noncomputable def adelicDiagonalSpin (U : OrthogonalCompactOpens Q) :
    spinGroup Q →* finiteAdelicSpin Q U :=
  RestrictedProducts.rationalDiagonal (fun p => spinBaseChange Q p)
    (fun p => U.spin p) U.eventually_mem_spin

theorem adelicDiagonalSpin_apply (U : OrthogonalCompactOpens Q) (g : spinGroup Q)
    (p : Nat.Primes) : adelicDiagonalSpin Q U g p = spinBaseChange Q p g := by
  sorry

/-- **Layer 3E**: the square relating the two routes from rational spin points into adelic `SO`
commutes, which lets `OrthogonalTamagawaAndLatticeMass` speak of "the image of the rational spin
points" unambiguously. -/
theorem finiteAdelicSpinToSpecialOrthogonal_comp_adelicDiagonalSpin
    (U : OrthogonalCompactOpens Q) :
    (finiteAdelicSpinToSpecialOrthogonal Q U).comp (adelicDiagonalSpin Q U) =
      (adelicDiagonalSpecialOrthogonal Q U).comp (spinToSpecialOrthogonal Q) := by
  sorry

/-- **⚠ Layer 3E**: the rational points are discrete in the **full** adelic group. Stated for the
actual orthogonal group of `Q`, with the canonical local topologies of the instances above: the
generic form, over an arbitrary group with arbitrary topological-group instances, is false, since
indiscrete instances refute it. -/
theorem discreteTopology_fullAdelicDiagonal (U : OrthogonalCompactOpens Q) (hQ : Q.Nondegenerate) :
    DiscreteTopology
      (MonoidHom.range
        ((orthogonalBaseChangeReal Q).prod (adelicDiagonalOrthogonal Q U))) := by
  sorry

/-- **⚠ Layer 3E**, the contrast, and the acceptance test for it: the rational points are **not**
discrete in the finite adelic group, for an isotropic `Q` of dimension at least three. The
transvections `E_{u,tw}` with `t` highly divisible accumulate at the identity. -/
theorem not_discreteTopology_finiteAdelicDiagonal (U : OrthogonalCompactOpens Q)
    (hQ : Q.Nondegenerate) (hdim : 3 ≤ Module.finrank ℚ V)
    (hiso : ∃ v : V, v ≠ 0 ∧ Q v = 0) :
    ¬ DiscreteTopology (MonoidHom.range (adelicDiagonalSpecialOrthogonal Q U)) := by
  sorry

/-! ### Layer 3F: the adelic spinor norm, on adelic `SO` -/

/-- **Layer 3F**: the adelic spinor norm. ⚠ Its domain is adelic **`SO`**, not adelic `O`: the
reference subgroups are the images of the `U_p^{SO}`, and an improper element of `U_p^O` need not
have local spinor norm inside `θ_p(U_p^{SO})`, so a map out of adelic `O` would not land here. -/
noncomputable def adelicSpinorNorm (hQ : Q.Nondegenerate) (U : OrthogonalCompactOpens Q) :
    finiteAdelicSpecialOrthogonal Q U →*
      RestrictedProducts.RestrictedProductGroup
        (fun p : Nat.Primes => U.localSpinorNormImage hQ p) :=
  sorry

/-- **⚠ Layer 3F**: the evaluation rule, which is part of the milestone and not a convenience
lemma. Without it the signature above is satisfied by the trivial homomorphism, and every theorem
about `adelicSpinorKernel` would be a theorem about the whole group. -/
theorem adelicSpinorNorm_apply (hQ : Q.Nondegenerate) (U : OrthogonalCompactOpens Q)
    (x : finiteAdelicSpecialOrthogonal Q U) (p : Nat.Primes) :
    adelicSpinorNorm Q hQ U x p =
      spinorNorm (localForm Q p) (nondegenerate_localForm hQ p)
        (specialOrthogonalToOrthogonal (localForm Q p) (x p)) := by
  sorry

/-- **Layer 3F**: the adelic spinor kernel, a subgroup of adelic `SO` and the target of a future
transported strong-approximation theorem. -/
noncomputable def adelicSpinorKernel (hQ : Q.Nondegenerate) (U : OrthogonalCompactOpens Q) :
    Subgroup (finiteAdelicSpecialOrthogonal Q U) :=
  (adelicSpinorNorm Q hQ U).ker

end AdelicSpecialization

end TauCetiRoadmap.OrthogonalSpinGroups
