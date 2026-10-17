import Mathlib
import TauCeti.AlgebraicGeometry.LineBundle.Rigidified.Basic
import TauCeti.AlgebraicGeometry.LineBundle.Rigidified.Automorphisms

/-!
# PotentialModularityAndCompatibleSystems: representative target signatures

The roadmap is `README.md`. These are suggested forms, not an exhaustive checklist: this file
states the light definitions and the milestones whose carriers exist at the pinned Mathlib and Tau
Ceti. The compatible-system carriers, Skolem data, rigidified Picard functors, moduli applications, deformation rings, Hecke algebras and modularity theorems are README
targets. Archimedean expressions distinguish meromorphic cancellation from pointwise division in the
total Gamma functions; lift parameters encode only the numerical restrictions of the four
Khare–Wintenberger lift types.
-/

universe u
noncomputable section
namespace TauCetiRoadmap.PotentialModularityAndCompatibleSystems

/-! ## Layer 1: Compatible-family infrastructure -/

namespace Factors

/-- The normalized reciprocal polynomial, for a monic characteristic polynomial whose
constant coefficient is nonzero. In rank zero the polynomial is `1`. -/
def dualPolynomial {M : Type u} [Field M] (Q : Polynomial M) : Polynomial M :=
  Polynomial.C ((Q.coeff 0)⁻¹) * Q.reverse

/-- Reciprocal roots in rank one: the root `2` becomes `1/2`. -/
example : dualPolynomial (Polynomial.X - Polynomial.C (2 : ℚ)) =
    Polynomial.X - Polynomial.C (1 / 2 : ℚ) := by
  unfold dualPolynomial
  have h1 : (1 : Polynomial ℚ).reverse = 1 := by simpa using Polynomial.reverse_C (1 : ℚ)
  have hX : (Polynomial.X : Polynomial ℚ).reverse = 1 := by
    have h := Polynomial.reverse_mul_X (1 : Polynomial ℚ)
    rw [one_mul] at h
    rw [h, h1]
  have h : (Polynomial.X - Polynomial.C (2 : ℚ)).reverse = 1 - Polynomial.C 2 * Polynomial.X := by
    rw [sub_eq_add_neg, ← Polynomial.C_neg, Polynomial.reverse_add_C, hX, Polynomial.natDegree_X,
      pow_one, Polynomial.C_neg]
    ring
  rw [h]
  simp only [Polynomial.coeff_sub, Polynomial.coeff_X_zero, Polynomial.coeff_C_zero]
  rw [show ((0:ℚ) - 2)⁻¹ = -1/2 by norm_num]
  rw [mul_sub, mul_one, ← mul_assoc, ← Polynomial.C_mul]
  norm_num
  ring

/-- The zero-dimensional characteristic polynomial is preserved. -/
example : dualPolynomial (1 : Polynomial ℚ) = 1 := by
  have h1 : (1 : Polynomial ℚ).reverse = 1 := by simpa using Polynomial.reverse_C (1 : ℚ)
  simp [dualPolynomial, h1]

/-- A noninvertible operator is outside the domain of the characteristic-polynomial rule. -/
example : dualPolynomial (Polynomial.X : Polynomial ℚ) = 0 := by
  simp [dualPolynomial]

/-- Integer real-place multiplicities `d^±` (BLGGT v4 §5.1, pp. 63–64): `n/2` for `n` even and
`(n ± (−1)^{w/2} det ℛ(c_v))/2` for `n` odd. Interpreting these as nonnegative multiplicities
requires determinant ±1 and, in odd rank, even weight. -/
def archimedeanD (n : ℕ) (w detc : ℤ) : ℤ × ℤ :=
  if Even n then ((n : ℤ) / 2, (n : ℤ) / 2)
  else (((n : ℤ) + (if Even (w / 2) then (1 : ℤ) else -1) * detc) / 2,
    ((n : ℤ) - (if Even (w / 2) then (1 : ℤ) else -1) * detc) / 2)

/-- The pointwise archimedean quotient expression of BLGGT v4 §5.1, pp. 63–64.
It agrees with the meromorphic expression where `Gammaℂ (s - w/2)` is nonzero;
elsewhere removable singularities must be cancelled before evaluation. -/
def archimedeanGammaFactor (realPlace : Bool) (H Hbar : Multiset ℤ) (w : ℤ)
    (dplus dminus : ℕ) (s : ℂ) : ℂ := by
  classical
  let central := Complex.Gammaℂ (s - (w : ℂ) / 2)
  let shifts := fun (A : Multiset ℤ) =>
    ((A.filter (fun h => 2 * h < w)).map
      (fun (h : ℤ) => Complex.Gammaℂ (s - (h : ℂ)) / central)).prod
  exact if realPlace then
    Complex.Gammaℝ (s - (w : ℂ) / 2) ^ dplus *
      Complex.Gammaℝ (s + 1 - (w : ℂ) / 2) ^ dminus * shifts H
    else central ^ H.card * shifts H * shifts Hbar

