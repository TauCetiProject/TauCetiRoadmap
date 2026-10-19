import Mathlib
import TauCeti.GroupTheory.SpecificGroups.Affine.Basic
import TauCeti.Algebra.MonoidAlgebra.Torsion
import TauCeti.AlgebraicGeometry.Cohomology.Genus

/-!
# MordellLawrenceVenkatesh: representative target signatures

This file is not the roadmap: `README.md` is definitive, and the declarations below are not
exhaustive. They suggest Lean forms for the definitions and theorems of the roadmap that can be
stated with the pinned Mathlib and Tau Ceti APIs. Families of abelian varieties, period maps,
surfaces and mapping class groups, Hurwitz spaces and Pryms are specified in the README; their
construction contracts do not introduce carriers here. The declarations include the linear algebra,
finite group theory and number theory of the method and the headline finiteness theorem on native
scheme, genus and rational-point carriers, in the corresponding README layers.

Design choices made explicit here:
* the centralizer of a semilinear map is an `F`-subalgebra of `Module.End E V` for a field `F` fixed
  by the automorphism, so that its dimension over the fixed field can be stated;
* the affine group of `𝔽_q` is used through its faithful permutation action, as the subgroup of
  `Equiv.Perm (ZMod q)` of maps `x ↦ a * x + b` with `a` a unit; this is the permutation image of
  Tau Ceti's `AffineGroup (ZMod q)`, and statements about cycle types,
  centralizers and normalizers in `Sym(𝔽_q)` are made there;
* symplectic transvections are Mathlib's `LinearEquiv.transvection` of the form `r • ω v`, with the
  convention `T_v^r x = x + r * ω v x • v`;
* the short-orbit proportion `size_v` is a function of a permutation of a finite set (the Frobenius
  acting on geometric points), so that it is independent of any scheme carrier;
* finite filtrations use integer indices, including negative jumps, with explicit finite bounds;
  their Hodge degree and mean weight agree with the supplied p-adic filtered realizations.

Names are relative to the namespace `TauCetiRoadmap.MordellLawrenceVenkatesh`.
-/

namespace TauCetiRoadmap.MordellLawrenceVenkatesh

/-! ## Layer LV.0: semilinear centralizers, the affine group and symplectic generation -/

section SemilinearCentralizer

variable (F : Type*) {E V : Type*} [Field F] [Field E] [Algebra F E]
  [AddCommGroup V] [Module E V] [Module F V] [IsScalarTower F E V]

/-- The centralizer `Z(φ)` of a `σ`-semilinear map `φ : V → V`: the `E`-linear endomorphisms of `V`
commuting with `φ`, as an `F`-subalgebra of `End_E(V)` for a subfield `F` of `E` fixed by `σ`.
README 0.3. -/
def semilinearCentralizer (σ : E →+* E) (hσ : ∀ a : F, σ (algebraMap F E a) = algebraMap F E a)
    (φ : V →ₛₗ[σ] V) : Subalgebra F (Module.End E V) where
  carrier := {f | ∀ v, f (φ v) = φ (f v)}
  mul_mem' := by
    intro f g hf hg v
    change f (g (φ v)) = φ (f (g v))
    rw [hg v, hf]
  add_mem' := by
    intro f g hf hg v
    change f (φ v) + g (φ v) = φ (f v + g v)
    rw [hf v, hg v, map_add]
  algebraMap_mem' := by
    intro a v
    simp only [Algebra.algebraMap_eq_smul_one, LinearMap.smul_apply, Module.End.one_apply]
    rw [← IsScalarTower.algebraMap_smul E a v, φ.map_smulₛₗ, hσ,
      IsScalarTower.algebraMap_smul]

/-- Membership is the pointwise commuting equation; the base field is fixed by the semilinearity map. -/
theorem mem_semilinearCentralizer (σ : E →+* E)
    (hσ : ∀ a : F, σ (algebraMap F E a) = algebraMap F E a) (φ : V →ₛₗ[σ] V)
    (f : Module.End E V) :
    f ∈ semilinearCentralizer F σ hσ φ ↔ ∀ v, f (φ v) = φ (f v) := Iff.rfl

/-- For the identity automorphism and the identity map the centralizer is everything. README 0.3. -/
example : semilinearCentralizer F (RingHom.id E) (fun _ => rfl) (LinearMap.id : V →ₗ[E] V) = ⊤ := by
  ext f
  simp [semilinearCentralizer]

/-- Dimension of the centralizer (Lawrence–Venkatesh, Lemma 2.1): if `σ` has finite order with
fixed field exactly `F` and `φ` is bijective, then `dim_F Z(φ) ≤ (dim_E V)²`. README 0.4. -/
theorem finrank_semilinearCentralizer_le [FiniteDimensional E V] (σ : E →+* E)
    (hσ : ∀ a : F, σ (algebraMap F E a) = algebraMap F E a)
    (hfix : ∀ x : E, σ x = x → x ∈ (algebraMap F E).range) (e : ℕ) (he : 0 < e)
    (hord : ∀ x : E, (σ ^ e) x = x) (φ : V →ₛₗ[σ] V) (hφ : Function.Bijective φ) :
    Module.finrank F (semilinearCentralizer F σ hσ φ) ≤ Module.finrank E V ^ 2 := by
  sorry

/-- On a one-dimensional space, conjugation over `ℂ/ℝ` excludes multiplication by `I`. -/
example : (Complex.I • (LinearMap.id : ℂ →ₗ[ℂ] ℂ)) ∉
    semilinearCentralizer ℝ (starRingEnd ℂ) (by intro a; simp)
      (starLinearEquiv ℂ : ℂ ≃ₗ⋆[ℂ] ℂ).toLinearMap := by
  intro h
  have hi := h 1
  have : (Complex.I : ℂ) = -Complex.I := by simpa using hi
  have him := congrArg Complex.im this
  norm_num at him

end SemilinearCentralizer

section AffineGroup

variable (q : ℕ) [Fact q.Prime]

/-- The affine group `Aff(q)` of the prime field, as the group of permutations `x ↦ a * x + b` of
`ZMod q` with `a` a unit: the permutation image of Tau Ceti's `AffineGroup (ZMod q)`, which acts faithfully. README 0.7. -/
def affinePermGroup : Subgroup (Equiv.Perm (ZMod q)) :=
  (MulAction.toPermHom (TauCeti.AffineGroup (ZMod q)) (ZMod q)).range

variable {q}

/-- The linear part is the supplied semidirect-product projection transported through the
faithful permutation action. README 0.7. -/
noncomputable def affineLinearPart : affinePermGroup q →* (ZMod q)ˣ :=
  SemidirectProduct.rightHom.comp
    (MonoidHom.ofInjective
      (f := MulAction.toPermHom (TauCeti.AffineGroup (ZMod q)) (ZMod q))
      MulAction.toPerm_injective).symm.toMonoidHom

/-- Recover the linear coefficient from an affine permutation. -/
theorem affineLinearPart_apply (σ : affinePermGroup q) (a : (ZMod q)ˣ) (b : ZMod q)
    (h : ∀ x, (σ : Equiv.Perm (ZMod q)) x = a * x + b) : affineLinearPart σ = a := by
  sorry

