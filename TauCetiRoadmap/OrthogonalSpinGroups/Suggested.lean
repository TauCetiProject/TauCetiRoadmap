import Mathlib
import TauCetiRoadmap.AdelicAlgebraicGroups.Suggested
import TauCetiRoadmap.ClassFieldTheory.Suggested
import TauCetiRoadmap.GlobalQuadraticForms.Suggested
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
and the orthogonal applications of approximation and Tamagawa theory. Generic restricted-product
maps, adelic-point carriers, rational diagonals, strong approximation, and Tamagawa measures are
imported from `AdelicAlgebraicGroups`; global Hasse--Minkowski is imported from
`GlobalQuadraticForms`; local quadratic invariants, Hilbert reciprocity, and local-field power
classes come from their final supplier namespaces. No supplier carrier is restated below.

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
adelic constructors.

The general strong-approximation and Tamagawa-measure declarations remain README-level contracts
in `AdelicAlgebraicGroups` until Reductive Groups exposes the required functor-of-points carrier.
This file therefore pins only the orthogonal specializations whose types are already expressible;
it does not replace either generic contract by a `Prop`-valued stand-in.
-/

namespace TauCetiRoadmap.OrthogonalSpinGroups

open QuadraticMap

universe u v w

/-! ## Exact supplier-name checks

These are deliberately closed references to the imported final namespaces. Supplier renames or a
reintroduced local replacement therefore fail visibly at this consumer. -/

#check AdelicAlgebraicGroups.integralSubgroup
#check AdelicAlgebraicGroups.restrictedProductMap
#check AdelicAlgebraicGroups.restrictedProductCongr
#check AdelicAlgebraicGroups.rationalDiagonal
#check AdelicAlgebraicGroups.FiniteAdelicPoints
#check AdelicAlgebraicGroups.AdelicPoints
#check ClassFieldTheory.hilbertProductFormula
#check GlobalQuadraticForms.hasseMinkowski_equivalent
#check GlobalQuadraticForms.equivalent_of_locallyEquivalent
#check QuadraticFormInvariants.hilbertSymbol
#check QuadraticFormInvariants.localHasse
#check QuadraticFormInvariants.hasseInvariant_eq_localHasse
#check LocalFieldsRamification.unitFiltration_le_range_powMonoidHom_two

/-- Closed form of the global Hasse-principle contract used in Layer 5H. The translation from
equivalence of forms to the pointed-set statement for `SO` remains orthogonal-specific work. -/
example {V W : Type} [AddCommGroup V] [Module ℚ V] [FiniteDimensional ℚ V]
    [AddCommGroup W] [Module ℚ W] [FiniteDimensional ℚ W]
    (Q : QuadraticForm ℚ V) (hQ : Q.Nondegenerate)
    (R : QuadraticForm ℚ W) (hR : R.Nondegenerate)
    (h : GlobalQuadraticForms.LocallyEquivalent Q R) :
    Q.Equivalent R :=
  GlobalQuadraticForms.equivalent_of_locallyEquivalent Q hQ R hR h

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

/-- **The Clifford norm**, Layer 1A: the **`reverse`** norm `N g = reverse g * g`. The milestone
hidden in the signature is that the value is a scalar. -/
noncomputable def cliffordNorm (Q : QuadraticForm K V) : lipschitzGroup Q →* Kˣ :=
  sorry

/-- **Layer 1A**: an equality, with no sign ambiguity, from `reverse_ι` and `ι_sq_scalar`. -/
theorem cliffordNorm_ι (Q : QuadraticForm K V) {v : V} (hv : Q v ≠ 0) (g : lipschitzGroup Q)
    (hg : ((g : (CliffordAlgebra Q)ˣ) : CliffordAlgebra Q) = CliffordAlgebra.ι Q v) :
    ((cliffordNorm Q g : Kˣ) : K) = Q v := by
  sorry