/-- The archimedean root number `ε_v = i^{d^− + Σ |h − w/2|}` (real) or
`i^{Σ_{H_τ} |h − w/2| + Σ_{H_{τ'}} |h − w/2|}` (complex). -/
def archimedeanEpsilon (realPlace : Bool) (H Hbar : Multiset ℤ) (w : ℤ) (dminus : ℕ) : ℂ := by
  classical
  let magnitude := fun (A : Multiset ℤ) =>
    (A.map (fun (h : ℤ) => |(h : ℝ) - (w : ℝ) / 2|)).sum
  exact Complex.I ^ ((if realPlace then (dminus : ℝ) + magnitude H
    else magnitude H + magnitude Hbar) : ℂ)

/-- Rank zero, even rank, and the real odd sign distinguish the multiplicity rule. -/
example : archimedeanD 0 0 1 = (0, 0) ∧ archimedeanD 2 1 (-1) = (1, 1) ∧
    archimedeanD 1 0 (-1) = (0, 1) := by decide

/-- The geometric cyclotomic character has weight `-2` and odd determinant. -/
example : archimedeanD 1 (-2) (-1) = (1, 0) := by decide

/-- The trivial real character fixes the Gamma and epsilon normalizations. -/
example (s : ℂ) :
    archimedeanGammaFactor true {0} {0} 0 1 0 s = Complex.Gammaℝ s ∧
    archimedeanEpsilon true {0} {0} 0 0 = 1 := by
  simp [archimedeanGammaFactor, archimedeanEpsilon, Multiset.filter_singleton]

/-- The sign character instead has real factor `Gammaℝ (s+1)` and epsilon `i`. -/
example (s : ℂ) :
    archimedeanGammaFactor true {0} {0} 0 0 1 s = Complex.Gammaℝ (s + 1) ∧
    archimedeanEpsilon true {0} {0} 0 1 = Complex.I := by
  simp [archimedeanGammaFactor, archimedeanEpsilon, Multiset.filter_singleton]

/-- At a complex place the two embeddings give the single complex factor in rank one. -/
example (s : ℂ) :
    archimedeanGammaFactor false {0} {0} 0 0 0 s = Complex.Gammaℂ s ∧
    archimedeanEpsilon false {0} {0} 0 0 = 1 := by
  simp [archimedeanGammaFactor, archimedeanEpsilon, Multiset.filter_singleton]

/-- The empty product in rank zero is one, even at a pole of the auxiliary Gamma factor. -/
example (s : ℂ) :
    archimedeanGammaFactor false 0 0 0 0 0 s = 1 ∧
    archimedeanEpsilon false 0 0 0 0 = 1 := by
  simp [archimedeanGammaFactor, archimedeanEpsilon]

/-- The geometric cyclotomic Hodge weight is `-1`. -/
example (s : ℂ) :
    archimedeanGammaFactor true {-1} {-1} (-2) 1 0 s = Complex.Gammaℝ (s + 1) ∧
    archimedeanEpsilon true {-1} {-1} (-2) 0 = 1 := by
  simp [archimedeanGammaFactor, archimedeanEpsilon, Multiset.filter_singleton]

/-- Elliptic-curve cancellation is pointwise valid away from the denominator's poles. -/
example (s : ℂ) (hs : ∀ n : ℕ, s - 1 / 2 ≠ -(n : ℂ)) :
    archimedeanGammaFactor true {0, 1} {0, 1} 1 1 1 s = Complex.Gammaℂ s ∧
    archimedeanEpsilon true {0, 1} {0, 1} 1 1 = -1 := by
  have hne : Complex.Gammaℂ (s - 1 / 2) ≠ 0 := by
    rw [Complex.Gammaℂ_def]
    exact mul_ne_zero (mul_ne_zero two_ne_zero
      (Complex.cpow_ne_zero_iff.mpr (Or.inl (by simp [Real.pi_ne_zero]))))
      (Complex.Gamma_ne_zero hs)
  constructor
  · have hdup := Complex.Gammaℝ_mul_Gammaℝ_add_one (s - 2⁻¹)
    have hne' : Complex.Gammaℂ (s - 2⁻¹) ≠ 0 := by simpa [one_div] using hne
    simp [archimedeanGammaFactor, Multiset.filter_singleton]
    rw [show s + 1 - 2⁻¹ = s - 2⁻¹ + 1 by ring, hdup]
    rw [mul_comm]
    exact div_mul_cancel₀ _ hne'
  · simp only [archimedeanEpsilon, ite_true]
    norm_num

/-- The raw quotient is zero at `s=1/2`, while its meromorphic continuation is nonzero. -/
example : archimedeanGammaFactor true {0, 1} {0, 1} 1 1 1 (1 / 2) = 0 ∧
    Complex.Gammaℂ (1 / 2) ≠ 0 := by
  constructor
  · simp [archimedeanGammaFactor, Complex.Gammaℂ]
  · rw [Complex.Gammaℂ]
    refine mul_ne_zero (mul_ne_zero two_ne_zero ?_) (Complex.Gamma_ne_zero_of_re_pos (by norm_num))
    exact Complex.cpow_ne_zero_iff.mpr (Or.inl (by simp [Real.pi_ne_zero]))