/-- Every unit occurs as the linear part of an affine permutation. -/
theorem affineLinearPart_surjective : Function.Surjective (affineLinearPart (q := q)) := by
  sorry

/-- The kernel of the linear part is the group of translations. README 0.7. -/
theorem mem_ker_affineLinearPart (σ : affinePermGroup q) :
    σ ∈ (affineLinearPart (q := q)).ker ↔
      ∃ b : ZMod q, ∀ x, (σ : Equiv.Perm (ZMod q)) x = x + b := by
  sorry

/-- Cycle types (README 0.8): an affine permutation with linear part `a ≠ 1` has one fixed point,
and its other cycles all have length the order of `a`. -/
theorem cycleType_of_affineLinearPart_ne_one (σ : affinePermGroup q)
    (h : affineLinearPart σ ≠ 1) :
    (σ : Equiv.Perm (ZMod q)).cycleType =
      Multiset.replicate ((q - 1) / orderOf (affineLinearPart σ)) (orderOf (affineLinearPart σ)) := by
  sorry

/-- A nontrivial translation is a `q`-cycle. README 0.8. -/
theorem cycleType_of_affineLinearPart_eq_one (σ : affinePermGroup q)
    (h : affineLinearPart σ = 1) (hσ : σ ≠ 1) :
    (σ : Equiv.Perm (ZMod q)).cycleType = {q} := by
  sorry

/-- For `q ≥ 3` the centralizer of `Aff(q)` in `Sym(𝔽_q)` is trivial. README 0.9. -/
theorem centralizer_affinePermGroup (hq : 3 ≤ q) :
    Subgroup.centralizer (affinePermGroup q : Set (Equiv.Perm (ZMod q))) = ⊥ := by
  sorry

/-- For `q ≥ 3` the group `Aff(q)` is self-normalizing in `Sym(𝔽_q)`. README 0.9. -/
theorem normalizer_affinePermGroup (hq : 3 ≤ q) :
    Subgroup.normalizer (affinePermGroup q : Set (Equiv.Perm (ZMod q))) = affinePermGroup q := by
  sorry

/-- Sharp two-transitivity. README 0.7. -/
theorem existsUnique_affinePermGroup_pair {x₁ x₂ y₁ y₂ : ZMod q} (hx : x₁ ≠ x₂) (hy : y₁ ≠ y₂) :
    ∃! σ : affinePermGroup q, (σ : Equiv.Perm (ZMod q)) x₁ = y₁ ∧ (σ : Equiv.Perm (ZMod q)) x₂ = y₂ := by
  sorry

/-- The three-element affine permutation group is the full symmetric group. README 0.7. -/
theorem affinePermGroup_three [Fact (Nat.Prime 3)] : affinePermGroup 3 = ⊤ := by
  sorry

/-- Pure translations have trivial linear part, independently of their displacement. README 0.7. -/
example (b : ZMod q) :
    affineLinearPart ((MonoidHom.ofInjective
      (f := MulAction.toPermHom (TauCeti.AffineGroup (ZMod q)) (ZMod q))
      MulAction.toPerm_injective) (SemidirectProduct.inl (Multiplicative.ofAdd b))) = 1 := by
  change ((MonoidHom.ofInjective
    (f := MulAction.toPermHom (TauCeti.AffineGroup (ZMod q)) (ZMod q))
    MulAction.toPerm_injective).symm _).right = 1
  rw [MulEquiv.symm_apply_apply]
  rfl

/-- Dilation retains its prescribed coefficient through the faithful action. README 0.7. -/
example (a : (ZMod q)ˣ) :
    affineLinearPart ((MonoidHom.ofInjective
      (f := MulAction.toPermHom (TauCeti.AffineGroup (ZMod q)) (ZMod q))
      MulAction.toPerm_injective) (SemidirectProduct.inr a)) = a := by
  change ((MonoidHom.ofInjective
    (f := MulAction.toPermHom (TauCeti.AffineGroup (ZMod q)) (ZMod q))
    MulAction.toPerm_injective).symm _).right = a
  rw [MulEquiv.symm_apply_apply]
  rfl

end AffineGroup

section Counting

/-- The `k`-tuples of `ℤ/N` whose entries generate `ℤ/N`. README 0.11. -/
def generatingTuples (N k : ℕ) : Set (Fin k → ZMod N) :=
  {y | AddSubgroup.closure (Set.range y) = ⊤}

/-- Jordan's totient: the number of generating `k`-tuples. README 0.11. -/
theorem card_generatingTuples (N k : ℕ) (hN : 1 ≤ N) :
    (Nat.card (generatingTuples N k) : ℚ) =
      (N : ℚ) ^ k * ∏ ℓ ∈ N.primeFactors, (1 - ((ℓ : ℚ) ^ k)⁻¹) := by
  sorry

/-- At least half of all `k`-tuples generate, for `k ≥ 2`. README 0.11. -/
theorem two_mul_card_generatingTuples_ge (N k : ℕ) (hN : 1 ≤ N) (hk : 2 ≤ k) :
    N ^ k ≤ 2 * Nat.card (generatingTuples N k) := by
  sorry

/-- Isotropic subgroups of a perfect `ℚ/ℤ`-valued pairing on a finite abelian group satisfy
`|B|² ≤ |A|`; no symmetry of the pairing is assumed. README 0.12. -/
theorem card_sq_le_of_isotropic {A : Type*} [AddCommGroup A] [Finite A]
    (P : A →+ A →+ AddCircle (1 : ℚ)) (hP : Function.Bijective P) (B : AddSubgroup A)
    (hB : ∀ x ∈ B, ∀ y ∈ B, P x y = 0) : Nat.card B ^ 2 ≤ Nat.card A := by
  sorry

/-- Empty tuples generate the trivial cyclic group, and do not generate `ℤ/2`. -/
theorem card_generatingTuples_empty : Nat.card (generatingTuples 1 0) = 1 ∧
    Nat.card (generatingTuples 2 0) = 0 := by
  sorry

/-- An empty tuple cannot generate the nontrivial cyclic group. README 0.11. -/
example : (fun i : Fin 0 => Fin.elim0 i) ∉ generatingTuples 2 0 := by
  simp [generatingTuples]

/-- The same empty tuple generates the trivial cyclic group. README 0.11. -/
example : (fun i : Fin 0 => Fin.elim0 i) ∈ generatingTuples 1 0 := by
  change AddSubgroup.closure _ = ⊤
  exact Subsingleton.elim _ _

end Counting

section MinimalSubrepresentation

/-- A minimal nonzero subrepresentation of a reducible representation preserving a nondegenerate
symmetric or alternating form up to a similitude character has at most half the dimension.
README 0.13. -/
theorem finrank_le_half_of_minimal {k G V : Type*} [Field k] [Group G] [AddCommGroup V]
    [Module k V] [FiniteDimensional k V] (ρ : Representation k G V) (B : LinearMap.BilinForm k V)
    (hB : B.Nondegenerate) (hsym : B.IsSymm ∨ B.IsAlt) (χ : G →* kˣ)
    (hχ : ∀ g x y, B (ρ g x) (ρ g y) = (χ g : k) * B x y) (W : Submodule k V) (hW0 : W ≠ ⊥)
    (hWinv : ∀ g, W.map (ρ g) ≤ W)
    (hred : ∃ U : Submodule k V, U ≠ ⊥ ∧ U ≠ ⊤ ∧ ∀ g, U.map (ρ g) ≤ U)
    (hmin : ∀ U : Submodule k V, U ≠ ⊥ → (∀ g, U.map (ρ g) ≤ U) →
      Module.finrank k W ≤ Module.finrank k U) :
    2 * Module.finrank k W ≤ Module.finrank k V := by
  sorry