/-- **Layer 1A**: the other anti-involution, kept separate. Mathlib's `star` is
`reverse ∘ involute`, so its norm takes the value `-Q v` on a vector. ⚠ `[Q v]` and `[-Q v]`
differ by `[-1]`, which is generally nontrivial, so the two conventions disagree on `O(Q)` at odd
reflection length and agree only on `SO(Q)`. -/
theorem starNorm_ι (Q : QuadraticForm K V) (v : V) :
    star (CliffordAlgebra.ι Q v) * CliffordAlgebra.ι Q v
      = algebraMap K (CliffordAlgebra Q) (-Q v) := by
  sorry

/-- The scalar units inside the Lipschitz group, Layer 1B. Defined as a homomorphism so that the
kernel theorem below is an equality of subgroups rather than an existential inside the algebra. -/
noncomputable def scalarUnits (Q : QuadraticForm K V) : Kˣ →* lipschitzGroup Q :=
  sorry

theorem scalarUnits_injective (Q : QuadraticForm K V) :
    Function.Injective (scalarUnits Q) := by
  sorry

/-- **Layer 1C**: the vector representation, by twisted conjugation. -/
noncomputable def vectorRepresentation (Q : QuadraticForm K V) :
    lipschitzGroup Q →* orthogonalGroup Q :=
  sorry

/-- **Layer 1C**: surjectivity, which is Cartan–Dieudonné together with the fact that an
anisotropic vector acts as the reflection in it. -/
theorem vectorRepresentation_surjective [FiniteDimensional K V] (Q : QuadraticForm K V)
    (hQ : Q.Nondegenerate) : Function.Surjective (vectorRepresentation Q) := by
  sorry

/-- **⚠ Layer 1B, the linchpin**, stated as an equality of subgroups. The classical proof computes
the centre of `CliffordAlgebra Q` over a **general** field, which is `K` in even dimension and
`K ⊕ K·ω` in odd dimension, while the graded centre is `K` in both parities. The spin
representations roadmap's structure theorem is over an algebraically closed field and does not
supply this. -/
theorem ker_vectorRepresentation [FiniteDimensional K V] (Q : QuadraticForm K V)
    (hQ : Q.Nondegenerate) :
    (vectorRepresentation Q).ker = (scalarUnits Q).range := by
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

/-- The canonical general-field `Spin → SO`. ⚠ No theorem below quantifies over a replacement for
it: at the trivial homomorphism the range theorem would be false. -/
noncomputable def spinToSpecialOrthogonal (Q : QuadraticForm K V) :
    spinGroup Q →* specialOrthogonalGroup Q :=
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
a family of individually chosen lifts. Layer 4 has no root subgroup to generate with until this
exists, and `transvection_add_smul` together with `transvectionLift_add` is what makes it well
defined. -/
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

The generic restricted-product API is imported from `AdelicAlgebraicGroups`. This roadmap keeps
only the quadratic-form localization maps, orthogonal compatibility data, the three specialized
adelic point groups, and the adelic spinor norm.
-/

/-! ## Layers 3C to 4: the specialized adelic objects

⚠ Everything below is built **from `Q`**, and for **all three groups**. A development that
constructs only `O(V)(𝔸_f)` has nothing to state Layer 4 in: strong approximation is a theorem
about `Spin`, and its transported form is a theorem about the adelic spinor kernel inside `SO`. An
`O`-statement carrying the name of a `Spin` theorem is not that theorem, and over adelic `O` the
closure statement of 4F is outright false, since a rational reflection of nonsquare spinor norm
lies in the diagonal image and not in the kernel.

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

end OrthogonalCompactOpens

end Adelic

/-! ## Layers 3D to 4F: the three adelic point groups, and strong approximation -/

section StrongApproximation

open scoped RestrictedProduct TensorProduct

variable {V : Type v} [AddCommGroup V] [Module ℚ V] [FiniteDimensional ℚ V]
variable (Q : QuadraticForm ℚ V)