/-- The rank-two reciprocal formula uses a nonzero determinant. -/
example (a b : ℚ) (hb : b ≠ 0) :
    dualPolynomial (Polynomial.X ^ 2 - Polynomial.C a * Polynomial.X + Polynomial.C b) =
      Polynomial.X ^ 2 - Polynomial.C (a / b) * Polynomial.X + Polynomial.C (1 / b) := by
  have hd : (Polynomial.X ^ 2 - Polynomial.C a * Polynomial.X + Polynomial.C b).natDegree = 2 := by
    compute_degree!
  have hx : Polynomial.reflect 2 (Polynomial.X : Polynomial ℚ) = Polynomial.X := by
    simpa only [Polynomial.revAt_le (by decide : 1 ≤ 2), Nat.reduceSub, pow_one] using
      (Polynomial.reflect_monomial 2 1 (R := ℚ))
  have hr : (Polynomial.X ^ 2 - Polynomial.C a * Polynomial.X + Polynomial.C b).reverse =
      1 - Polynomial.C a * Polynomial.X + Polynomial.C b * Polynomial.X ^ 2 := by
    rw [Polynomial.reverse, hd]
    simp only [sub_eq_add_neg, Polynomial.reflect_add, Polynomial.reflect_neg,
      Polynomial.reflect_C_mul, Polynomial.reflect_monomial, Polynomial.reflect_C, hx,
      Polynomial.revAt_le (by decide : 2 ≤ 2), Nat.sub_self, pow_zero]
  rw [dualPolynomial, hr]
  norm_num only [Polynomial.coeff_add, Polynomial.coeff_sub, Polynomial.coeff_X_pow,
    Polynomial.coeff_C_mul, Polynomial.coeff_X_zero, Polynomial.coeff_C_zero]
  simp only [mul_add, mul_sub, mul_one, ← mul_assoc, ← Polynomial.C_mul]
  simp [hb, div_eq_mul_inv, mul_comm]
  ring

/-- The weight-three CM newform at 3 retains its quadratic nebentypus value `-1`. -/
example :
    (Polynomial.X ^ 2 - Polynomial.C (0 : ℚ) * Polynomial.X +
      Polynomial.C ((-1 : ℚ) * 3 ^ 2)) = Polynomial.X ^ 2 - Polynomial.C (9 : ℚ) := by
  norm_num [sub_eq_add_neg]

end Factors

namespace HodgeChecks

/-- A finite Hodge multiset is regular and distinguishes sums of equal-size submultisets. -/
def IsExtremelyRegular (H : Multiset ℤ) : Prop :=
  H.Nodup ∧ ∀ A ∈ H.powerset, ∀ B ∈ H.powerset,
    A.card = B.card → A.sum = B.sum → A = B

/-- The subset sums of `{0,1,3,7}` distinguish equal-size subsets. -/
example : IsExtremelyRegular {0, 1, 3, 7} := by
  unfold IsExtremelyRegular
  decide +kernel

/-- Distinct weights alone permit the collision `0+3=1+2`. -/
example : ({0, 1, 2, 3} : Multiset ℤ).Nodup ∧
    ¬ IsExtremelyRegular {0, 1, 2, 3} := by
  unfold IsExtremelyRegular
  decide +kernel

/-- A repeated weight fails ordinary and extreme regularity. -/
example : ¬ ({0, 0} : Multiset ℤ).Nodup ∧ ¬ IsExtremelyRegular {0, 0} := by
  unfold IsExtremelyRegular
  decide +kernel

/-- Symmetric-square weights of a regular rank-two multiset stay distinct. -/
example (h₁ h₂ : ℤ) (h : h₁ ≠ h₂) :
    ({2 * h₁, h₁ + h₂, 2 * h₂} : Multiset ℤ).Nodup := by
  simp only [Multiset.insert_eq_cons, Multiset.nodup_cons, Multiset.mem_cons,
    Multiset.mem_singleton, Multiset.nodup_singleton]
  constructor
  · rintro (he | he) <;> apply h <;> omega
  · exact ⟨fun he => h (by omega), True.intro⟩

/-- Tensor weights can repeat zero even when both factors are regular. -/
example : ({0, -1, 1, 0} : Multiset ℤ).count 0 = 2 ∧
    ¬ ({0, -1, 1, 0} : Multiset ℤ).Nodup := by decide

/-- Corrected tensor multipliers retain the odd CM value. -/
example : (1 : ℤ) * 1 = 1 ∧ (-1 : ℤ) * (-1) = 1 ∧
    (-1 : ℤ) * (-1) * (-1) = -1 ∧ (-1 : ℚ)⁻¹ = -1 := by norm_num

/-- The CM unit's two quadratic factors cancel in the tensor multiplier. -/
example (μ : ℤ) : μ * (-1) * (-1) = μ := by ring

end HodgeChecks

namespace RepRing

/-- The genuineness criterion behind the Brauer construction of Layer 12, in coordinates: a virtual
class `Σ nᵢ [Vᵢ]` in the basis of irreducibles has norm `Σ nᵢ²`; norm one and positive dimension
force it to be the class of a single irreducible (BLGGT v1 §5.4, item (9), p. 63). -/
theorem eq_single_one_of_norm_one {ι : Type*} (n : ι →₀ ℤ) (d : ι → ℤ) (hd : ∀ i, 0 < d i)
    (hnorm : (n.sum fun _ a => a ^ 2) = 1) (hdim : 0 < n.sum fun i a => a * d i) :
    ∃ i, n = Finsupp.single i 1 := by
  sorry