end MinimalSubrepresentation

section Transvections

variable {k V : Type*} [Field k] [AddCommGroup V] [Module k V]

/-- The symplectic transvection `T_v^r x = x + r * ω v x • v` of an alternating form `ω`.
README 0.14. -/
def symplecticTransvection (ω : LinearMap.BilinForm k V) (hω : ω.IsAlt) (v : V) (r : k) :
    V ≃ₗ[k] V :=
  LinearEquiv.transvection (f := r • ω v) (v := v) (by simp [hω v])

/-- The transvection sends `x` to `x + r * ω v x • v`, fixing its argument order. -/
theorem symplecticTransvection_apply (ω : LinearMap.BilinForm k V) (hω : ω.IsAlt) (v : V)
    (r : k) (x : V) : symplecticTransvection ω hω v r x = x + (r * ω v x) • v := by
  rfl

/-- An alternating-form transvection preserves the form over every field. -/
theorem symplecticTransvection_isometry (ω : LinearMap.BilinForm k V) (hω : ω.IsAlt) (v : V)
    (r : k) (x y : V) :
    ω (symplecticTransvection ω hω v r x) (symplecticTransvection ω hω v r y) = ω x y := by
  sorry

/-- Transvections with a fixed centre add their parameters under composition. -/
theorem symplecticTransvection_add (ω : LinearMap.BilinForm k V) (hω : ω.IsAlt) (v : V)
    (r s : k) :
    symplecticTransvection ω hω v r * symplecticTransvection ω hω v s =
      symplecticTransvection ω hω v (r + s) := by
  sorry

/-- Scaling the centre by `c` scales the parameter by `c²`. -/
theorem symplecticTransvection_smul (ω : LinearMap.BilinForm k V) (hω : ω.IsAlt) (v : V)
    (c r : k) :
    symplecticTransvection ω hω (c • v) r = symplecticTransvection ω hω v (c ^ 2 * r) := by
  sorry

/-- Conjugating a transvection by an isometry moves its centre. README 0.14. -/
theorem conj_symplecticTransvection (ω : LinearMap.BilinForm k V) (hω : ω.IsAlt) (v : V) (r : k)
    (g : V ≃ₗ[k] V) (hg : ∀ x y, ω (g x) (g y) = ω x y) :
    g * symplecticTransvection ω hω v r * g⁻¹ = symplecticTransvection ω hω (g v) r := by
  sorry

/-- A transvection is unipotent of class two. -/
theorem symplecticTransvection_sub_one_sq (ω : LinearMap.BilinForm k V) (hω : ω.IsAlt) (v : V)
    (r : k) :
    ((symplecticTransvection ω hω v r : V →ₗ[k] V) - LinearMap.id) ^ 2 = 0 := by
  sorry

/-- For `ω e f = 1`, `T_e^2 f = f + 2e` and `T_e^2 e = e`. -/
example (ω : LinearMap.BilinForm k V) (hω : ω.IsAlt) (e f : V) (h : ω e f = 1) :
    symplecticTransvection ω hω e 2 f = f + (2 : k) • e ∧ symplecticTransvection ω hω e 2 e = e := by
  change f + (2 * ω e f) • e = f + (2 : k) • e ∧
    e + (2 * ω e e) • e = e
  simp [h, hω e]

/-- The symplectic Lie algebra of a nondegenerate alternating form in characteristic zero and
dimension at least two is simple. README 0.16. -/
theorem isSimple_skewAdjointLieSubalgebra [CharZero k] [FiniteDimensional k V]
    (ω : LinearMap.BilinForm k V) (hω : ω.IsAlt) (hnd : ω.Nondegenerate)
    (hdim : 2 ≤ Module.finrank k V) :
    LieAlgebra.IsSimple k (skewAdjointLieSubalgebra ω) := by
  sorry

/-- Zero centre gives the identity, over any characteristic. -/
example (ω : LinearMap.BilinForm k V) (hω : ω.IsAlt) (r : k) :
    symplecticTransvection ω hω 0 r = LinearEquiv.refl k V := by
  ext x
  change x + (r * ω 0 x) • (0 : V) = x
  simp

end Transvections

section Goursat

variable {k s t : Type*} [Field k] [LieRing s] [LieAlgebra k s] [LieRing t] [LieAlgebra k t]

/-- Two-factor Goursat for simple Lie algebras: a Lie subalgebra of `s × t` projecting onto both
factors is everything or the graph of an isomorphism. README 0.22. -/
theorem lieSubalgebra_prod_eq_top_or_graph [LieAlgebra.IsSimple k s] [LieAlgebra.IsSimple k t]
    (h : LieSubalgebra k (s × t))
    (h₁ : Function.Surjective (fun x : h => (x : s × t).1))
    (h₂ : Function.Surjective (fun x : h => (x : s × t).2)) :
    h = ⊤ ∨ ∃ e : s ≃ₗ⁅k⁆ t, ∀ x : s × t, x ∈ h ↔ x.2 = e x.1 := by
  sorry

end Goursat


/-! ## Layer LV.1: Galois representations, friendly places and Hodge weights -/

section CMSubfield

open NumberField

/-- The largest subfield of a number field `K` that is totally real or CM. Its existence and its
description through complex conjugations are README 1.3–1.4; this definition is the supremum of
all such subfields. README 1.4. -/
noncomputable def largestCMSubfield (K : Type*) [Field K] [NumberField K] : IntermediateField ℚ K :=
  sSup {F : IntermediateField ℚ K | IsTotallyReal F ∨ IsCMField F}

/-- The largest CM-or-totally-real subfield is itself totally real or CM. README 1.4. -/
theorem largestCMSubfield_isTotallyReal_or_isCMField (K : Type*) [Field K] [NumberField K] :
    IsTotallyReal (largestCMSubfield K) ∨ IsCMField (largestCMSubfield K) := by
  sorry

/-- A CM field is its own largest CM subfield. -/
theorem largestCMSubfield_eq_top_of_isCMField (K : Type*) [Field K] [NumberField K]
    [IsCMField K] : largestCMSubfield K = ⊤ := by
  sorry

/-- A totally real field is its own largest CM-or-totally-real subfield. -/
example (K : Type*) [Field K] [NumberField K] [IsTotallyReal K] : largestCMSubfield K = ⊤ := by
  apply top_le_iff.mp
  exact le_sSup (show (IsTotallyReal (⊤ : IntermediateField ℚ K) ∨
    IsCMField (⊤ : IntermediateField ℚ K)) from Or.inl inferInstance)

/-- A cubic field that is not totally real has no CM or totally real subfield other than `ℚ`. -/
theorem largestCMSubfield_eq_bot_of_cubic (K : Type*) [Field K] [NumberField K] (h3 : Module.finrank ℚ K = 3)
    (hnr : ¬ IsTotallyReal K) : largestCMSubfield K = ⊥ := by
  sorry