/-- The finite places outside `S`. Over ℚ, `G(𝔸^S)` for a set of places `S` containing `∞` is the
restricted product over these; at `S = {∞}` the subtype is everything and the object is the finite
adelic group. -/
abbrev PrimesAway (S : Set Nat.Primes) : Type := {p : Nat.Primes // p ∉ S}

/-! ### Layer 3D: finite adelic points -/

/-- **Layer 3D**: the finite adelic orthogonal group. -/
abbrev finiteAdelicOrthogonal (U : OrthogonalCompactOpens Q) : Type _ :=
  AdelicAlgebraicGroups.FiniteAdelicPoints (fun p : Nat.Primes => U.orth p)

/-- **Layer 3D**: the finite adelic special orthogonal group, relative to the derived `U_p^{SO}`.
This is the group Layer 4F's closure theorem and Layer 5's volumes live in. -/
abbrev finiteAdelicSpecialOrthogonal (U : OrthogonalCompactOpens Q) : Type _ :=
  AdelicAlgebraicGroups.FiniteAdelicPoints (fun p : Nat.Primes => U.soPart p)

/-- **Layer 3D**: the finite adelic spin group, which is where strong approximation is stated. -/
abbrev finiteAdelicSpin (U : OrthogonalCompactOpens Q) : Type _ :=
  AdelicAlgebraicGroups.FiniteAdelicPoints (fun p : Nat.Primes => U.spin p)

/-! ### Layer 3D: points away from `S` -/

abbrev orthogonalAway (U : OrthogonalCompactOpens Q) (S : Set Nat.Primes) : Type _ :=
  AdelicAlgebraicGroups.FiniteAdelicPoints (fun p : PrimesAway S => U.orth p.1)

abbrev specialOrthogonalAway (U : OrthogonalCompactOpens Q) (S : Set Nat.Primes) : Type _ :=
  AdelicAlgebraicGroups.FiniteAdelicPoints (fun p : PrimesAway S => U.soPart p.1)

abbrev spinAway (U : OrthogonalCompactOpens Q) (S : Set Nat.Primes) : Type _ :=
  AdelicAlgebraicGroups.FiniteAdelicPoints (fun p : PrimesAway S => U.spin p.1)

/-- **Layer 3D**: the restriction map to the places away from `S`, for each of the three groups. -/
noncomputable def restrictAwayOrthogonal (U : OrthogonalCompactOpens Q) (S : Set Nat.Primes) :
    finiteAdelicOrthogonal Q U →* orthogonalAway Q U S :=
  sorry

noncomputable def restrictAwaySpecialOrthogonal (U : OrthogonalCompactOpens Q)
    (S : Set Nat.Primes) :
    finiteAdelicSpecialOrthogonal Q U →* specialOrthogonalAway Q U S :=
  sorry

noncomputable def restrictAwaySpin (U : OrthogonalCompactOpens Q) (S : Set Nat.Primes) :
    finiteAdelicSpin Q U →* spinAway Q U S :=
  sorry

theorem restrictAwaySpin_apply (U : OrthogonalCompactOpens Q) (S : Set Nat.Primes)
    (x : finiteAdelicSpin Q U) (p : PrimesAway S) :
    restrictAwaySpin Q U S x p = x p.1 := by
  sorry

/-! ### Layer 3D: full adelic points, and the componentwise maps -/

abbrev fullAdelicOrthogonal (U : OrthogonalCompactOpens Q) : Type _ :=
  AdelicAlgebraicGroups.AdelicPoints (orthogonalGroup (realForm Q))
    (fun p : Nat.Primes => U.orth p)

abbrev fullAdelicSpecialOrthogonal (U : OrthogonalCompactOpens Q) : Type _ :=
  AdelicAlgebraicGroups.AdelicPoints (specialOrthogonalGroup (realForm Q))
    (fun p : Nat.Primes => U.soPart p)

abbrev fullAdelicSpin (U : OrthogonalCompactOpens Q) : Type _ :=
  AdelicAlgebraicGroups.AdelicPoints (spinGroup (realForm Q))
    (fun p : Nat.Primes => U.spin p)

/-- **Layer 3D**: the componentwise `Spin → SO`, from 3B's functoriality and 3C's compatibility.
⚠ This is the map Layer 4F transports along; without 3C's `spin_maps` it does not exist. -/
noncomputable def finiteAdelicSpinToSpecialOrthogonal (U : OrthogonalCompactOpens Q) :
    finiteAdelicSpin Q U →* finiteAdelicSpecialOrthogonal Q U :=
  AdelicAlgebraicGroups.restrictedProductMap (fun p => U.spin p) (fun p => U.soPart p)
    (fun p => spinToSpecialOrthogonal (localForm Q p)) U.spin_mapsTo_soPart

theorem finiteAdelicSpinToSpecialOrthogonal_apply (U : OrthogonalCompactOpens Q)
    (x : finiteAdelicSpin Q U) (p : Nat.Primes) :
    finiteAdelicSpinToSpecialOrthogonal Q U x p = spinToSpecialOrthogonal (localForm Q p) (x p) :=
  AdelicAlgebraicGroups.restrictedProductMap_apply _ _ _ _ x p

/-- **Layer 3D**: the componentwise `SO → O`, whose compact-open compatibility is `mem_soPart`. -/
noncomputable def finiteAdelicSpecialOrthogonalToOrthogonal (U : OrthogonalCompactOpens Q) :
    finiteAdelicSpecialOrthogonal Q U →* finiteAdelicOrthogonal Q U :=
  AdelicAlgebraicGroups.restrictedProductMap (fun p => U.soPart p) (fun p => U.orth p)
    (fun p => specialOrthogonalToOrthogonal (localForm Q p)) (fun _ _ hg => hg)

theorem finiteAdelicSpecialOrthogonalToOrthogonal_apply (U : OrthogonalCompactOpens Q)
    (x : finiteAdelicSpecialOrthogonal Q U) (p : Nat.Primes) :
    finiteAdelicSpecialOrthogonalToOrthogonal Q U x p =
      specialOrthogonalToOrthogonal (localForm Q p) (x p) :=
  AdelicAlgebraicGroups.restrictedProductMap_apply _ _ _ _ x p

/-! ### Layer 3E: the diagonal maps, one for each group -/

/-- **Layer 3E**: the diagonal embedding of the rational orthogonal points, whose defining
hypothesis is `OrthogonalCompactOpens.eventually_mem_orth`. -/
noncomputable def adelicDiagonalOrthogonal (U : OrthogonalCompactOpens Q) :
    orthogonalGroup Q →* finiteAdelicOrthogonal Q U :=
  AdelicAlgebraicGroups.rationalDiagonal (fun p => orthogonalBaseChange Q p)
    (fun p => U.orth p) U.eventually_mem_orth

/-- **Layer 3E**: the diagonal embedding of the rational **proper** isometries, whose hypothesis is
derived from the orthogonal one. -/
noncomputable def adelicDiagonalSpecialOrthogonal (U : OrthogonalCompactOpens Q) :
    specialOrthogonalGroup Q →* finiteAdelicSpecialOrthogonal Q U :=
  AdelicAlgebraicGroups.rationalDiagonal (fun p => specialOrthogonalBaseChange Q p)
    (fun p => U.soPart p) U.eventually_mem_soPart

/-- **⚠ Layer 3E**: the diagonal embedding of the rational **spin** points. This is the map Layer 4
is about, and it is not obtainable from the orthogonal one. -/
noncomputable def adelicDiagonalSpin (U : OrthogonalCompactOpens Q) :
    spinGroup Q →* finiteAdelicSpin Q U :=
  AdelicAlgebraicGroups.rationalDiagonal (fun p => spinBaseChange Q p)
    (fun p => U.spin p) U.eventually_mem_spin

theorem adelicDiagonalSpin_apply (U : OrthogonalCompactOpens Q) (g : spinGroup Q)
    (p : Nat.Primes) : adelicDiagonalSpin Q U g p = spinBaseChange Q p g := by
  sorry

/-- **Layer 3E**: the square relating the two routes from rational spin points into adelic `SO`
commutes, which is what lets 4F speak of "the image of the rational spin points" unambiguously. -/
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
transvections `E_{u,tw}` with `t` highly divisible accumulate at the identity, which is exactly
consistent with Layer 4, where that same image is dense. -/
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
      AdelicAlgebraicGroups.FiniteAdelicPoints
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

/-- **Layer 3F**: the adelic spinor kernel, a subgroup of adelic `SO`, which is what Layer 4F's
closure theorem is about. -/
noncomputable def adelicSpinorKernel (hQ : Q.Nondegenerate) (U : OrthogonalCompactOpens Q) :
    Subgroup (finiteAdelicSpecialOrthogonal Q U) :=
  (adelicSpinorNorm Q hQ U).ker

/-! ### Layer 4: strong approximation, in `Spin`, and its transport to `SO` -/

/-- **Layer 4E**, the corollary the integral lattices roadmap consumes:
`Spin(V)(𝔸_f) = Spin(V)(ℚ) · W` for every compact open `W`, when `V` is indefinite of dimension at
least three. ⚠ It is a statement about adelic **`Spin`**, with the rational spin diagonal of 3E on
the right. Indefiniteness is spelled through the signature of the real form; note `sigPos` and
`sigNeg` live in the **root** namespace, not under `QuadraticForm`.

⚠ The general-`S` form is the imported README-level
`AdelicAlgebraicGroups.strongApproximation` contract. It is not duplicated here before its affine
group carrier exists. The application does not pass through a global hyperbolic plane:
`x² + y² − 3z²` satisfies the hypothesis below and is anisotropic over ℚ. -/
theorem strongApproximation_finiteAdelicSpin (hQ : Q.Nondegenerate)
    (hdim : 3 ≤ Module.finrank ℚ V)
    (hindef : 0 < sigPos (realForm Q) ∧ 0 < sigNeg (realForm Q))
    (U : OrthogonalCompactOpens Q)
    (W : Subgroup (finiteAdelicSpin Q U))
    (hW : IsOpen (W : Set (finiteAdelicSpin Q U)))
    (hWc : IsCompact (W : Set (finiteAdelicSpin Q U))) :
    ∀ x : finiteAdelicSpin Q U,
      ∃ (g : spinGroup Q) (w : W), x = adelicDiagonalSpin Q U g * (w : _) := by
  sorry

/-- **Layer 4F**: what the theorem gives in `SO`, exactly. The continuous image of a dense set is
dense in the image, not in the ambient group, so the transported statement is about the adelic
spinor kernel and about the image of the **rational spin points**.

⚠ Two things make the naive `O`-statement false, and both are why this theorem is stated as it is.
The closure of the diagonal image of all of `O(V)(ℚ)` is not the spinor kernel: a rational
reflection of nonsquare spinor norm lies in the left side and not in the right. And a finite adelic
element of determinant `-1` at one place and `1` elsewhere, with trivial local spinor norms, is not
a rational isometry times a determinant-one compact open. -/
theorem closure_rationalSpinImage (hQ : Q.Nondegenerate) (hdim : 3 ≤ Module.finrank ℚ V)
    (hindef : 0 < sigPos (realForm Q) ∧ 0 < sigNeg (realForm Q))
    (U : OrthogonalCompactOpens Q) :
    closure
        (((finiteAdelicSpinToSpecialOrthogonal Q U).comp (adelicDiagonalSpin Q U)).range :
          Set (finiteAdelicSpecialOrthogonal Q U))
      = (adelicSpinorKernel Q hQ U : Set (finiteAdelicSpecialOrthogonal Q U)) := by
  sorry

end StrongApproximation

end TauCetiRoadmap.OrthogonalSpinGroups