/-- For the cyclic group of order two, `3·1 − ε` has degree two but norm ten, so degree alone does not
make a virtual class genuine. -/
example : ((Finsupp.single (0 : Fin 2) (3 : ℤ) + Finsupp.single 1 (-1)).sum fun _ a => a ^ 2) = 10 := by
  rw [Finsupp.sum_of_support_subset _ (Finset.subset_univ _) _ (by simp)]
  simp [Fin.sum_univ_two]

/-- The class `2[V₁] − [V₂]` has norm five. -/
example : ((Finsupp.single (0 : Fin 2) (2 : ℤ) + Finsupp.single 1 (-1)).sum fun _ a => a ^ 2) = 5 := by
  rw [Finsupp.sum_of_support_subset _ (Finset.subset_univ _) _ (by simp)]
  simp [Fin.sum_univ_two]

/-- The regular character of C₂ minus its sign character is the trivial character. -/
example : (![2, 0] : Fin 2 → ℤ) - ![1, -1] = ![1, 1] := by
  ext i
  fin_cases i <;> norm_num

end RepRing

/-! ## Layer 2: Integral points and controlled fields -/

/-- A finite partition into splitting, unramified-extension and arbitrary-extension conditions.
Class `1` contains only nonarchimedean places (Qian Proposition 4.2, p.23). -/
structure LocalConditionPartition (Place : Type*) (nonarchimedean : Set Place) where
  places : Finset Place
  kind : ↥places → Fin 3
  unramified_nonarchimedean : ∀ v, kind v = 1 → v.1 ∈ nonarchimedean

/-- A place cannot carry both the splitting and unramified-extension prescriptions. -/
example {Place : Type*} {nonarchimedean : Set Place}
    (S : LocalConditionPartition Place nonarchimedean) (v : ↥S.places) :
    ¬ (S.kind v = 0 ∧ S.kind v = 1) := by
  rintro ⟨h0, h1⟩
  have h : (0 : Fin 3) = 1 := h0.symm.trans h1
  norm_num at h

/-- An archimedean place cannot carry an unramified-extension prescription. -/
example {Place : Type*} {nonarchimedean : Set Place}
    (S : LocalConditionPartition Place nonarchimedean) (v : ↥S.places)
    (hv : v.1 ∉ nonarchimedean) : S.kind v ≠ 1 :=
  fun h => hv (S.unramified_nonarchimedean v h)

namespace PicardChecks

open CategoryTheory AlgebraicGeometry TauCeti.AlgebraicGeometry

/-- A compatible sheaf isomorphism identifies rigidified isomorphism classes. -/
example {T X : Scheme} {s : T ⟶ X} (P Q : RigidifiedLineBundle s)
    (e : P.lineBundle.obj ≅ Q.lineBundle.obj)
    (he : (Scheme.Modules.pullback s).map e.hom ≫ Q.rigidification.hom = P.rigidification.hom) :
    RigidifiedLineBundleClass.mk P = RigidifiedLineBundleClass.mk Q :=
  RigidifiedLineBundleClass.mk_eq_mk_iff.mpr ⟨e, he⟩

/-- Forgetting a representative retains precisely its underlying line-bundle class. -/
example {T X : Scheme} {s : T ⟶ X} (P : RigidifiedLineBundle s) :
    RigidifiedLineBundleClass.toLineBundleClass (RigidifiedLineBundleClass.mk P) =
      LineBundleClass.mk P.lineBundle :=
  RigidifiedLineBundleClass.toLineBundleClass_mk P

/-- Whole-scheme rigidification trivializes the forgotten line bundle. -/
example (X : Scheme) (P : RigidifiedLineBundle (𝟙 X)) :
    RigidifiedLineBundleClass.toLineBundleClass (RigidifiedLineBundleClass.mk P) = 1 := by
  rw [RigidifiedLineBundleClass.toLineBundleClass_mk, LineBundleClass.mk_eq_one_iff]
  exact ⟨((Scheme.Modules.pullbackId X).app P.lineBundle.obj).symm ≪≫ P.rigidification⟩

/-- All whole-scheme rigidifications have the same compatible-isomorphism class. -/
example (X : Scheme) (P Q : RigidifiedLineBundle (𝟙 X)) :
    RigidifiedLineBundleClass.mk P = RigidifiedLineBundleClass.mk Q := by
  apply RigidifiedLineBundleClass.mk_eq_mk_iff.mpr
  let e : P.lineBundle.obj ≅ Q.lineBundle.obj :=
    ((Scheme.Modules.pullbackId X).app P.lineBundle.obj).symm ≪≫
      P.rigidification ≪≫ Q.rigidification.symm ≪≫
      (Scheme.Modules.pullbackId X).app Q.lineBundle.obj
  refine ⟨e, ?_⟩
  have hn := (Scheme.Modules.pullbackId X).hom.naturality e.hom
  dsimp at hn
  calc
    (Scheme.Modules.pullback (𝟙 X)).map e.hom ≫ Q.rigidification.hom =
        ((Scheme.Modules.pullback (𝟙 X)).map e.hom ≫
          (Scheme.Modules.pullbackId X).hom.app Q.lineBundle.obj) ≫
          (Scheme.Modules.pullbackId X).inv.app Q.lineBundle.obj ≫ Q.rigidification.hom := by
      simp only [Category.assoc, Iso.hom_inv_id_app_assoc]
    _ = ((Scheme.Modules.pullbackId X).hom.app P.lineBundle.obj ≫ e.hom) ≫
          (Scheme.Modules.pullbackId X).inv.app Q.lineBundle.obj ≫ Q.rigidification.hom := by
      rw [hn]
    _ = P.rigidification.hom := by simp [e]