end CMSubfield

section Filtrations

variable (k D : Type*) [Field k] [AddCommGroup D] [Module k D]

/-- A finite, exhaustive, separated, decreasing `ℤ`-indexed filtration with explicit bounds:
`F i = ⊤` for `i ≤ lo` and `F i = ⊥` for `i ≥ hi`. Negative jumps are allowed. README 1.12. -/
structure FiniteFiltration where
  /-- The filtration steps. -/
  step : ℤ → Submodule k D
  /-- The filtration is decreasing. -/
  antitone : Antitone step
  /-- A lower bound below which the filtration is everything. -/
  lo : ℤ
  /-- An upper bound from which the filtration is zero. -/
  hi : ℤ
  /-- Every sufficiently low step is the whole space. -/
  step_of_le : ∀ i ≤ lo, step i = ⊤
  /-- Every sufficiently high step is zero. -/
  step_of_ge : ∀ i ≥ hi, step i = ⊥

variable {k D}

/-- The Hodge degree `t_H(D) = Σ_j j · dim gr^j D`. README 1.12. -/
noncomputable def FiniteFiltration.hodgeDegree [FiniteDimensional k D] (Fil : FiniteFiltration k D) : ℤ :=
  ∑ j ∈ Finset.Ico Fil.lo Fil.hi,
    j * ((Module.finrank k (Fil.step j) : ℤ) - Module.finrank k (Fil.step (j + 1)))

/-- The weight `t_H(D) / dim D` of a filtration of a nonzero space. README 1.12. -/
noncomputable def FiniteFiltration.filtrationWeight [FiniteDimensional k D] [Nontrivial D] (Fil : FiniteFiltration k D) : ℚ :=
  (Fil.hodgeDegree : ℚ) / Module.finrank k D

/-- The Hodge degree does not depend on the chosen bounds. -/
theorem FiniteFiltration.hodgeDegree_eq_of_step_eq [FiniteDimensional k D]
    (Fil Fil' : FiniteFiltration k D) (h : Fil.step = Fil'.step) :
    Fil.hodgeDegree = Fil'.hodgeDegree := by
  sorry