end PicardChecks

namespace Fields

/-- Disjointness through towers (Qian §2, opening facts, p. 5): if `A` and `D` are linearly disjoint
over `C`, `D` is finite over `C` and `B ≤ A`, then `A ∩ BD = B`. -/
theorem inf_sup_eq_of_linearDisjoint {C Ω : Type*} [Field C] [Field Ω] [Algebra C Ω]
    (A B D : IntermediateField C Ω) [FiniteDimensional C D] (hBA : B ≤ A)
    (h : A.LinearDisjoint D) : A ⊓ (B ⊔ D) = B := by
  sorry

/-- The Galois-theoretic core of avoidance by extra split places (§2.13): if elements fixing every
point of `E` generate `Gal(D/K)`, then `E = K`. -/
theorem eq_bot_of_fixed_by_generators {K D : Type*} [Field K] [Field D] [Algebra K D]
    [FiniteDimensional K D] [IsGalois K D] (E : IntermediateField K D) (S : Set (D ≃ₐ[K] D))
    (hS : Subgroup.closure S = ⊤) (hfix : ∀ σ ∈ S, ∀ x ∈ E, σ x = x) : E = ⊥ := by
  sorry

/-- Linear disjointness from the base field is automatic. -/
example {C Ω : Type*} [Field C] [Field Ω] [Algebra C Ω] (A : IntermediateField C Ω) :
    A.LinearDisjoint (⊥ : IntermediateField C Ω) :=
  IntermediateField.LinearDisjoint.bot_right A

end Fields


/-! ## Layer 3: Auxiliary characters and moduli -/

namespace Auxiliary

/-- A residual order-three element need not have eigenvalues in its coefficient field. -/
example :
    let M : Matrix (Fin 2) (Fin 2) (ZMod 5) := !![0, -1; 1, -1]
    M ^ 3 = 1 ∧ M ≠ 1 ∧ ∀ x : ZMod 5, x ^ 2 + x + 1 ≠ 0 := by
  decide

/-- The order-three matrix has the nonsplit polynomial used in `taylorAux_split_eigenvalues`. -/
example :
    (!![0, -1; 1, -1] : Matrix (Fin 2) (Fin 2) (ZMod 5)).charpoly =
      Polynomial.X ^ 2 + Polynomial.X + 1 := by
  have : Fact ((1 : ℕ) < 5) := ⟨by decide⟩
  rw [Matrix.charpoly_fin_two]
  norm_num [Matrix.trace, Matrix.diag, Matrix.det_fin_two, Fin.sum_univ_two]


/-- For `l = 5`, the discriminant `1 − 4l = −19` of Taylor's Weil number is prime to `5`, so `5` is
unramified in `ℚ(√(1 − 4l))` (Taylor, Fontaine–Mazur, p. 7). -/
example : ¬ (5 : ℤ) ∣ 1 - 4 * 5 := by decide

/-- The auxiliary prime is taken larger than `3`: the index-two subgroup of the inertia of `ℚ_p` sees
the mod-`p` cyclotomic character with order `(p − 1)/2`, which is `1` exactly for `p = 3`. -/
theorem half_order_gt_one {p : ℕ} (hp : 3 < p) (hodd : Odd p) : 1 < (p - 1) / 2 := by
  obtain ⟨k, rfl⟩ := hodd
  omega

example : (3 - 1) / 2 = 1 := by decide

end Auxiliary

/-! ## Layer 4: Nonminimal local deformation obstruction -/

/-- The tame obstruction in §4.5 is nonzero in characteristic five. -/
example :
    let A : Matrix (Fin 2) (Fin 2) (ZMod 5) := !![1, 0; 0, -1]
    let B : Matrix (Fin 2) (Fin 2) (ZMod 5) := !![0, 1; 0, 0]
    A * B - B * A = 2 • B ∧ A * B - B * A ≠ 0 := by
  decide

/-! ## Layer 8: Finiteness of global rings -/

namespace PolarizedAdapter

/-- At an odd involution, the matrix used in the rank-two prolongation is symmetric. -/
example : Matrix.transpose (!![(0 : ℤ), -1; -1, 0]) = !![(0 : ℤ), -1; -1, 0] := by
  decide

/-- At the even involution, the skew matrix instead gives square `-1` in the prolongation. -/
example : (!![(0 : ℤ), -1; 1, 0] : Matrix (Fin 2) (Fin 2) ℤ) *
    !![(0 : ℤ), -1; 1, 0] = -1 := by
  ext i j
  fin_cases i <;> fin_cases j <;> norm_num [Matrix.mul_apply, Fin.sum_univ_two]

end PolarizedAdapter

/-! ## Layer 10: Prescribed lifts -/

namespace Presentations

/-- `R` has a presentation `𝒪⟦x₁, …, x_r⟧/(f₁, …, f_s)` as an `𝒪`-algebra. -/
def HasPresentation (O R : Type) [CommRing O] [CommRing R] [Algebra O R] (r s : ℕ) : Prop :=
  ∃ f : Fin s → MvPowerSeries (Fin r) O,
    Nonempty (R ≃ₐ[O] (MvPowerSeries (Fin r) O ⧸ Ideal.span (Set.range f)))

/-- `R` is flat over `𝒪` and a complete intersection of relative dimension `d`: a presentation
`𝒪⟦x₁, …, x_{s+d}⟧/(f₁, …, f_s)` by a regular sequence. -/
def IsFlatCompleteIntersection (O R : Type) [CommRing O] [CommRing R] [Algebra O R] (d : ℕ) :
    Prop :=
  Module.Flat O R ∧ ∃ (s : ℕ) (f : Fin s → MvPowerSeries (Fin (s + d)) O),
    RingTheory.Sequence.IsRegular (MvPowerSeries (Fin (s + d)) O) (List.ofFn f) ∧
    Nonempty (R ≃ₐ[O] (MvPowerSeries (Fin (s + d)) O ⧸ Ideal.span (Set.range f)))

/-- A nonzero finite algebra over a complete DVR with at most as many proper equations
as formal variables has equal counts and a regular sequence starting with a uniformizer
(Böckle’s appendix, Lemma 2, p. 5). The uniformizer is arbitrary, including for ramified DVRs. -/
theorem finite_presentation_complete_intersection
    {O R : Type} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [IsAdicComplete (IsLocalRing.maximalIdeal O) O]
    [CommRing R] [Nontrivial R] [Algebra O R] [Module.Finite O R]
    {n m : ℕ} (hmn : m ≤ n) (π : O)
    (hπ : Ideal.span ({π} : Set O) = IsLocalRing.maximalIdeal O)
    (f : Fin m → MvPowerSeries (Fin n) O)
    (hf : ∀ i, f i ∈ IsLocalRing.maximalIdeal (MvPowerSeries (Fin n) O))
    (e : R ≃ₐ[O] (MvPowerSeries (Fin n) O ⧸ Ideal.span (Set.range f))) :
    m = n ∧ Module.Flat O R ∧ RingTheory.Sequence.IsRegular (MvPowerSeries (Fin n) O)
      (algebraMap O (MvPowerSeries (Fin n) O) π :: List.ofFn f) := by
  sorry

/-- The zero-variable presentation recovers the coefficient ring. -/
example (O : Type) [CommRing O] : HasPresentation O O 0 0 := by
  refine ⟨Fin.elim0, ⟨(MvPowerSeries.isEmptyEquiv (σ := Fin 0) (R := O)).symm.trans ?_⟩⟩
  rw [Set.range_eq_empty, Ideal.span_empty]
  exact (AlgEquiv.quotientBot O _).symm

/-- Quotienting one variable by that variable gives the coefficient ring. -/
example (O : Type) [CommRing O] : HasPresentation O O 1 1 := by sorry

/-- A unit equation is permitted as a presentation but gives the zero algebra. -/
example : HasPresentation ℚ
    (MvPowerSeries (Fin 1) ℚ ⧸ Ideal.span ({1} : Set (MvPowerSeries (Fin 1) ℚ))) 1 1 :=
  ⟨fun _ => 1, ⟨by rw [Set.range_const]; exact AlgEquiv.refl⟩⟩

/-- A nonzero coefficient ring is flat over itself with the empty regular sequence. -/
example (O : Type) [CommRing O] [Nontrivial O] : IsFlatCompleteIntersection O O 0 := by sorry

/-- Over a nonzero noetherian coefficient ring, formal power series are flat and
the one-variable ring has relative dimension one. -/
example (O : Type) [CommRing O] [Nontrivial O] [IsNoetherianRing O] :
    IsFlatCompleteIntersection O (MvPowerSeries (Fin 1) O) 1 := by sorry

/-- The zero algebra fails the nonzero-quotient condition for a regular sequence. -/
example : ¬ IsFlatCompleteIntersection ℚ
    (MvPowerSeries (Fin 1) ℚ ⧸ Ideal.span ({1} : Set (MvPowerSeries (Fin 1) ℚ))) 0 := by sorry

/-- Torsion over the coefficient ring is incompatible with flatness. -/
example : ¬ IsFlatCompleteIntersection ℤ (ZMod 2) 0 := by sorry

end Presentations

namespace LiftParameters

/-- Numerical part of the four KW lift prescriptions (KW I Theorem 5.1, pp. 9–10).
The arithmetic `RequiredLiftType` additionally records its representation, determinant,
residual local shape and deformation conditions; this parameter type does not replace it. -/
inductive RequiredLiftParameters (p k : ℕ) where
  | minimalCrystalline (dyadic : p = 2 → k = 2)
  | weightTwo
  | levelOne (q i : ℕ) (prime : q.Prime) (odd : q ≠ 2) (divides : p ∣ q - 1)
      (range : 0 < i ∧ i ≤ q - 2) (dyadic : p = 2 → Even i)
  | levelTwo (q i j : ℕ) (prime : q.Prime) (ne : q ≠ p) (divides : p ∣ q + 1)
      (range : j < i ∧ i ≤ q - 1)
      (order : ∃ r : ℕ, (q ^ 2 - 1) / Nat.gcd (q ^ 2 - 1) (i + q * j) = p ^ r)
      (dyadic : p = 2 → Even (i + j))