/-- Shifting a filtration by `n` adds `n · dim D` to the Hodge degree. README 1.12. -/
theorem FiniteFiltration.hodgeDegree_shift [FiniteDimensional k D] (Fil Fil' : FiniteFiltration k D)
    (n : ℤ) (h : ∀ i, Fil'.step i = Fil.step (i - n)) :
    Fil'.hodgeDegree = Fil.hodgeDegree + n * Module.finrank k D := by
  sorry

/-- A two-step filtration with `F⁰ = D` of dimension `2`, `F¹` a line and `F² = 0` has weight `1/2`. -/
theorem filtrationWeight_two_step (L : Submodule k (Fin 2 → k)) (hL : Module.finrank k L = 1) (Fil : FiniteFiltration k (Fin 2 → k))
    (h0 : ∀ i ≤ 0, Fil.step i = ⊤) (h1 : Fil.step 1 = L) (h2 : ∀ i ≥ 2, Fil.step i = ⊥) :
    Fil.filtrationWeight = 1 / 2 := by
  sorry

/-- A line with a single jump at `−1` has degree and weight `−1`; truncation at zero fails. -/
theorem filtrationWeight_negative_one (Fil : FiniteFiltration k k) (hlo : ∀ i ≤ -1, Fil.step i = ⊤)
    (hhi : ∀ i ≥ 0, Fil.step i = ⊥) :
    Fil.hodgeDegree = -1 ∧ Fil.filtrationWeight = -1 := by
  sorry

/-- A line of jump zero has degree and mean weight zero. README 1.12. -/
example :
    let Fil : FiniteFiltration ℚ ℚ :=
      { step := fun i => if i ≤ 0 then ⊤ else ⊥
        antitone := by
          intro i j hij
          dsimp only
          by_cases hj : j ≤ 0
          · simp [hj, show i ≤ 0 from le_trans hij hj]
          · simp [hj]
        lo := 0
        hi := 1
        step_of_le := by intro i hi; simp [hi]
        step_of_ge := by intro i hi; simp [show ¬ i ≤ 0 by omega] }
    Fil.hodgeDegree = 0 ∧ Fil.filtrationWeight = 0 := by
  dsimp only [FiniteFiltration.filtrationWeight, FiniteFiltration.hodgeDegree]
  norm_num [show Finset.Ico (0 : ℤ) 1 = {0} by decide]

/-- A line of jump minus one retains its negative Hodge degree. README 1.12. -/
example :
    let Fil : FiniteFiltration ℚ ℚ :=
      { step := fun i => if i ≤ -1 then ⊤ else ⊥
        antitone := by
          intro i j hij
          dsimp only
          by_cases hj : j ≤ -1
          · simp [hj, show i ≤ -1 from le_trans hij hj]
          · simp [hj]
        lo := -1
        hi := 0
        step_of_le := by intro i hi; simp [hi]
        step_of_ge := by intro i hi; simp [show ¬ i ≤ -1 by omega] }
    Fil.hodgeDegree = -1 ∧ Fil.filtrationWeight = -1 := by
  dsimp only [FiniteFiltration.filtrationWeight, FiniteFiltration.hodgeDegree]
  norm_num [show Finset.Ico ((-1) : ℤ) 0 = {-1} by decide]
  change ((Module.finrank ℚ (⊥ : Submodule ℚ ℚ) : ℤ) -
      Module.finrank ℚ (⊤ : Submodule ℚ ℚ) = -1) ∧
    ((Module.finrank ℚ (⊥ : Submodule ℚ ℚ) : ℚ) -
      Module.finrank ℚ (⊤ : Submodule ℚ ℚ) = -1)
  norm_num

end Filtrations

/-! ## Layer LV.3: Lagrangian period varieties and the two period maps -/

section Lagrangian

variable {k V : Type*} [Field k] [AddCommGroup V] [Module k V] [FiniteDimensional k V]

/-- Isotropic subspaces of a nondegenerate alternating form have at most half the dimension, and
exactly half exactly when they are Lagrangian. README 3.1. -/
theorem two_mul_finrank_le_of_isotropic (ω : LinearMap.BilinForm k V) (hω : ω.IsAlt)
    (hnd : ω.Nondegenerate) (L : Submodule k V) (hL : ∀ x ∈ L, ∀ y ∈ L, ω x y = 0) :
    2 * Module.finrank k L ≤ Module.finrank k V := by
  sorry

/-- For an isotropic subspace, being its own orthogonal is equivalent to half dimension. -/
theorem isLagrangian_iff_finrank (ω : LinearMap.BilinForm k V) (hω : ω.IsAlt)
    (hnd : ω.Nondegenerate) (L : Submodule k V) (hL : ∀ x ∈ L, ∀ y ∈ L, ω x y = 0) :
    ω.orthogonal L = L ↔ 2 * Module.finrank k L = Module.finrank k V := by
  sorry

/-- A Lagrangian has a Lagrangian complement in every characteristic. README 3.2. -/
theorem exists_lagrangian_complement (ω : LinearMap.BilinForm k V) (hω : ω.IsAlt)
    (hnd : ω.Nondegenerate) (L : Submodule k V) (hL : ω.orthogonal L = L) :
    ∃ L' : Submodule k V, IsCompl L L' ∧ ω.orthogonal L' = L' := by
  sorry

end Lagrangian

/-! ## Layer LV.5: surface topology -/

/-- Every homeomorphism between two embedded plane circles extends to the whole plane.
README 5.2; Gallier–Xu, Appendix E, Theorem E.1, p. 160. -/
theorem schoenflies_extension
    (c₁ c₂ : Circle → EuclideanSpace ℝ (Fin 2))
    (h₁ : Topology.IsEmbedding c₁) (h₂ : Topology.IsEmbedding c₂)
    (f : Set.range c₁ ≃ₜ Set.range c₂) :
    ∃ F : EuclideanSpace ℝ (Fin 2) ≃ₜ EuclideanSpace ℝ (Fin 2),
      ∀ x : Set.range c₁, F x = (f x : EuclideanSpace ℝ (Fin 2)) := by
  sorry

/-! ## Layer LV.6: the S-unit theorem -/

section SUnits

open IsDedekindDomain NumberField

/-- Finite generation of S-units over every number field, with a finite set of finite primes.
README 6.1; Dirichlet's unit theorem and the finite-support valuation exact sequence. -/
theorem sUnits_fg (K : Type*) [Field K] [NumberField K]
    (S : Set (HeightOneSpectrum (𝓞 K))) (hS : S.Finite) : (S.unit K).FG := by
  sorry

end SUnits

section Legendre

/-- The Legendre curve `y² = x(x - 1)(x - t)` over any commutative ring. README 6.4. -/
def legendreCurve {R : Type*} [CommRing R] (t : R) : WeierstrassCurve R where
  a₁ := 0
  a₂ := -(1 + t)
  a₃ := 0
  a₄ := t
  a₆ := 0

/-- The Legendre discriminant is `16 t²(t−1)²`; no invertibility hypothesis is needed. -/
theorem legendreCurve.Δ_eq {R : Type*} [CommRing R] (t : R) :
    (legendreCurve t).Δ = 16 * t ^ 2 * (t - 1) ^ 2 := by
  sorry

/-- The Legendre curve is elliptic when `2`, `t` and `t−1` are units. -/
theorem legendreCurve.isElliptic {R : Type*} [CommRing R] (t : R) (h₂ : IsUnit (2 : R))
    (ht : IsUnit t) (ht₁ : IsUnit (t - 1)) : (legendreCurve t).IsElliptic := by
  sorry

/-- The Legendre j-invariant formula; ellipticity supplies a nonzero denominator. -/
theorem legendreCurve.j_eq {K : Type*} [Field K] (t : K) [(legendreCurve t).IsElliptic] :
    (legendreCurve t).j = 256 * (t ^ 2 - t + 1) ^ 3 / (t ^ 2 * (t - 1) ^ 2) := by
  sorry

/-- `j(−1) = 1728`. -/
example [(legendreCurve (-1 : ℚ)).IsElliptic] : (legendreCurve (-1 : ℚ)).j = 1728 := by
  norm_num [WeierstrassCurve.j, legendreCurve, WeierstrassCurve.Δ,
    WeierstrassCurve.c₄, WeierstrassCurve.b₂, WeierstrassCurve.b₄, WeierstrassCurve.b₆,
    WeierstrassCurve.b₈]

/-- At `t = 0` and `t = 1` the discriminant vanishes. -/
example : (legendreCurve (0 : ℚ)).Δ = 0 ∧ (legendreCurve (1 : ℚ)).Δ = 0 := by
  norm_num [legendreCurve, WeierstrassCurve.Δ, WeierstrassCurve.b₂, WeierstrassCurve.b₄,
    WeierstrassCurve.b₆, WeierstrassCurve.b₈]

end Legendre

/-! ## Layer LV.7: rational points on the base of an abelian-by-finite family -/

section SizeV

variable {X : Type*} [Fintype X] [DecidableEq X]

/-- The proportion of points of a finite set lying in orbits of length less than `8` of a
permutation (the Frobenius at `v` acting on geometric points). README 7.1. -/
noncomputable def sizeV (σ : Equiv.Perm X) : ℚ :=
  ((Finset.univ.filter fun x => Function.minimalPeriod σ x < 8).card : ℚ) / Fintype.card X

/-- The point-weighted short-orbit proportion lies between zero and one, with value zero on the empty set. -/
theorem sizeV_mem_Icc (σ : Equiv.Perm X) : sizeV σ ∈ Set.Icc (0 : ℚ) 1 := by
  sorry

/-- Monotonicity under equivariant maps with fibres of constant cardinality. README 7.1. -/
theorem sizeV_le_of_fibres {Y : Type*} [Fintype Y] [DecidableEq Y] [Nonempty Y]
    (σ : Equiv.Perm X) (τ : Equiv.Perm Y) (f : X → Y) (hf : ∀ x, f (σ x) = τ (f x))
    (c : ℕ) (hc : 0 < c) (hfib : ∀ y, (Finset.univ.filter fun x => f x = y).card = c) :
    sizeV σ ≤ sizeV τ := by
  sorry

/-- A `7`-cycle has `size_v = 1`. -/
theorem sizeV_seven_cycle : sizeV (finRotate 7) = 1 := by
  sorry

/-- An `8`-cycle has `size_v = 0`. -/
theorem sizeV_eight_cycle : sizeV (finRotate 8) = 0 := by
  sorry

/-- A fixed point together with an `8`-cycle has `size_v = 1/9`, not `1/2`. -/
theorem sizeV_fixedPoint_eight_cycle :
    sizeV (Equiv.sumCongr (Equiv.refl (Fin 1)) (finRotate 8)) = 1 / 9 := by
  sorry

/-- Every point of a nonempty fixed fibre belongs to a short orbit. README 7.1. -/
example [Nonempty X] : sizeV (1 : Equiv.Perm X) = 1 := by
  simp [sizeV]

/-- The total extension of the short-orbit proportion is zero on the empty fibre. README 7.1. -/
example : sizeV (Equiv.refl (Fin 0)) = 0 := by
  simp [sizeV]

end SizeV

/-! ## Layer LV.8: Hurwitz spaces and the Kodaira–Parshin family -/

section Surjections

/-- Surjections onto `G` that are nontrivial on every element of a set `c` (a peripheral
conjugacy class). README 8.2. -/
def singlyRamifiedSurjections (Γ G : Type*) [Group Γ] [Group G] (c : Set Γ) : Set (Γ →* G) :=
  {φ | Function.Surjective φ ∧ ∀ γ ∈ c, φ γ ≠ 1}

/-- Conjugation by `G` acts freely on these surjections when `G` has trivial centre. README 8.2. -/
theorem singlyRamifiedSurjections_conj_free {Γ G : Type*} [Group Γ] [Group G]
    (hG : Subgroup.center G = ⊥) (c : Set Γ) (φ : Γ →* G)
    (hφ : φ ∈ singlyRamifiedSurjections Γ G c) (h : G)
    (hh : (MulAut.conj h).toMonoidHom.comp φ = φ) : h = 1 := by
  sorry

/-- Requiring nontriviality at the identity makes the set of surjections empty. -/
example (Γ G : Type*) [Group Γ] [Group G] : singlyRamifiedSurjections Γ G {1} = ∅ := by
  ext φ
  simp [singlyRamifiedSurjections]

end Surjections

section Idempotents

variable {G : Type*} [Group G] [Fintype G] [DecidableEq G]

/-- Averaging over the whole group absorbs averaging over any subgroup. -/
theorem averagingIdempotent_top_mul (H : Subgroup G) [Fintype H] [Fintype (⊤ : Subgroup G)] :
    TauCeti.groupAlgebraSubgroupAverage ℚ (⊤ : Subgroup G) * TauCeti.groupAlgebraSubgroupAverage ℚ H = TauCeti.groupAlgebraSubgroupAverage ℚ ⊤ := by
  sorry

/-- The difference `e_H − e_G` is idempotent in the rational group algebra. README 8.8. -/
theorem isIdempotentElem_averagingIdempotent_sub (H : Subgroup G) [Fintype H]
    [Fintype (⊤ : Subgroup G)] :
    IsIdempotentElem (TauCeti.groupAlgebraSubgroupAverage ℚ H - TauCeti.groupAlgebraSubgroupAverage ℚ (⊤ : Subgroup G)) := by
  sorry

end Idempotents

/-! ## Layer LV.9: Aff(q)-covers of surfaces -/

section PrimitiveHomology

variable {HZ HY : Type*} [AddCommGroup HZ] [Module ℚ HZ] [AddCommGroup HY] [Module ℚ HY]

/-- Linear algebra of primitive homology: if `π_* ∘ π^* = q` with `q ≠ 0`, the transfer image and
the kernel of pushforward are complementary, with projection `x ↦ x − q⁻¹ π^* π_* x`. README 9.3. -/
theorem isCompl_primitiveHomology (p : HZ →ₗ[ℚ] HY) (t : HY →ₗ[ℚ] HZ) (q : ℕ)
    (hq : q ≠ 0) (h : p ∘ₗ t = (q : ℚ) • LinearMap.id) :
    IsCompl (LinearMap.range t) (LinearMap.ker p) := by
  sorry

/-- With the projection formula `⟨t a, x⟩ = ⟨a, p x⟩`, the two summands are orthogonal and the
orthogonality follows without nondegeneracy; the nondegenerate restricted-form target remains
in the README. README 9.3. -/
theorem primitiveHomology_orthogonal_transfer (p : HZ →ₗ[ℚ] HY) (t : HY →ₗ[ℚ] HZ) (q : ℕ) (hq : q ≠ 0)
    (h : p ∘ₗ t = (q : ℚ) • LinearMap.id) (ωZ : LinearMap.BilinForm ℚ HZ)
    (ωY : LinearMap.BilinForm ℚ HY) (hproj : ∀ a x, ωZ (t a) x = ωY a (p x)) :
    ∀ a, ∀ x ∈ LinearMap.ker p, ωZ (t a) x = 0 := by
  sorry

/-- A surjection `ℤ^r → ℤ/N` with `r ≥ 2` lifts to a surjection `ℤ^r → ℤ`. README 9.10. -/
theorem exists_surjective_lift (r N : ℕ) (hN : 1 ≤ N) (hr : 2 ≤ r) (f : (Fin r → ℤ) →+ ZMod N)
    (hf : Function.Surjective f) :
    ∃ g : (Fin r → ℤ) →+ ℤ, Function.Surjective g ∧ ∀ x, ((g x : ℤ) : ZMod N) = f x := by
  sorry

end PrimitiveHomology

/-! ## Layer LV.10: the monodromy theorem for Kodaira–Parshin families -/

section Lattices

/-- A vector of `ℤ^r` is primitive when its entries have greatest common divisor one. -/
def IsPrimitiveVector {r : ℕ} (v : Fin r → ℤ) : Prop :=
  Finset.univ.gcd v = 1

/-- Choosing one of `±v` for every primitive `v`, the differences of the resulting vectors span `ℚ^r`
when `r ≥ 2`. README 10.3. -/
theorem span_sub_signedPrimitive (r : ℕ) (hr : 2 ≤ r) (ε : (Fin r → ℤ) → ℤˣ) :
    Submodule.span ℚ {w : Fin r → ℚ | ∃ v v' : Fin r → ℤ, IsPrimitiveVector v ∧
      IsPrimitiveVector v' ∧ w = fun i => ((ε v : ℤ) * v i - (ε v' : ℤ) * v' i : ℚ)} = ⊤ := by
  sorry

/-- For two nonzero rational linear forms on `ℤ^r`, `r ≥ 2`, some primitive vector makes both
large. README 10.4. -/
theorem exists_primitive_large (r : ℕ) (hr : 2 ≤ r) (ℓ₁ ℓ₂ : (Fin r → ℚ) →ₗ[ℚ] ℚ)
    (h₁ : ℓ₁ ≠ 0) (h₂ : ℓ₂ ≠ 0) (B : ℚ) :
    ∃ v : Fin r → ℤ, IsPrimitiveVector v ∧ B < |ℓ₁ (fun i => (v i : ℚ))| ∧
      B < |ℓ₂ (fun i => (v i : ℚ))| := by
  sorry

/-- The vector `(1, 0)` is primitive and `(2, 4)` is not. -/
example : IsPrimitiveVector ![(1 : ℤ), 0] ∧ ¬ IsPrimitiveVector ![(2 : ℤ), 4] := by
  unfold IsPrimitiveVector
  decide

end Lattices

/-! ## Layer LV.11: Faltings's theorem -/

section Mordell

open CategoryTheory _root_.AlgebraicGeometry

universe u

/-- Faltings finiteness by the Lawrence–Venkatesh method. README 11.6. -/
theorem mordell_finite (K : Type u) [Field K] [NumberField K]
    (C : Scheme.{u}) [C.Over (Spec (.of K))]
    [Smooth (C ↘ Spec (.of K))] [IsProper (C ↘ Spec (.of K))]
    [GeometricallyConnected (C ↘ Spec (.of K))]
    [FiniteDimensional K (TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology
      (TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial C).obj 1)]
    (hdim : topologicalKrullDim C = 1) (hg : 2 ≤ C.genus K) :
    Finite (Over.mk (𝟙 (Spec (.of K))) ⟶ Over.mk (C ↘ Spec (.of K))) := by
  sorry

end Mordell

section Auxiliary

/-- The auxiliary prime of Lawrence–Venkatesh: given a degree `n`, a discriminant `D`, a genus `g ≥ 2`
and a bound `B`, there is a prime `q > B` with `4 ∤ q − 1`, no odd prime below `8n` dividing `q − 1`,
no odd prime factor of `q − 1` dividing `D`, and `8 · 2^(g+1) / (q − 1)^g < 1 / ((g − 1/2)(q − 1) + 1)`.
README 11.1. -/
theorem exists_admissible_prime (n : ℕ) (D : ℤ) (hD : D ≠ 0) (g : ℕ) (hg : 2 ≤ g) (B : ℕ) :
    ∃ q : ℕ, q.Prime ∧ B < q ∧ ¬ 4 ∣ q - 1 ∧
      (∀ ℓ : ℕ, ℓ.Prime → ℓ ≠ 2 → ℓ < 8 * n → ¬ ℓ ∣ q - 1) ∧
      (∀ ℓ : ℕ, ℓ.Prime → ℓ ≠ 2 → ℓ ∣ q - 1 → ¬ (ℓ : ℤ) ∣ D) ∧
      (8 * 2 ^ (g + 1) : ℝ) / ((q : ℝ) - 1) ^ g < 1 / (((g : ℝ) - 1 / 2) * ((q : ℝ) - 1) + 1) := by
  sorry

/-- Few elements lie in short Frobenius orbits (README 11.4): on a free `ℤ/N`-module of rank `2g`,
`N = 2m'` with `m'` odd, with a perfect alternating pairing into `ℤ/N` multiplied by `u` under `T`,
where `u` is a positive integer representing a unit modulo `N` and `u^i − 1` is prime to `m'` for `1 ≤ i ≤ 7`, each fixed module
`ker(T^i − 1)`, `1 ≤ i ≤ 7`, has at most `2^g N^g` elements. -/
theorem card_fixed_le (g N : ℕ) (hN : N % 4 = 2) (M : Type*) [AddCommGroup M] [Module (ZMod N) M]
    [Module.Free (ZMod N) M] [Module.Finite (ZMod N) M] (hrank : Module.finrank (ZMod N) M = 2 * g)
    (P : LinearMap.BilinForm (ZMod N) M) (hP : P.IsAlt) (hperf : Function.Bijective P)
    (T : M ≃ₗ[ZMod N] M) (u : ℕ) (hu₀ : 1 ≤ u) (hunit : Nat.Coprime u N) (hT : ∀ x y, P (T x) (T y) = (u : ZMod N) * P x y)
    (hu : ∀ i, 1 ≤ i → i ≤ 7 → Nat.Coprime (u ^ i - 1) (N / 2))
    (i : ℕ) (hi₁ : 1 ≤ i) (hi₇ : i ≤ 7) :
    Nat.card {x : M // (T ^ i) x = x} ≤ 2 ^ g * N ^ g := by
  sorry

end Auxiliary

/-!
Other README targets are omitted below: some require geometric or arithmetic carriers that do
not exist at the pins, and others have no representative signature in this selection. The README
retains their full statements. The adapted-basis assertion of 3.2 also remains there; the active
signature above states its complement consequence.

README-only API contracts accompanying the retained definitions:
* §0.3: `semilinearCentralizer_le_pow`, `units_semilinearCentralizer`,
  `semilinearCentralizer_linear`, `semilinearCentralizer_conj`,
  `semilinearCentralizer_scalar`, `semilinearCentralizer_fixedScalar` describe powers,
  units, the linear case, conjugacy, descent and fixed scalars.
* §0.7: `affinePermGroup.mem_iff`, `affinePermGroup.mul_apply`,
  `affinePermGroup.stabilizer_zero`, `affinePermGroup.commutator_eq` describe the
  permutation image and the formulas for evaluation, stabilizers and commutators.
* §0.14: `symplecticTransvection_eq_transvection`, `symplecticTransvection_sl2`
  identify the library transvection and its matrix on a symplectic plane.
* §1.4: `largestCMSubfield_map`, `largestCMSubfield_cyclotomic` give field-isomorphism
  functoriality and the cyclotomic case.
* §1.12: `filtrationWeight_eq`, `filtrationWeight_det`, `filtrationWeight_directSum`,
  `filtrationWeight_restrictScalars`, `filtrationWeight_sub_quotient`,
  `filtrationWeight_twist`, `filtrationWeight_example` are adapters on the supplied
  filtered carrier and mean Hodge weight.
* §6.4: `legendreCurve.j_one_seven_two_eight` names the special-value check.
* §7.1: `sizeV_indep`, `sizeV_scheme`, `sizeV_eq_places`, `sizeV_cycle` relate the
  finite-permutation definition to Frobenius, finite etale schemes and local degrees.
* §8.2: `singlyRamifiedSurjections.stabilizer_eq` gives the graph stabilizer.

Layer LV.0: 0.1 Splitting of a finite separable extension after base change to a splitting
field; 0.2 Idempotent decomposition of a module over a split étale algebra; 0.5 The unit group
of a finite-dimensional algebra as an algebraic group; 0.6 Frobenius centralizers over
unramified extensions of a p-adic field; 0.10 The commutator-product map on Aff(q)^{2s} (LV20
Lemma 2.11); 0.15 Finite-index, normality and connectedness properties of subgroup closures;
0.17 Centre and geometric normal subgroups of the symplectic group; 0.18 Orbit maps,
transporters and dimensions of orbit closures; 0.19 The Zariski closure of the powers of a
transvection; 0.20 Two transvections with nonzero pairing (LV20 Lemma 2.13); 0.21 Transvections
along a connected intersection graph (LV20 Lemma 2.14); 0.23 Ideals in a finite product of
nonabelian simple Lie algebras; 0.24 Goursat's lemma for simple Lie algebras (Ribet); 0.25 A
closed subgroup of Sp(V) × Sp(V) with surjective projections and an unbalanced unipotent pair;
0.26 Zariski-closed subgroups of Sp(V)^N (LV20 Lemma 2.12).

Layer LV.1: 1.1 A finite Frobenius test set; 1.2
Faltings's finiteness lemma (LV20 Lemma 2.3); 1.3 CM or totally real fields via complex
conjugations; 1.5 Friendly places (LV20 Definition 2.7); 1.6 Functions on embeddings with
constant conjugate sum factor through the largest CM subfield (Artin–Weil); 1.7 The local Artin
map on units is onto inertia; 1.8 Continuous Galois characters as idele class characters; 1.9
At a friendly place a place-constant function with the conjugation relation takes the value w/2;
1.10 Global purity forces the conjugation relation on Hodge–Tate exponents; 1.11 Pure characters
at friendly places (LV20 Lemma 2.8, stated on units); 1.13 Hodge weight of a pure representation
at a friendly place (LV20 Lemma 2.9); 1.14 D_dR of an induced representation at a place; 1.15
Hodge weights summed over places above a friendly place (LV20 Lemma 2.10); 1.16 The Galois
representation on H¹ of an abelian variety.

Layer LV.2: 2.1 Abelian-by-finite families (LV20 Definition 5.1); 2.2 Good models over rings of
S-integers; 2.3 Existence of good models after enlarging S; 2.4 The de Rham bundle of an
abelian-by-finite family; 2.5 Residue disks and their coordinates; 2.6 Formal horizontal
sections of an integrable connection with integral coefficients; 2.7 p-adic convergence of
formal horizontal sections on the residue disk; 2.8 Complex convergence of formal horizontal
sections (majorants); 2.9 p-adic Gauss–Manin transport on a residue disk (LV20 (3.7)); 2.10
Complex Gauss–Manin transport and Betti parallel transport (LV20 (3.8)); 2.11 Crystalline
Frobenius on the de Rham cohomology of the fibres and its compatibility with Gauss–Manin
transport (LV20 (3.9)).

Layer LV.3: 3.3 Transitivity on Lagrangian subspaces; 3.4 Symmetric graph charts; 3.5 Arnold
chart cover; 3.6 The Lagrangian Grassmannian; 3.7 The Lagrangian Grassmannian is smooth,
projective and geometrically irreducible of dimension d(d+1)/2; 3.8 The Lagrangian period
variety of a symplectic module over a finite étale algebra; 3.9 Geometry of the period variety;
3.10 Complex points of a geometrically connected variety are connected; 3.11 The algebraic
monodromy group of an abelian-by-finite family and full monodromy (LV20 (3.5), (5.1)); 3.12 The
p-adic period map on a residue disk; 3.13 The complex period map and its equivariant
continuation to the universal cover; 3.14 The complex and p-adic period maps are given by one
tuple of power series over K; 3.15 The Zariski closure of the complex period image contains the
monodromy orbit (LV20 Lemma 3.1); 3.16 A power series vanishing on an open polydisk is zero;
3.17 Complex and v-adic Zariski closures of a power-series map descend to one K-subscheme (LV20
Lemma 3.2); 3.18 Zariski closure of the p-adic period image (LV20 Lemma 3.3) and density under
full monodromy; 3.19 On a curve, the p-adic period map meets a closed subset not containing its
image in finitely many points.

Layer LV.4: 4.1 The fibre representations are crystalline with the de Rham cohomology of the
fibre as filtered φ-module; 4.2 The filtered φ-module of a fibre read off from the period map
(LV20 (6.6)–(6.7)); 4.3 Filtrations with isomorphic filtered φ-modules form a Frobenius-
centralizer orbit of bounded dimension; 4.4 Finiteness criterion on a residue disk of a curve;
4.5 Fibres with good reduction and semisimple Galois representation (LV20 Proposition 3.4, for
curves).

Layer LV.5: 5.1 Surfaces with boundary and punctures; 5.3
Every compact surface can be triangulated (Radó); 5.4 Classification of compact surfaces; 5.5
Duality and the intersection form on a compact oriented surface; 5.6 Homology, type and
intersection form of an oriented surface; 5.7 Annular neighbourhoods and cutting; 5.8 Oriented
simple closed curves; 5.9 The mapping class group; 5.10 Change of coordinates for simple closed
curves; 5.11 Dehn twists; 5.12 Action of Dehn twists and multitwists on homology; 5.13 Primitive
homology classes are represented by simple closed curves; 5.14 The homotopy exact sequence of a
fibre bundle; 5.15 Oriented surfaces other than the sphere are aspherical; 5.16 Surface groups
of negative Euler characteristic have trivial centre; 5.17 The evaluation fibration of the
homeomorphism group; 5.18 Contractibility of the identity component (Hamstrom); 5.19 The point-
pushing homomorphism; 5.20 The Birman exact sequence and pushes of simple loops; 5.21 Capping
boundary circles and forgetting points are surjective on mapping class groups; 5.22 Surjectivity
of the symplectic representation; 5.23 The configuration fibration of a surface and its
fundamental groups; 5.24 Lifting homeomorphisms to covers; 5.25 Lifting powers of Dehn twists to
finite coverings; 5.26 Monodromy of families of branched covers over configuration spaces.

Layer LV.6: 6.1 Reductions for the S-unit equation; 6.2 The Kummer fields of non-square S-unit
solutions; 6.3 An auxiliary place inert in a cyclic extension; 6.5 Monodromy of the Legendre
family; 6.6 A closed subgroup of a product of SL₂'s with surjective projections and factorwise
unipotents is everything; 6.7 Big monodromy for the cyclic variant of the Legendre family (LV20
Lemma 4.3); 6.8 Generic simplicity of the Legendre curves (LV20 Lemma 4.4); 6.9 Finiteness in a
residue disk (LV20 Lemma 4.2).

Layer LV.7: 7.2 Frobenius orbits on geometric points are the places above v; 7.3 Finite
surjective morphisms preserve dimension; 7.4 General position for tuples of Lagrangians (LV20
Lemma 6.4); 7.5 Lagrangians meeting a Frobenius-stable subspace in half its dimension (LV20
Lemma 6.3); 7.6 Bad points produce a Frobenius-stable subspace with large Hodge filtration
(Sublemma in LV20 §6); 7.7 Generic simplicity along the family (LV20 Lemma 6.1); 7.8 Galois
representations really vary in the family (LV20 Lemma 6.2); 7.9 Rational points on the base of
an abelian-by-finite family (LV20 Proposition 5.3).

Layer LV.8: 8.1 The complex points of a curve form a closed surface of the same genus; 8.3
Unique extension of the action to an overgroup; 8.4 Normalization, finite covers and
analytification; 8.5 The complex Hurwitz space of G-covers branched at one point (LV20 §7.3);
8.6 Descent of the Hurwitz covering to K (LV20 Lemma 7.4); 8.7 Hurwitz spaces of G-covers
branched at one point (LV20 Proposition 7.1); 8.9 The connected kernel of an endomorphism of an
abelian scheme; 8.10 The reduced relative Prym of a family of Aff(q)-covers; 8.11 Homology of
the Jacobian of a compact Riemann surface; 8.12 Homology of the reduced Prym is the primitive
homology of the degree-q cover; 8.13 The Kodaira–Parshin family (LV20 Definitions 7.2–7.3); 8.14
The map from Kodaira–Parshin fibres to H¹(Y, ℤ/(q − 1)) (LV20 (5.5)).

Layer LV.9: 9.1 Aff(q)-covers and singly ramified Aff(q)-covers (LV20 §8.2); 9.2 Primitive
homology of a covering; 9.4 Lifted mapping classes and the monodromy maps Mon (LV20
(8.2)–(8.5)); 9.5 Classes of the preimage circles (LV20 Lemma 8.2); 9.6 The rank of a lifted
twist detects the cycle type (LV20 Lemma 8.3); 9.7 Liftable curves and their transvections; 9.8
Liftable-curve monodromy and primitive intersection; 9.9 Mapping classes of a surface with two
boundary circles realize Sp(V, b) (LV20 Lemma 8.4); 9.11 Normal form of a singly ramified
Aff(q)-cover (LV20 Proposition 8.5); 9.12 Curves on the torus part of the normal form (LV20
Lemma 8.11).

Layer LV.10: 10.1 Point-pushing acts non-centrally on each factor (LV20 Lemma 8.6); 10.2
Distinct covers are distinguished by the cycle type along a simple closed curve (LV20 Lemma
8.8); 10.5 A connected spanning system of liftable curves (LV20 Lemma 8.10); 10.6 Zariski
density on one factor (LV20 Lemma 8.9); 10.7 Zariski density on the product (LV20 Lemma 8.7);
10.8 Closed normal subgroups of products of symplectic groups; 10.9 Zariski density of the
point-pushing monodromy (LV20 Theorem 8.1); 10.10 The Kodaira–Parshin family has full monodromy
(LV20 §8.2.3).

Layer LV.11: 11.2 Choice of the friendly place v (LV20 §5); 11.3 The Weil pairing on H¹(Y, ℤ/(q
− 1)) and the Frobenius at v; 11.5 The size bound (LV20 (5.4)).

-/

end TauCetiRoadmap.MordellLawrenceVenkatesh