namespace RequiredLiftParameters
variable {p k : ℕ}

/-- The auxiliary prime is present only for the last two prescriptions. -/
def auxiliaryPrime : RequiredLiftParameters p k → Option ℕ
  | levelOne q .. => some q
  | levelTwo q .. => some q
  | _ => none

/-- The noncrystalline prescriptions require monodromy at odd `k=p+1` and dyadic `k=4`. -/
def requiresSteinberg : RequiredLiftParameters p k → Prop
  | minimalCrystalline _ => False
  | _ => (p = 2 ∧ k = 4) ∨ (p ≠ 2 ∧ k = p + 1)

/-- The dyadic level-one character at `q=5` must have even exponent. -/
example (k : ℕ) : ¬ (2 = 2 → Even 1) ∧
    (RequiredLiftParameters.levelOne (p := 2) (k := k) 5 2 (by norm_num) (by norm_num)
      (by norm_num) (by norm_num) (fun _ => even_two)).auxiliaryPrime = some 5 :=
  ⟨by decide, rfl⟩

/-- At `q=7`, the exponent `6` gives order `8` and genuine level two. -/
example (k : ℕ) :
    (RequiredLiftParameters.levelTwo (p := 2) (k := k) 7 6 0 (by norm_num) (by norm_num)
      (by norm_num) (by norm_num) ⟨3, by norm_num⟩ (fun _ => by decide)).auxiliaryPrime = some 7 :=
  rfl

/-- At `q=5` no exponents satisfy all the dyadic level-two restrictions simultaneously. -/
example : ¬ ∃ (i j r : ℕ), j < i ∧ i ≤ 4 ∧ Even (i + j) ∧
    24 / Nat.gcd 24 (i + 5 * j) = 2 ^ r := by
  rintro ⟨i, j, r, hji, hi, hev, hr⟩
  have key : ∀ r : ℕ, 2 ^ r ≠ 12 ∧ 2 ^ r ≠ 6 ∧ 2 ^ r ≠ 3 := by
    intro r
    have h3 : ¬ 3 ∣ 2 ^ r := fun h =>
      absurd (Nat.Coprime.eq_one_of_dvd (Nat.Coprime.pow_right r (by norm_num)) h) (by norm_num)
    exact ⟨fun h => h3 (h ▸ by norm_num), fun h => h3 (h ▸ by norm_num), fun h => h3 (h ▸ by norm_num)⟩
  interval_cases i <;> interval_cases j <;> simp_all (config := {decide := true})

/-- The level-one prescription at `p=3,q=5` fails its divisibility condition. -/
example : ¬ 3 ∣ 5 - 1 := by decide

/-- The weight-two prescription has no auxiliary prime. -/
example (p k : ℕ) :
    (RequiredLiftParameters.weightTwo (p := p) (k := k)).auxiliaryPrime = none := rfl

/-- The exceptional weight requires Steinberg monodromy; weight two at `p=3` does not. -/
example : (RequiredLiftParameters.weightTwo (p := 3) (k := 4)).requiresSteinberg ∧
    ¬ (RequiredLiftParameters.weightTwo (p := 3) (k := 2)).requiresSteinberg := by
  simp [RequiredLiftParameters.requiresSteinberg]

/-- The dyadic exceptional weight four requires nonzero monodromy. -/
example : (RequiredLiftParameters.weightTwo (p := 2) (k := 4)).requiresSteinberg := by
  simp [RequiredLiftParameters.requiresSteinberg]

/-- Dyadic weight three does not trigger the exceptional numerical condition. -/
example : ¬ (RequiredLiftParameters.weightTwo (p := 2) (k := 3)).requiresSteinberg := by
  simp [RequiredLiftParameters.requiresSteinberg]

end RequiredLiftParameters
end LiftParameters

/-! ## Layer 13: Residual members and linked systems -/

namespace ResidualMembers

/-- The weight argument of §13.1: outside the small primes, the normalized weight `a − b + 1` of a
regular member is neither of the two weights `(l + 1)/2`, `(l + 3)/2` forced by a reducible
restriction to `ℚ(ζ_l)` (KW I, proof of Theorem 10.1, p. 20). -/
theorem weight_ne_half_weights {l a b : ℕ} (hodd : Odd l) (hab : b < a) (hl : 2 * (a - b) + 1 < l) :
    a - b + 1 ≠ (l + 1) / 2 ∧ a - b + 1 ≠ (l + 3) / 2 := by
  sorry

/-- For `a − b = 1` and `l = 3` the inequality fails and the weights collide: `2 = (3 + 1)/2`; for even
`l = 2(a − b) + 2` they would collide as well, which is why `l` is odd. -/
example : (1 : ℕ) + 1 = (3 + 1) / 2 := by decide

end ResidualMembers


/-! The following named targets are stated in README.md. Their arithmetic, geometric or
automorphic carriers require the supplier theories described there.
Layer 1: `conjugationExtendsIntegralModel`, `weakCompatibility_ofKW`, `CompatibleSystem`, `induce`, `PolarizedSystem`, `WeaklyCompatibleSystem.IsRegular`, `symmetricPower`, `rankZeroSystem`, `PolarizedSystem.tensor`, `characterSystem`, `rank_one_purity`, `induced_character_purity`, `artinSystem`, `artin_twist_purity`, `rank_two_reducibility_independent_of_lambda`, `partialLFunction`, `RepRing`, `RepRing.brauer_transport`, `RepRing.eq_irreducible_of_pairing_eq_one`, `monodromy_component_field`, `hodgeTateCocharacterInMonodromy`, `LarsenData.G`, `serre_theta_uniform_bounds`, `larsen_good_primes`, `residual_irreducibility_density_one`, `constituents_essentially_self_dual`.
Layer 2: `SkolemDatum`, `density_of_algebraic_local_points`, `elementary_reductions`, `reduction_to_curves`, `Picard.generalizedPicard`, `local_picard_opens_and_approximation`, `compact_generalized_jacobian_quotient`, `moret_bailly_integral_point`, `splitField_density_of_integralPoints`, `splitField_points_dense`, `function_field_chebotarev`, `frobenius_primes_generate`, `disjointness_by_extra_split_places`, `Fields.inf_sup_eq_of_linearDisjoint`, `cht_character_extension`, `cht_soluble_prescribed_completions`, `moret_bailly_three_local_conditions`, `moret_bailly_above_preliminary_field`, `snowden_soluble_preliminary_field`, `surjectiveSpecialisation`, `schemeChebotarevPoints`, `function_field_isom_torsor`, `fixed_constant_field`, `potential_global_galois_local_data`.
Layer 3: `exists_cm_character_with_local_reductions`, `TaylorAuxiliaryData`, `local_points_twisted_hilbert_moduli`, `restricted_auxiliary_moduli`, `jointPairedTorsionModuli`, `hilbertGoodReductionOpen`, `snowdenTwoPrimeRealization`.
Layer 4: `dyadicAuxiliaryModuli`, `auxiliary_tateModule_ordinary_shape`, `quaternionic_hecke_galois_realisation`, `local_residual_inertial_shape`, `skinner_wiles_level_adjustment`, `taylor_crystalline_lifting`, `taylorMinimalREqualsT`, `taylorNonminimalREqualsT`, `auxiliary_modularity_transfer`, `taylor_ordinary_potential_residual`, `taylor_niveau_two_potential_residual`, `weight_reduction_hecke_surjection`, `weightShift`, `weight_and_level_potential_residual`, `taylor_serre_weight_potential_residual`, `kw_potential_residual`, `kw_ordinary_potential_residual`, `snowdenCMSeed`, `snowdenWeightTwoLifting`, `snowdenWeightTwoRingFiniteness`, `snowdenPrescribedWeightTwoLift`, `snowdenResidualSolubleDescent`, `snowden_potential_residual`, `bcgp_potential_residual`.
Layer 5: `potential_modularity_given_lift`.
Layer 6: `controlled_extension`, `bcgp_local_data`.
Layer 8: `AuxiliaryField`, `kwGlobalFiniteness`, `DefiniteUnitaryTwo.ordinaryHeckeAlgebra`, `DefiniteUnitaryTwo.heckeGaloisRepresentation`, `rank_two_ordinary_patching`, `rank_two_ordinary_automorphy_and_finiteness`, `ordinary_global_finiteness`, `cgRingFiniteness`.
Layer 9: `exists_lift_of_required_type`, `newton_thorne_point`.
Layer 10: `bockle_presentation`, `Presentations.finite_presentation_complete_intersection`, `bockle_minimal_r_equals_t`, `exists_minimally_ramified_lift`, `RequiredLiftType`, `exists_minimal_crystalline_lift`, `exists_minimal_weight_two_lift`, `exists_lift_level_one_type_at_q`, `exists_lift_level_two_type_at_q`, `requiredLiftType_applications`, `modern_prescribed_type_lifts`.
Layer 11: `alpha_beta_from_residual_modularity`, `rational_field_modularity_lifting`.
Layer 12: `brauerSystem`, `brauerOverlapHomCharacters`, `almost_strict_compatibility`, `strict_brauer_system`, `exists_family_through_required_lift`, `dieulefait_families`.
Layer 13: `residual_members`, `local_compatibility_at_the_coefficient_prime`, `linked_systems_modularity_transfer`.
Taylor/HBAV branches carry the ordered polarization norm witnesses of §§3.2–3.3;
dyadic local constructions consume `dyadicAuxiliaryModuli` with its polarization hypotheses.
The niveau-two construction uses joint prime levels and polarization descent from §3.5;
`auxiliary_modularity_transfer` permits ramified coefficient primes and proves its crystalline
rank-two Hodge assertion via rational coefficient summands. Its lifting step uses the nonminimal
comparison of §4.5. Snowden's residual construction uses §3.6 and `snowdenCMSeed` before finiteness.
The family predicates and operations use the shared `AutomorphicSystemData` and its supplied
`Weak`, `Strict`, `VeryWeak` and `ExtremelyWeak` predicates. The additional KW, polarized,
regularity, purity, away-coefficient strictness and automorphy conditions are specified in §§1.2–1.8.
The full `cgRingFiniteness` and `dieulefait_families` retain the hypotheses in §§8.8 and 12.5;
their adequate-image and KW-type milestones do not discharge the remaining cases. -/

end TauCetiRoadmap.PotentialModularityAndCompatibleSystems
