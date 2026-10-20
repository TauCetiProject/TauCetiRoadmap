import Mathlib
import TauCeti.NumberTheory.NumberField.Global.RayClass.Modulus
import TauCeti.RepresentationTheory.ClassicalGroups.SymmetricPower
import TauCeti.RepresentationTheory.CharacterTwist

/-!
# GL₂ automorphic representations and transfer: representative target signatures

The mathematical roadmap is `README.md`. This file records light definitions and
end theorems and milestones statable against the pinned Mathlib and Tau Ceti APIs.
These are suggested forms, not an exhaustive checklist of the roadmap's targets.
The representative definitions include admitted proof obligations; constructor
and theorem signatures are admitted where indicated.

AutomorphicLFunctionsAndLocalFactors AL.2, GL₂ newvectors, supplies the lower-left
and last-row subgroups. The comparisons take supplied subgroups with explicit
membership equalities on the existing matrix groups. Local smoothness
and admissibility are hypotheses on Mathlib representations; no local or global
representation carrier is replaced. Frobenius is geometric in the automorphic
normalization, monodromy is retained, and coefficient twists use the existing
symmetric powers and character-twist API. Automorphic classes, local types,
Whittaker models and their transfer maps have their full specification in README.

R16.0.1 and R16.3.5 keep the inertia restriction, ramification-defined Artin/Swan
conductors, monodromy and the least last-row fixed level as separate interfaces.
ArithmeticGaloisRepresentations Layer 3 and §3.3 supplies
a(r,N) = a(r) + dim V^I - dim (ker N)^I. AL.2 GL₂ newvectors supplies c(π)
on generic classes.
The equality c(π) = a(rec π) and the normalized epsilon-exponent formula are
separate comparison theorems. The downstream construction
AutomorphicGaloisRepresentationsPartII's `semisimpleParameter` and statements of
semisimple local-global compatibility at ℓ ≠ p are independent of epsilon-compatibility;
monodromy identification and the twisted-factor comparison are further obligations.
Henniart's twisted-factor characterization gives uniqueness of the full correspondence.

ArithmeticGaloisRepresentations §2.7 supplies local-constant-gauss-sum,
standard-test-function-evaluations, hecke-zeta-integral-comparison and the
finite-sum root-number-product-formula. AutomorphicLFunctionsAndLocalFactors
AL.1/hecke-l-functional-equation supplies the canonical all-unitary scalar Hecke
completion and equation. AutomorphicSpectralTheory's unitary-hecke-functional-equation
identifies its Eisenstein construction with that completion.
AutomorphicLFunctionsAndLocalFactors AL.1/rank-one-local-functional-equation
supplies local zeta integrals and their comparison with tateLocalConstant.

AutomorphicFormsOnReductiveGroups §2.6 supplies the full-O(2) discrete and limit
modules and real/complex unitary classification with exhaustion. R16.2.13 identifies
its explicit K-type, reducibility and parameter dictionary with that classification.
Its §§7.2–7.3 supply adelization, its inverse, raising and Casimir formulas, scalar
normalization and Hecke and diamond comparisons.
R16.1/finite-level-comparison identifies these with the matrix and level realizations;
R16.6 compares the supplied primitive occurrence with local newvectors and conductors.
R17.6.1 and R17.6.4 use the algebraically normalized finite-part coefficient model
π_alg,f = π_unit,f ⊗ |det|^(-(k-2)/2) in the geometric parabolic-cohomology Hom.
Their local Weil–Deligne comparison uses π_unit,p after undoing this finite twist.

LocalGaloisDeformationRings §2.26.1 supplies `DivisionAlgebraTypes.jacquetLanglands`.
R17.1/local-quaternionic-comparison consumes its degree-two nonarchimedean
specialization on irreducible admissible smooth complex D× classes, directed to
essentially square-integrable GL₂ classes. The supplied character sign is -1;
central characters, contragredients and norm/determinant twists are compatible.
R17.1 packages its parameters and constructs the split and real comparisons;
R17.2 supplies matching test functions and R17.3 supplies global transfer.

AutomorphicSpectralTheory §§7.0a–7.0c and §7.1 supplies canonical cyclic matching,
normalized twisted distributions, weak isobaric base change, descent, fibres and
tower operations. R17.2 identifies the rank-two local conventions and six-term
ledger with those supplied objects. R17.4 strengthens the same weak outputs to
all-place WD compatibility after the Artin construction. The matrix-power
definition and the trace/determinant power-sum recursion below represent the
same rank-two Satake substitution. The shared eigensystems have coordinates
T_v = trace(A_v) and S_v = q_v⁻¹ det(A_v); their arithmetic-to-unitary
conversion is specified in README R16.4.4. The weak cubic output and the
outside-S converse remain README targets on the supplied automorphic carriers.

QuaternionicModularForms §§1.3, 2.1–2.2 and 3.1 supplies classical coefficient
conventions, canonical definite form spaces and the opposite-Hecke action.
R17.3/definite-hilbert-exports supplies the division-p coefficient and level-colimit
comparison with Pan, including dual coefficients, central action and inverse cosets.
R17.4/whittaker-type-adjoint-converse supplies the attached-module converse and
constituent argument for the adjoint lift without assuming local genericity.
Its cuspidal conclusion assumes no nontrivial Hecke-character self-twist;
quadratic induction supplies the self-twist case.
-/

noncomputable section

namespace TauCeti.GL2Transfer

open _root_.Matrix

/-! ## Layer R16.1: Arithmetic character prescription -/

/-- Descent and finite-character extension through an open finite quotient.
The congruence subgroup N is an input, not an arithmetic existence claim. -/
theorem finite_character_extension_iff
    {G : Type*} [CommGroup G] [TopologicalSpace G] [IsTopologicalGroup G]
    (H N : Subgroup G) [N.FiniteIndex] (hN : IsOpen (N : Set G))
    (χ : H →* ℂˣ) :
    (∃ Ψ : ContinuousMonoidHom G ℂˣ,
      (∀ h : H, Ψ h = χ h) ∧
      (∀ n ∈ N, Ψ n = 1) ∧
      (Set.range Ψ).Finite ∧
      (∀ g : G, Ψ g ^ Monoid.exponent (G ⧸ N) = 1)) ↔
    ∀ h : H, (h : G) ∈ N → χ h = 1 := by sorry

section ArithmeticCharacterPrescription
open NumberField IsDedekindDomain TauCeti.GlobalNumberFields
open scoped NumberField

variable {K : Type*} [Field K] [NumberField K]

/-- The arbitrary-subgroup adapter to HeightsAndUnits §4.2 S-unit finite generation. -/
theorem fg_of_units_outside_finset (E : Subgroup Kˣ)
    (S : Finset (HeightOneSpectrum (𝓞 K)))
    (hE : ∀ x : E, ∀ v : HeightOneSpectrum (𝓞 K), v ∉ S →
      v.valuation K (((x : Kˣ) : K)) = 1) : E.FG := by sorry

/-- Congruence away from a specified set detects powers in a finitely generated subgroup of a number field. -/
theorem chevalley_power_congruence (E : Subgroup Kˣ) [Group.FG E]
    (n : ℕ) (hn : 0 < n) (T : Finset (HeightOneSpectrum (𝓞 K))) :
    ∃ m : Modulus K, m.infinitePart = ∅ ∧ Disjoint m.support T ∧
      ∀ x : E, IsCongrOne m (x : Kˣ) → ∃ y : E, y ^ n = x := by sorry

/-- Congruence away from a specified set detects a finite-index subgroup. -/
theorem chevalley_finiteIndex_congruence (E : Subgroup Kˣ) [Group.FG E]
    (H : Subgroup E) [H.FiniteIndex] (T : Finset (HeightOneSpectrum (𝓞 K))) :
    ∃ m : Modulus K, m.infinitePart = ∅ ∧ Disjoint m.support T ∧
      ∀ x : E, IsCongrOne m (x : Kˣ) → x ∈ H := by sorry

/-- Finite-image local characters on full multiplicative completions extend to a finite Hecke character trivial at infinity. -/
theorem finite_hecke_full_local_prescription
    (S : Finset (HeightOneSpectrum (𝓞 K)))
    (χ : ∀ v : S, ContinuousMonoidHom (v.val.adicCompletion K)ˣ ℂˣ)
    (hχ : ∀ v : S, (Set.range (χ v)).Finite) :
    ∃ Ψ : ContinuousMonoidHom (IdeleClassGroup (𝓞 K) K) ℂˣ,
      (Set.range Ψ).Finite ∧
      (∀ v : S, Ψ.toMonoidHom.comp
        (IdeleClassGroup.ofAdicCompletion (𝓞 K) K v.val) = (χ v).toMonoidHom) ∧
      (∀ w : InfinitePlace K, Ψ.toMonoidHom.comp
        (IdeleClassGroup.ofCompletion (𝓞 K) K w) = 1) := by sorry

end ArithmeticCharacterPrescription

end TauCeti.GL2Transfer

namespace TauCeti.GL2Blueprint

open _root_.Matrix

/-! ## Layer R16.2: Local representations and level comparisons -/

section IwahoriOldforms
open scoped ValuativeRel
variable {F : Type*} [Field F] [CharZero F] [ValuativeRel F]
    [TopologicalSpace F] [IsNonarchimedeanLocalField F]
variable {V : Type*} [AddCommGroup V] [Module ℂ V]

-- K and I are the AL.2 integral maximal compact and lower-left level-one subgroup.
variable (K I : Subgroup (GeneralLinearGroup (Fin 2) F))
    (hK : ∀ g, g ∈ K ↔ ∃ k : GeneralLinearGroup (Fin 2) 𝒪[F],
      GeneralLinearGroup.map (algebraMap 𝒪[F] F) k = g)
    (hI : ∀ g, g ∈ I ↔ ∃ k : GeneralLinearGroup (Fin 2) 𝒪[F],
      GeneralLinearGroup.map (algebraMap 𝒪[F] F) k = g ∧ k.val 1 0 ∈ 𝓂[F])
include hK hI

/-- The supplied maximal compact has a one-dimensional fixed space and its
level-one Iwahori has a two-dimensional fixed space for an irreducible
infinite-dimensional spherical representation. Sources: Casselman, Corollary
to the Proof, p. 306; Calegari–Geraghty, §1.3, pp. 805–806. -/
theorem iwahoriOldforms_dimensions
    (π : Representation ℂ (GeneralLinearGroup (Fin 2) F) V)
    [Representation.IsIrreducible π]
    (hsm : ∀ v : V, IsOpen {g | π g v = v})
    (hadm : ∀ K : Subgroup (GeneralLinearGroup (Fin 2) F),
      IsCompact (K : Set (GeneralLinearGroup (Fin 2) F)) →
      IsOpen (K : Set (GeneralLinearGroup (Fin 2) F)) →
      FiniteDimensional ℂ (Representation.invariants (π.comp K.subtype)))
    (hinf : ¬ FiniteDimensional ℂ V)
    (hsph : ∃ v ∈ Representation.invariants (π.comp K.subtype), v ≠ 0) :
    Module.finrank ℂ (Representation.invariants (π.comp K.subtype)) = 1 ∧
      Module.finrank ℂ (Representation.invariants (π.comp I.subtype)) = 2 := by sorry

/-- For the supplied maximal compact K and Iwahori I, the oldform operator
is the finite sum of the concrete right-coset representatives of I diag(ϖ,1) I, with vol(I)=1. A is a full set
of residue representatives, so its cardinality is q. The sum acts by π;
there is no independent operator or replacement Hecke algebra in the input.
The spherical double coset adds s=diag(1,ϖ). Its eigenvalue λ is
sqrt(q)*(α+β); the scalar action c is ω(ϖ)=α*β.

In the basis (v,π(s)v), U has columns (λ,-1) and (q*c,0).
The -1 coefficient gives cyclicity also at a repeated Satake root.
Sources: CG20 §1.3, printed pp. 805–806; Casselman p. 306; the matrix computation
and coset normalization are explained in the README. -/
theorem iwahoriOldforms
    (π : Representation ℂ (GeneralLinearGroup (Fin 2) F) V)
    [Representation.IsIrreducible π]
    (hsm : ∀ v : V, IsOpen {g | π g v = v})
    (hadm : ∀ K : Subgroup (GeneralLinearGroup (Fin 2) F),
      IsCompact (K : Set (GeneralLinearGroup (Fin 2) F)) →
      IsOpen (K : Set (GeneralLinearGroup (Fin 2) F)) →
      FiniteDimensional ℂ (Representation.invariants (π.comp K.subtype)))
    (hinf : ¬ FiniteDimensional ℂ V)
    (ϖ : 𝒪[F]) (hϖ : Ideal.span ({ϖ} : Set 𝒪[F]) = 𝓂[F])
    (ϖF : Fˣ) (hϖF : (ϖF : F) = (ϖ : F))
    (A : Finset 𝒪[F]) (hA : ∀ x : 𝒪[F], ∃! a : A, x - a.val ∈ 𝓂[F])
    (g : A → GeneralLinearGroup (Fin 2) F)
    (hg : ∀ a, (g a).val = !![(ϖ : F), (a.val : F); 0, 1])
    (s : GeneralLinearGroup (Fin 2) F) (hs : s.val = !![1, 0; 0, (ϖ : F)])
    (v : V) (hv : v ∈ Representation.invariants (π.comp K.subtype))
    (hv0 : v ≠ 0) (lam c : ℂ)
    (hcent : ∀ w, π (GeneralLinearGroup.scalar (Fin 2) ϖF) w = c • w)
    (heigen : ((∑ a : A, π (g a)) + π s) v = lam • v) :
    let U : Module.End ℂ V := ∑ a : A, π (g a)
    Module.finrank ℂ (Representation.invariants (π.comp K.subtype)) = 1 ∧
      Module.finrank ℂ (Representation.invariants (π.comp I.subtype)) = 2 ∧
      Representation.invariants (π.comp I.subtype) =
        Submodule.span ℂ ({v, U v} : Set V) ∧
      (∀ a : ℂ, U v ≠ a • v) ∧
      (∀ w ∈ Representation.invariants (π.comp I.subtype),
        U w ∈ Representation.invariants (π.comp I.subtype) ∧
          U (U w) - lam • U w + ((A.card : ℂ) * c) • w = 0) := by sorry

/-- For the supplied integral and Iwahori subgroups, an unramified determinant
character has both invariant spaces equal to the whole ℂ line.
This calculation also applies to nontrivial χ. No genericity is assumed. -/
theorem iwahoriDeterminantCharacter
    (χ : Fˣ →* ℂˣ)
    (hχ : ∀ u : 𝒪[F]ˣ, χ (Units.map (algebraMap 𝒪[F] F).toMonoidHom u) = 1)
    (π : Representation ℂ (GeneralLinearGroup (Fin 2) F) ℂ)
    (hπ : ∀ g z, π g z = (χ (GeneralLinearGroup.det g) : ℂ) * z) :
    Representation.invariants (π.comp K.subtype) = ⊤ ∧
      Representation.invariants (π.comp I.subtype) = ⊤ ∧
      Module.finrank ℂ (Representation.invariants (π.comp K.subtype)) = 1 ∧
      Module.finrank ℂ (Representation.invariants (π.comp I.subtype)) = 1 := by sorry

end IwahoriOldforms

/-! AutomorphicLFunctionsAndLocalFactors AL.2, GL₂ newvectors, supplies the least-level
conductor and normalized Whittaker line, independently of epsilon factors.
R16.3.5 compares this conductor with the ramification-defined WD conductor.
The following classification checks supply a
nonempty level set in each concrete model and express its conductor as `Nat.find hex`. -/

section LocalModelFixtures
open scoped ValuativeRel
variable {p : ℕ} [Fact p.Prime]

/-- The norm-power character on Q_p with normalized absolute value, taking the
uniformizer p to p^(-t) and every p-adic integral unit to one. -/
def localNormCharacter (p : ℕ) [Fact p.Prime] (t : ℝ) : ℚ_[p]ˣ →* ℂˣ where
  toFun u := Units.mk0 ((‖(u : ℚ_[p])‖ ^ t : ℝ) : ℂ) (by sorry)
  map_one' := by sorry
  map_mul' := by sorry

/-- The norm character evaluates by the real power of the normalized absolute value. -/
theorem localNormCharacter_eval (t : ℝ) (u : ℚ_[p]ˣ) :
    (localNormCharacter p t u : ℂ) = (‖(u : ℚ_[p])‖ ^ t : ℝ) := rfl

/-- Smooth normalized upper-Borel induction as a submodule of functions on GL₂(Q_p). -/
def localPrincipalSeriesSpace (χ₁ χ₂ : ℚ_[p]ˣ →* ℂˣ) :
    Submodule ℂ (GeneralLinearGroup (Fin 2) ℚ_[p] → ℂ) where
  carrier := {f | (∃ K : Subgroup (GeneralLinearGroup (Fin 2) ℚ_[p]),
      IsOpen (K : Set (GeneralLinearGroup (Fin 2) ℚ_[p])) ∧
      ∀ g k, k ∈ K → f (g * k) = f g) ∧
    ∀ (b : GeneralLinearGroup (Fin 2) ℚ_[p]), b.val 1 0 = 0 → ∀ g,
      f (b * g) =
        (Real.sqrt (‖b.val 0 0‖ / ‖b.val 1 1‖) : ℂ) *
          (χ₁ (Units.mk0 (b.val 0 0) (by sorry)) : ℂ) *
          (χ₂ (Units.mk0 (b.val 1 1) (by sorry)) : ℂ) * f g}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

/-- Right translation on the concrete smooth induced function space. -/
def localPrincipalSeriesRep (χ₁ χ₂ : ℚ_[p]ˣ →* ℂˣ) :
    Representation ℂ (GeneralLinearGroup (Fin 2) ℚ_[p])
      (localPrincipalSeriesSpace χ₁ χ₂) where
  toFun g :=
    { toFun := fun f => ⟨fun x =>
        (f : GeneralLinearGroup (Fin 2) ℚ_[p] → ℂ) (x * g), by sorry⟩
      map_add' := fun _ _ => rfl
      map_smul' := fun _ _ => rfl }
  map_one' := by sorry
  map_mul' := by sorry

/-- The induced action evaluates by right translation of its argument. -/
theorem localPrincipalSeriesRep_eval (χ₁ χ₂ : ℚ_[p]ˣ →* ℂˣ)
    (g x : GeneralLinearGroup (Fin 2) ℚ_[p]) (f : localPrincipalSeriesSpace χ₁ χ₂) :
    (localPrincipalSeriesRep χ₁ χ₂ g f : GeneralLinearGroup (Fin 2) ℚ_[p] → ℂ) x =
      (f : GeneralLinearGroup (Fin 2) ℚ_[p] → ℂ) (x * g) := rfl

/-- Constants in the unnormalized flag-function realization of the reducible principal series. -/
def localSteinbergConstants (p : ℕ) [Fact p.Prime] :
    Submodule ℂ (localPrincipalSeriesSpace
      (localNormCharacter p (-(1/2))) (localNormCharacter p (1/2))) :=
  Submodule.span ℂ {⟨fun _ => 1, by sorry⟩}

/-- Steinberg is the flag-function quotient by constants, with a determinant twist. -/
def localSteinbergTwist (χ : ℚ_[p]ˣ →* ℂˣ) :
    Representation ℂ (GeneralLinearGroup (Fin 2) ℚ_[p])
      ((localPrincipalSeriesSpace (localNormCharacter p (-(1/2)))
        (localNormCharacter p (1/2))) ⧸ localSteinbergConstants p) :=
  Representation.charTwist (χ.comp GeneralLinearGroup.det)
    ((localPrincipalSeriesRep (localNormCharacter p (-(1/2)))
      (localNormCharacter p (1/2))).quotient (localSteinbergConstants p) (by sorry))

/-- On the quotient, Steinberg's twist is the determinant character times right translation. -/
theorem localSteinbergTwist_quotient (χ : ℚ_[p]ˣ →* ℂˣ)
    (g : GeneralLinearGroup (Fin 2) ℚ_[p])
    (f : localPrincipalSeriesSpace (localNormCharacter p (-(1/2)))
      (localNormCharacter p (1/2))) :
    localSteinbergTwist χ g (Submodule.Quotient.mk f) =
      (χ (GeneralLinearGroup.det g) : ℂ) • Submodule.Quotient.mk
        (localPrincipalSeriesRep (localNormCharacter p (-(1/2)))
          (localNormCharacter p (1/2)) g f) := by sorry

/-- Smooth normalized principal series is irreducible exactly away from
the two norm-character ratios. -/
theorem localPrincipalSeries_irreducible_iff (χ₁ χ₂ : ℚ_[p]ˣ →* ℂˣ)
    (hχ₁ : IsOpen (χ₁.ker : Set ℚ_[p]ˣ))
    (hχ₂ : IsOpen (χ₂.ker : Set ℚ_[p]ˣ)) :
    Representation.IsIrreducible (localPrincipalSeriesRep χ₁ χ₂) ↔
      χ₁ * χ₂⁻¹ ≠ localNormCharacter p 1 ∧
        χ₁ * χ₂⁻¹ ≠ localNormCharacter p (-1) := by sorry

/-- The central character of normalized principal series is the product
of its two inducing characters. -/
theorem localPrincipalSeries_central (χ₁ χ₂ : ℚ_[p]ˣ →* ℂˣ)
    (z : ℚ_[p]ˣ) :
    localPrincipalSeriesRep χ₁ χ₂ (GeneralLinearGroup.scalar (Fin 2) z) =
      ((χ₁ z : ℂ) * (χ₂ z : ℂ)) •
        (1 : Module.End ℂ (localPrincipalSeriesSpace χ₁ χ₂)) := by sorry

/-- The flag-function quotient with any smooth determinant twist
is an irreducible Steinberg representation. -/
theorem localSteinbergTwist_irreducible (χ : ℚ_[p]ˣ →* ℂˣ)
    (hχ : IsOpen (χ.ker : Set ℚ_[p]ˣ)) :
    Representation.IsIrreducible (localSteinbergTwist χ) := by sorry

-- The AL.2 last-row family, characterized on the integral matrix image.
variable (K₁ : ℕ → Subgroup (GeneralLinearGroup (Fin 2) ℚ_[p]))
    (hK₁ : ∀ n g, g ∈ K₁ n ↔ ∃ k : GeneralLinearGroup (Fin 2) 𝒪[ℚ_[p]],
      GeneralLinearGroup.map (algebraMap 𝒪[ℚ_[p]] ℚ_[p]) k = g ∧
        k.val 1 0 ∈ 𝓂[ℚ_[p]] ^ n ∧ k.val 1 1 - 1 ∈ 𝓂[ℚ_[p]] ^ n)
include hK₁

/-- The unramified irreducible induced function model has a nonzero last-row fixed vector
and least fixed level zero. -/
theorem localPrincipalSeries_unramified_conductor (χ₁ χ₂ : ℚ_[p]ˣ →* ℂˣ)
    (hunit : ∀ u : 𝒪[ℚ_[p]]ˣ,
      χ₁ (Units.map (algebraMap 𝒪[ℚ_[p]] ℚ_[p]).toMonoidHom u) = 1 ∧
      χ₂ (Units.map (algebraMap 𝒪[ℚ_[p]] ℚ_[p]).toMonoidHom u) = 1)
    (hgen : χ₁ * χ₂⁻¹ ≠ localNormCharacter p 1 ∧
      χ₁ * χ₂⁻¹ ≠ localNormCharacter p (-1)) :
    ∃ hex : (∃ n, ∃ v ∈ Representation.invariants
      ((localPrincipalSeriesRep χ₁ χ₂).comp (K₁ n).subtype), v ≠ 0),
      @Nat.find _ (Classical.decPred _) hex = 0 := by sorry

/-- An unramified Steinberg twist has a nonzero last-row fixed vector
and least fixed level one. -/
theorem localSteinbergTwist_unramified_conductor (χ : ℚ_[p]ˣ →* ℂˣ)
    (hunit : ∀ u : 𝒪[ℚ_[p]]ˣ,
      χ (Units.map (algebraMap 𝒪[ℚ_[p]] ℚ_[p]).toMonoidHom u) = 1) :
    ∃ hex : (∃ n, ∃ v ∈ Representation.invariants
      ((localSteinbergTwist χ).comp (K₁ n).subtype), v ≠ 0),
      @Nat.find _ (Classical.decPred _) hex = 1 := by sorry

/-- A character of positive conductor a gives a Steinberg twist with
a nonzero last-row fixed vector and least fixed level 2a. -/
theorem localSteinbergTwist_ramified_conductor (χ : ℚ_[p]ˣ →* ℂˣ) (a : ℕ) (ha : 0 < a)
    (hdepth : ∀ u : 𝒪[ℚ_[p]]ˣ, (u : 𝒪[ℚ_[p]]) - 1 ∈ 𝓂[ℚ_[p]] ^ a →
      χ (Units.map (algebraMap 𝒪[ℚ_[p]] ℚ_[p]).toMonoidHom u) = 1)
    (hminimal : ∃ u : 𝒪[ℚ_[p]]ˣ, (u : 𝒪[ℚ_[p]]) - 1 ∈ 𝓂[ℚ_[p]] ^ (a - 1) ∧
      χ (Units.map (algebraMap 𝒪[ℚ_[p]] ℚ_[p]).toMonoidHom u) ≠ 1) :
    ∃ hex : (∃ n, ∃ v ∈ Representation.invariants
      ((localSteinbergTwist χ).comp (K₁ n).subtype), v ≠ 0),
      @Nat.find _ (Classical.decPred _) hex = 2 * a := by sorry

end LocalModelFixtures

section Spherical

/-- The complete homogeneous polynomial Σᵢ αⁱβᵐ⁻ⁱ; it is defined also when the Satake roots collide. -/
def sphericalValues (α β : ℂ) (m : ℕ) : ℂ :=
  ∑ i ∈ Finset.range (m + 1), α ^ i * β ^ (m - i)

/-- The normalized spherical polynomial starts at one. -/
theorem sphericalValues_zero (α β : ℂ) : sphericalValues α β 0 = 1 := by sorry

/-- Interchanging the two Satake roots preserves the spherical polynomial. -/
theorem sphericalValues_swap (α β : ℂ) (m : ℕ) :
    sphericalValues α β m = sphericalValues β α m := by sorry

/-- The nonsingular GL₂ spherical recurrence. -/
theorem sphericalValues_recurrence (α β : ℂ) (m : ℕ) :
    sphericalValues α β (m + 2) = (α + β) * sphericalValues α β (m + 1) -
      α * β * sphericalValues α β m := by sorry

/-- At equal Satake roots the value is (m+1)αᵐ. -/
theorem sphericalValues_equal (α : ℂ) (m : ℕ) :
    sphericalValues α α m = (m + 1) * α ^ m := by sorry

/-- The spherical coefficients form the reciprocal of the unramified Hecke polynomial. -/
theorem sphericalValues_generatingFunction (α β : ℂ) :
    ((1 : PowerSeries ℂ) - PowerSeries.C (α + β) * PowerSeries.X +
      PowerSeries.C (α * β) * PowerSeries.X ^ 2) *
        PowerSeries.mk (sphericalValues α β) = 1 := by sorry

end Spherical

section SupercuspidalProjectivity
variable {p : ℕ} [Fact p.Prime]
variable {F : Type*} [NontriviallyNormedField F] [NormedAlgebra ℚ_[p] F]
    [FiniteDimensional ℚ_[p] F] [CompleteSpace F]
variable {V W X : Type*} [AddCommGroup V] [Module ℂ V]
    [AddCommGroup W] [Module ℂ W] [AddCommGroup X] [Module ℂ X]

/-- R16.2/supercuspidal-projective on the existing representation carriers.
Smoothness means open vector stabilizers, admissibility means finite-dimensional
compact-open invariants, and supercuspidality uses compact-mod-center matrix
coefficients against the smooth dual. The latter two conditions are required
only of π. Every representation has the same scalar central character ω.
The conclusion lifts an equivariant linear map through a surjective equivariant
linear map. There is no topology on the coefficient modules in this smooth
category. The separate L-coefficient DLB descent interface is not asserted here. -/
theorem supercuspidalProjective
    (π : Representation ℂ (GeneralLinearGroup (Fin 2) F) V)
    (σ : Representation ℂ (GeneralLinearGroup (Fin 2) F) W)
    (τ : Representation ℂ (GeneralLinearGroup (Fin 2) F) X)
    [Representation.IsIrreducible π]
    (ω : Fˣ →* ℂˣ) (hω : IsOpen (ω.ker : Set Fˣ))
    (hπsm : ∀ v : V, IsOpen {g | π g v = v})
    (hσsm : ∀ w : W, IsOpen {g | σ g w = w})
    (hτsm : ∀ x : X, IsOpen {g | τ g x = x})
    (hπcent : ∀ z v, π (GeneralLinearGroup.scalar (Fin 2) z) v = (ω z : ℂ) • v)
    (hσcent : ∀ z w, σ (GeneralLinearGroup.scalar (Fin 2) z) w = (ω z : ℂ) • w)
    (hτcent : ∀ z x, τ (GeneralLinearGroup.scalar (Fin 2) z) x = (ω z : ℂ) • x)
    (hπadm : ∀ K : Subgroup (GeneralLinearGroup (Fin 2) F),
      IsCompact (K : Set (GeneralLinearGroup (Fin 2) F)) →
      IsOpen (K : Set (GeneralLinearGroup (Fin 2) F)) →
      FiniteDimensional ℂ (Representation.invariants (π.comp K.subtype)))
    (hπcusp : ∀ (v : V) (ell : V →ₗ[ℂ] ℂ),
      IsOpen {g : GeneralLinearGroup (Fin 2) F | ∀ w, ell (π g w) = ell w} →
      IsCompact (closure ((QuotientGroup.mk : GeneralLinearGroup (Fin 2) F →
        GeneralLinearGroup (Fin 2) F ⧸ Subgroup.center (GeneralLinearGroup (Fin 2) F)) ''
          {g | ell (π g v) ≠ 0})))
    (q : Representation.IntertwiningMap σ τ) (hq : Function.Surjective q)
    (f : Representation.IntertwiningMap π τ) :
    ∃ lift : Representation.IntertwiningMap π σ, q.comp lift = f := by sorry

end SupercuspidalProjectivity

/-! ## Layer R16.3: Local parameters and factors -/

section Parameters

/-- The nonzero rank-one monodromy matrix and its geometric Frobenius relation;
q is a nonzero square root of the residue cardinality. With trivial inertia this
monodromy contributes one to the WD conductor, while the semisimple Weil part
alone has conductor zero, as in R16.0.1 and R16.3.5. -/
theorem steinbergParameter (q α : ℂ) (hq : q ≠ 0) (hα : α ≠ 0) :
    let N : Matrix (Fin 2) (Fin 2) ℂ := !![0, 1; 0, 0]
    let R : Matrix (Fin 2) (Fin 2) ℂ := !![α / q, 0; 0, α * q]
    N ^ 2 = 0 ∧ N ≠ 0 ∧ R * N = (q ^ 2)⁻¹ • (N * R) := by sorry

end Parameters

/-! ## Layer R16.4: Global cuspidal representations -/

section Global

/-- The subset with trivial stabilizer for a specified group action; the automorphic application uses determinant twists on cusp isomorphism classes. -/
def nonCM (H P : Type*) [Group H] [MulAction H P] : Set P :=
  {π | ∀ χ : H, χ • π = π → χ = 1}

/-- Membership in the non-CM subset means that every stabilizing character is trivial. -/
theorem nonCM_iff {H P : Type*} [Group H] [MulAction H P] (π : P) :
    π ∈ nonCM H P ↔ ∀ χ : H, χ • π = π → χ = 1 := Iff.rfl

/-- Character translation preserves the trivial-stabilizer condition. -/
theorem nonCM_twist {H P : Type*} [Group H] [MulAction H P]
    (π : P) (hπ : π ∈ nonCM H P) (χ : H) : χ • π ∈ nonCM H P := by sorry

/-- The central-character transformation law forces every rank-two self-twist to square to one. -/
theorem nonCM_self_twist_square {H P : Type*} [CommGroup H] [MulAction H P]
    (central : P → H) (hcentral : ∀ χ π, central (χ • π) = χ ^ 2 * central π)
    (π : P) (χ : H) (hχ : χ • π = π) : χ ^ 2 = 1 := by sorry

/-! ## Layer R16.5: Whittaker integrals and analytic recognition -/

/-- The unitary reflection s↦1−s becomes the classical reflection t↦k−t. -/
theorem globalEpsilon (k : ℂ) (s : ℂ) :
    (1 - s) + (k - 1) / 2 = k - (s + (k - 1) / 2) := by sorry

end Global

/-! ## Layer R16.6: Classical and Hilbert weights -/

section Classical

/-- Scaling a supplied Satake pair converts its trace and determinant.
At a good prime, the hypotheses come from AutomorphicFormsOnReductiveGroups §7.3,
with z = p^((k-1)/2) in the unitary normalization. -/
theorem classicalHeckeLevel (α β z ap χp : ℂ)
    (htrace : z * (α + β) = ap) (hdet : α * β = χp) :
    z * α + z * β = ap ∧ (z * α) * (z * β) = χp * z ^ 2 := by sorry

section Weight
open scoped TensorProduct
variable {ι : Type} [Fintype ι]

/-- For the Hilbert application, ι is the finite set of real embeddings and k≥2.
The existing symmetric power is the coefficient carrier, even at k=2. -/
abbrev HilbertWeightSpace (K : Type) [Field K] (k : ι → ℕ) :=
  ⨂[K] i, Sym[K]^(k i - 2) (Fin 2 → K)

/-- One symmetric-power coefficient factor with its determinant twist, using Representation.charTwist. -/
def hilbertWeightFactor (K : Type) [Field K] (k : ℕ) (m : ℤ) :
    Representation K (GeneralLinearGroup (Fin 2) K) (Sym[K]^(k - 2) (Fin 2 → K)) :=
  Representation.charTwist
    ((zpowGroupHom m).comp (GeneralLinearGroup.det : GeneralLinearGroup (Fin 2) K →* Kˣ))
    (TauCeti.symPowerRep K 2 (k - 2))

/-- The product-group action on the tensor of the coefficient factors. -/
def hilbertWeightRepresentation (K : Type) [Field K] (k : ι → ℕ) (m : ι → ℤ) :
    Representation K (ι → GeneralLinearGroup (Fin 2) K) (HilbertWeightSpace K k) where
  toFun g := PiTensorProduct.map fun i => hilbertWeightFactor K (k i) (m i) (g i)
  map_one' := by
    simp
  map_mul' g h := by
    simp only [Pi.mul_apply, map_mul]
    exact PiTensorProduct.map_mul _ _

/-- The scalar action on each coefficient factor. -/
theorem hilbertWeightRepresentation_scalar (K : Type) [Field K]
    (k : ι → ℕ) (m : ι → ℤ) (hk : ∀ i, 2 ≤ k i) (u : ι → Kˣ) :
    hilbertWeightRepresentation K k m (fun i => GeneralLinearGroup.scalar (Fin 2) (u i)) =
      (∏ i, ((u i : K) ^ ((k i : ℤ) - 2 + 2 * m i))) •
        (1 : Module.End K (HilbertWeightSpace K k)) := by sorry

/-- For a common pure weight the scalar exponent is w−2. -/
theorem hilbertWeightRepresentation_pure (K : Type) [Field K]
    (k : ι → ℕ) (m : ι → ℤ) (hk : ∀ i, 2 ≤ k i) (w : ℤ)
    (hw : ∀ i, (k i : ℤ) + 2 * m i = w) (u : ι → Kˣ) :
    hilbertWeightRepresentation K k m (fun i => GeneralLinearGroup.scalar (Fin 2) (u i)) =
      (∏ i, (u i : K) ^ (w - 2)) • (1 : Module.End K (HilbertWeightSpace K k)) := by sorry

/-- The tensor coefficient dimension is the product of kᵢ−1. -/
theorem hilbertWeightRepresentation_dimension (K : Type) [Field K]
    (k : ι → ℕ) (hk : ∀ i, 2 ≤ k i) :
    Module.finrank K (HilbertWeightSpace K k) = ∏ i, (k i - 1) := by sorry

/-- Dualizing inverts the coefficient scalar character. -/
theorem hilbertWeightRepresentation_dual (K : Type) [Field K]
    (k : ι → ℕ) (m : ι → ℤ) (hk : ∀ i, 2 ≤ k i) (u : ι → Kˣ) :
    (hilbertWeightRepresentation K k m).dual
        (fun i => GeneralLinearGroup.scalar (Fin 2) (u i)) =
      (∏ i, (u i : K) ^ (-((k i : ℤ) - 2 + 2 * m i))) •
        (1 : Module.End K (Module.Dual K (HilbertWeightSpace K k))) := by sorry

/-- Scalar extension compares these actual tensor carriers and intertwines
the coefficient-mapped matrix action. Equality on pure tensors specifies
the action on the whole scalar extension. -/
theorem hilbertWeightRepresentation_base_change (K L : Type) [Field K] [Field L]
    [Algebra K L] (k : ι → ℕ) (m : ι → ℤ) :
    ∃ e : (L ⊗[K] HilbertWeightSpace K k) ≃ₗ[L] HilbertWeightSpace L k,
      ∀ g : ι → GeneralLinearGroup (Fin 2) K, ∀ a : L, ∀ v : HilbertWeightSpace K k,
        e (a ⊗ₜ[K] hilbertWeightRepresentation K k m g v) =
          hilbertWeightRepresentation L k m
            (fun i => GeneralLinearGroup.map (algebraMap K L) (g i)) (e (a ⊗ₜ[K] v)) := by sorry

end Weight

/-- The scalar conversion of the two good-prime roots. -/
theorem weightKParameterConversion (α β z : ℂ) :
    z * α + z * β = z * (α + β) ∧
    (z * α) * (z * β) = z ^ 2 * (α * β) := by sorry

end Classical

/-! ## Layer R17.1: Quaternionic local transfer

The nonarchimedean division correspondence and its inverse are supplied by
LocalGaloisDeformationRings §2.26.1 at degree two, as specified in README
R17.1/local-quaternionic-comparison. The ramification and split-algebra statements
below provide the quaternionic algebra comparisons used by local and global transfer.
-/

section Quaternion

section QuaternionRamification
open NumberField IsDedekindDomain
open scoped NumberField
variable {K : Type*} [Field K] [NumberField K]

/-- Quaternion ramification is realizable exactly for an even set of finite and real places. -/
theorem existsQuaternionRamification_iff
    (Sf : Finset (HeightOneSpectrum (𝓞 K))) (Si : Finset (InfinitePlace K)) :
    (∃ a b : Kˣ,
      (∀ v : HeightOneSpectrum (𝓞 K),
        Nonempty (QuaternionAlgebra (v.adicCompletion K)
          (algebraMap K (v.adicCompletion K) (a : K)) 0
          (algebraMap K (v.adicCompletion K) (b : K)) ≃ₐ[v.adicCompletion K]
          Matrix (Fin 2) (Fin 2) (v.adicCompletion K)) ↔ v ∉ Sf) ∧
      (∀ w : InfinitePlace K,
        Nonempty (QuaternionAlgebra w.Completion
          (algebraMap K w.Completion (a : K)) 0
          (algebraMap K w.Completion (b : K)) ≃ₐ[w.Completion]
          Matrix (Fin 2) (Fin 2) w.Completion) ↔ w ∉ Si)) ↔
    (∀ w ∈ Si, w.IsReal) ∧ Even (Sf.card + Si.card) := by sorry

/-- Two quaternion algebras with the same splitting behaviour at all places are algebra-isomorphic. -/
theorem quaternionAlgEquivOfLocalSplitting (a b c d : Kˣ)
    (hf : ∀ v : HeightOneSpectrum (𝓞 K),
      Nonempty (QuaternionAlgebra (v.adicCompletion K)
        (algebraMap K (v.adicCompletion K) (a : K)) 0
        (algebraMap K (v.adicCompletion K) (b : K)) ≃ₐ[v.adicCompletion K]
        Matrix (Fin 2) (Fin 2) (v.adicCompletion K)) ↔
      Nonempty (QuaternionAlgebra (v.adicCompletion K)
        (algebraMap K (v.adicCompletion K) (c : K)) 0
        (algebraMap K (v.adicCompletion K) (d : K)) ≃ₐ[v.adicCompletion K]
        Matrix (Fin 2) (Fin 2) (v.adicCompletion K)))
    (hi : ∀ w : InfinitePlace K,
      Nonempty (QuaternionAlgebra w.Completion
        (algebraMap K w.Completion (a : K)) 0
        (algebraMap K w.Completion (b : K)) ≃ₐ[w.Completion]
        Matrix (Fin 2) (Fin 2) w.Completion) ↔
      Nonempty (QuaternionAlgebra w.Completion
        (algebraMap K w.Completion (c : K)) 0
        (algebraMap K w.Completion (d : K)) ≃ₐ[w.Completion]
        Matrix (Fin 2) (Fin 2) w.Completion)) :
    Nonempty (QuaternionAlgebra K (a : K) 0 (b : K) ≃ₐ[K]
      QuaternionAlgebra K (c : K) 0 (d : K)) := by sorry

end QuaternionRamification

/-- Exchanging one member and one nonmember of a finite ramification set preserves even cardinality. -/
theorem quaternionSwap {V : Type*} [DecidableEq V] (S : Finset V)
    (v τ : V) (hv : v ∉ S) (hτ : τ ∈ S) (hvt : v ≠ τ) :
    Even S.card → Even (insert v (S.erase τ)).card := by sorry

end Quaternion

/-! ## Layer R17.2: Test functions and trace comparisons -/

section SpectralCircle
open MeasureTheory
open scoped ENNReal MeasureTheory

/-- The inverse image of a point under real periodization is countable, including at period zero. -/
theorem spectralCircle_fibre_countable (T : ℝ) (x : AddCircle T) :
    Set.Countable ((fun t : ℝ => (t : AddCircle T)) ⁻¹' {x}) := by sorry

/-- Periodization of a measure with density relative to real volume has zero singleton mass. -/
theorem spectralCircle_density_singleton (T : ℝ) [Fact (0 < T)]
    (d : ℝ → ℝ≥0∞) (x : AddCircle T) :
    ((volume.withDensity d).map (fun t : ℝ => (t : AddCircle T))) {x} = 0 := by sorry

end SpectralCircle

end TauCeti.GL2Blueprint

namespace TauCeti.GL2Transfer

open _root_.Matrix

/-! ## Layer R17.4: Cyclic, solvable and cubic base change -/

section Satake
variable {K L : Type*} [CommRing K] [CommRing L]

/-- The trace of a rank-two power as a polynomial in the original trace and determinant. -/
def satakePowerSum (s e : K) : ℕ → K
  | 0 => 2
  | 1 => s
  | n + 2 => s * satakePowerSum s e (n + 1) - e * satakePowerSum s e n

/-- The zeroth power has trace two over every commutative coefficient ring. -/
theorem satakePowerSum_zero (s e : K) : satakePowerSum s e 0 = 2 := rfl

/-- The first power retains the original trace. -/
theorem satakePowerSum_one (s e : K) : satakePowerSum s e 1 = s := rfl

/-- The trace power sums satisfy the rank-two characteristic-polynomial recurrence. -/
theorem satakePowerSum_recurrence (s e : K) (n : ℕ) :
    satakePowerSum s e (n + 2) =
      s * satakePowerSum s e (n + 1) - e * satakePowerSum s e n := rfl

/-- Coefficient maps preserve the trace power-sum polynomials. -/
theorem satakePowerSum_map (φ : K →+* L) (s e : K) (n : ℕ) :
    φ (satakePowerSum s e n) = satakePowerSum (φ s) (φ e) n := by sorry

/-- For a supplied root pair the trace polynomial is its power sum, including colliding roots. -/
theorem satakePowerSum_roots (α β : K) (n : ℕ) :
    satakePowerSum (α + β) (α * β) n = α ^ n + β ^ n := by sorry

/-- Taking a matrix power computes the trace polynomial without choosing eigenvalues. -/
theorem trace_pow_eq_satakePowerSum (A : Matrix (Fin 2) (Fin 2) K) (n : ℕ) :
    (A ^ n).trace = satakePowerSum A.trace A.det n := by sorry

/-- Successive residue-degree substitutions multiply the degrees over any commutative ring. -/
theorem satakePowerSum_tower (s e : K) (f g : ℕ) :
    satakePowerSum (satakePowerSum s e f) (e ^ f) g =
      satakePowerSum s e (f * g) := by sorry

/-- A matrix representative for the rank-two Satake substitution supplied by
AutomorphicSpectralTheory §§7.0b and 7.1, identified by README
R17.2/cyclic-local-matching: the canonical weak output has class `A ^ f` at an
unramified place of residue degree `f`. The formal value at zero is the identity. -/
def unramifiedBaseChange (A : GeneralLinearGroup (Fin 2) K)
    (f : ℕ) : GeneralLinearGroup (Fin 2) K := A ^ f

/-- Residue degree one fixes the supplied Satake representative. -/
theorem unramifiedBaseChange_one (A : GeneralLinearGroup (Fin 2) K) :
    unramifiedBaseChange A 1 = A := by sorry

/-- Changing a Satake representative by conjugation conjugates its base change. -/
theorem unramifiedBaseChange_conjugate (A P : GeneralLinearGroup (Fin 2) K) (f : ℕ) :
    unramifiedBaseChange (P * A * P⁻¹) f = P * unramifiedBaseChange A f * P⁻¹ := by sorry

/-- The determinant follows the residue-degree power rule. -/
theorem unramifiedBaseChange_det (A : GeneralLinearGroup (Fin 2) K) (f : ℕ) :
    GeneralLinearGroup.det (unramifiedBaseChange A f) = GeneralLinearGroup.det A ^ f := by sorry

/-- Mapping coefficients commutes with unramified base change. -/
theorem unramifiedBaseChange_map (φ : K →+* L) (A : GeneralLinearGroup (Fin 2) K) (f : ℕ) :
    GeneralLinearGroup.map φ (unramifiedBaseChange A f) =
      unramifiedBaseChange (GeneralLinearGroup.map φ A) f := by sorry

/-- Successive residue degrees in the supplied canonical base-change tower
give the same matrix representative as their product. -/
theorem unramifiedBaseChange_tower (A : GeneralLinearGroup (Fin 2) K) (f g : ℕ) :
    unramifiedBaseChange (unramifiedBaseChange A f) g =
      unramifiedBaseChange A (f * g) := by sorry

end Satake

section AdjointMatrix
variable {K : Type*} [Field K]

/-- The rank-three adjoint diagonal for a Satake pair; comparisons assume nonzero roots. -/
def adjointSatakeDiagonal (α β : K) : Matrix (Fin 3) (Fin 3) K :=
  diagonal ![α / β, 1, β / α]

/-- Nonzero Satake roots give adjoint determinant one. -/
theorem adjointSatakeDiagonal_det (α β : K) (hα : α ≠ 0) (hβ : β ≠ 0) :
    (adjointSatakeDiagonal α β).det = 1 := by sorry

/-- A common nonzero scalar twist leaves the adjoint Satake matrix unchanged. -/
theorem adjointSatakeDiagonal_twist (α β u : K) (hu : u ≠ 0) :
    adjointSatakeDiagonal (u * α) (u * β) = adjointSatakeDiagonal α β := by sorry

/-- Opposite norm exponents t and -t give adjoint exponents 2t, 0 and -2t;
at t=1/4 these are the exponents of the reducible attached induction. -/
theorem adjointSatakeDiagonal_normCharacter (p : ℕ) [Fact p.Prime]
    (t : ℝ) (u : ℚ_[p]ˣ) :
    adjointSatakeDiagonal
        (GL2Blueprint.localNormCharacter p t u : ℂ)
        (GL2Blueprint.localNormCharacter p (-t) u : ℂ) =
      diagonal ![(GL2Blueprint.localNormCharacter p (2*t) u : ℂ), 1,
        (GL2Blueprint.localNormCharacter p (-(2*t)) u : ℂ)] := by sorry

end AdjointMatrix

section PureCubicPhase

/-- Multiplication by a+b*t+c*t² in the basis (1,t,t²), with t³=2. -/
def pureCubicMatrix (a b c : ℚ) : Matrix (Fin 3) (Fin 3) ℚ :=
  !![a, 2*c, 2*b; b, a, 2*c; c, b, a]
/-- The determinant of multiplication by a+bt+ct² in Q[t]/(t³−2). -/
def pureCubicNorm (a b c : ℚ) : ℚ := (pureCubicMatrix a b c).det
/-- The second characteristic coefficient of multiplication by a+bt+ct². -/
def pureCubicQuadratic (a b c : ℚ) : ℚ :=
  ((pureCubicMatrix a b c).trace ^ 2 -
    (pureCubicMatrix a b c * pureCubicMatrix a b c).trace) / 2
/-- The explicit cubic norm in the basis (1,t,t²). -/
theorem pureCubicNorm_formula (a b c : ℚ) :
    pureCubicNorm a b c = a^3 + 2*b^3 + 4*c^3 - 6*a*b*c := by sorry

/-- The explicit quadratic coefficient in that basis. -/
theorem pureCubicQuadratic_formula (a b c : ℚ) :
    pureCubicQuadratic a b c = 3*a^2 - 6*b*c := by sorry

/-- The norm identity after translation by +1. -/
theorem pureCubicPhase_positive (a b c : ℚ) :
    pureCubicNorm (1+a) b c - 3*(1+a) =
      -2 + pureCubicQuadratic a b c + pureCubicNorm a b c := by sorry

/-- The norm identity after translation by −1. -/
theorem pureCubicPhase_negative (a b c : ℚ) :
    pureCubicNorm (-1+a) b c - 3*(-1+a) =
      2 - pureCubicQuadratic a b c + pureCubicNorm a b c := by sorry

end PureCubicPhase

/-- Finite ramification has the parity of the number of ramified real places. -/
theorem indefinite_parity (d t : ℕ) (hd : 1 ≤ d) (h : Even ((d - 1) + t)) :
    t % 2 = (d - 1) % 2 := by sorry

open Matrix IsDedekindDomain
open scoped BigOperators NumberField

/-! ## Layer R17.5: Automorphic induction and solvable Artin representations -/

/-- The quadratic and cubic power traces determine the original trace when the
projective order is not six. This is the elementwise finite-group comparison
used by octahedral descent; the equal-determinant hypothesis is essential. -/
theorem trace_eq_of_square_cube (A B : GeneralLinearGroup (Fin 2) ℂ)
    (hdet : GeneralLinearGroup.det A = GeneralLinearGroup.det B)
    (hsq : (A.val ^ 2).trace = (B.val ^ 2).trace)
    (hcube : (A.val ^ 3).trace = (B.val ^ 3).trace)
    (horder : orderOf (ProjGenLinGroup.mk A) ≠ 6) :
    A.val.trace = B.val.trace := by sorry

/-- Fong–Swan with a stable free lattice and the supplied residual module. -/
theorem solvable_finite_image_integral_lift
    (Γ : Type*) [Group Γ] [Finite Γ] (hsolv : Group.IsSolvable Γ)
    (p : ℕ) [Fact p.Prime]
    (k : Type*) [Field k] [CharP k p] [IsAlgClosed k]
    (n : ℕ) (r : Γ →* GeneralLinearGroup (Fin n) k)
    (hirr : Representation.IsIrreducible
      ((Units.coeHom (Module.End k (Fin n → k))).comp
        (GeneralLinearGroup.toLin.toMonoidHom.comp r))) :
    ∃ (E : Type) (_ : Field E) (_ : NumberField E)
      (v : HeightOneSpectrum (𝓞 E)),
      letI : v.asIdeal.IsPrime := v.isPrime
      ∃ (f : Localization.AtPrime v.asIdeal →+* k)
        (ρ : Γ →* GeneralLinearGroup (Fin n) (Localization.AtPrime v.asIdeal))
        (P : GeneralLinearGroup (Fin n) k),
        RingHom.ker f = IsLocalRing.maximalIdeal (Localization.AtPrime v.asIdeal) ∧
        ∀ g : Γ, r g = P * GeneralLinearGroup.map f (ρ g) * P⁻¹ := by sorry

section OddReductionTests

/-- The integral diagonal involution with eigenvalues +1 and −1. -/
private def mixedSignInvolution : GeneralLinearGroup (Fin 2) ℤ where
  val := !![1, 0; 0, -1]
  inv := !![1, 0; 0, -1]
  val_inv := by
    ext i j
    fin_cases i <;> fin_cases j <;> norm_num [Matrix.mul_apply, Fin.sum_univ_succ]
  inv_val := by
    ext i j
    fin_cases i <;> fin_cases j <;> norm_num [Matrix.mul_apply, Fin.sum_univ_succ]

local instance : Fact (Nat.Prime 3) := ⟨by decide⟩

/-- An involution over a domain with odd residual determinant has determinant -1. -/
theorem involution_det_eq_neg_one_of_reduction
    {R k : Type*} [CommRing R] [NoZeroDivisors R] [Field k]
    (f : R →+* k) (h2 : (2 : k) ≠ 0)
    (A : GeneralLinearGroup (Fin 2) R) (hA : A ^ 2 = 1)
    (hodd : GeneralLinearGroup.det (GeneralLinearGroup.map f A) = (-1 : kˣ)) :
    GeneralLinearGroup.det A = (-1 : Rˣ) := by sorry

/-- Oddness of an involution lifts through reduction of a representation. -/
theorem involution_odd_of_reduction
    {G R k : Type*} [Group G] [CommRing R] [NoZeroDivisors R] [Field k]
    (f : R →+* k) (h2 : (2 : k) ≠ 0)
    (ρ : G →* GeneralLinearGroup (Fin 2) R) (c : G) (hc : c ^ 2 = 1)
    (hodd : GeneralLinearGroup.det (GeneralLinearGroup.map f (ρ c)) = (-1 : kˣ)) :
    GeneralLinearGroup.det (ρ c) = (-1 : Rˣ) := by sorry

/-- A residual change of basis preserves the determinant test for an involution. -/
theorem involution_det_eq_neg_one_of_residual_conjugacy
    {R k : Type*} [CommRing R] [NoZeroDivisors R] [Field k]
    (f : R →+* k) (h2 : (2 : k) ≠ 0)
    (A : GeneralLinearGroup (Fin 2) R) (hA : A ^ 2 = 1)
    (B P : GeneralLinearGroup (Fin 2) k)
    (hcomp : B = P * GeneralLinearGroup.map f A * P⁻¹)
    (hodd : GeneralLinearGroup.det B = (-1 : kˣ)) :
    GeneralLinearGroup.det A = (-1 : Rˣ) := by sorry

/-- Oddness transfers across a specified residual representation isomorphism. -/
theorem involution_odd_of_residual_conjugacy
    {G R k : Type*} [Group G] [CommRing R] [NoZeroDivisors R] [Field k]
    (f : R →+* k) (h2 : (2 : k) ≠ 0)
    (ρ : G →* GeneralLinearGroup (Fin 2) R)
    (rbar : G →* GeneralLinearGroup (Fin 2) k)
    (P : GeneralLinearGroup (Fin 2) k)
    (hcomp : ∀ g, rbar g = P * GeneralLinearGroup.map f (ρ g) * P⁻¹)
    (c : G) (hc : c ^ 2 = 1)
    (hodd : GeneralLinearGroup.det (rbar c) = (-1 : kˣ)) :
    GeneralLinearGroup.det (ρ c) = (-1 : Rˣ) := by sorry

end OddReductionTests

section ArithmeticLifting

/-- The finite-image complex rank-two specialization of ArithmeticGaloisRepresentations §7.6 gives a finite continuous linear lift with its specified projectivization. -/
theorem finite_projective_lift (F : Type*) [Field F] [NumberField F]
    (r : Field.absoluteGaloisGroup F →* ProjGenLinGroup (Fin 2) ℂ)
    (hr : IsOpen (r.ker : Set (Field.absoluteGaloisGroup F))) :
    ∃ ρ : Field.absoluteGaloisGroup F →* GeneralLinearGroup (Fin 2) ℂ,
      IsOpen (ρ.ker : Set (Field.absoluteGaloisGroup F)) ∧ Set.Finite (Set.range ρ) ∧
        ProjGenLinGroup.mk.comp ρ = r := by sorry

end ArithmeticLifting

section CharacterPrescriptionFixtures
local instance : Fact (Nat.Prime 5) := ⟨by decide⟩
local instance : Fact (Nat.Prime 2) := ⟨by decide⟩

/-- The quadratic character modulo five with complex coefficients and zero extension. -/
def quadraticDirichletFive : DirichletCharacter ℂ 5 :=
  (quadraticChar (ZMod 5)).ringHomComp (Int.castRingHom ℂ)

/-- The order-four additive character of ZMod 4 taking one to i. -/
def quarticCharacter : AddChar (ZMod 4) ℂ where
  toFun a := Complex.I ^ a.val
  map_zero_eq_one' := by sorry
  map_add_eq_mul' := by sorry

/-- Extending the nontrivial character on the order-two subgroup forces order growth. -/
theorem characterExtensionOrder_square_ne_one (χ : AddChar (ZMod 4) ℂ)
    (hχ : χ 2 = -1) : χ ^ 2 ≠ 1 := by sorry

/-- The nonzero dyadic uniformizer as a unit of Q₂. -/
def twoUnit : ℚ_[2]ˣ := Units.mk0 2 (by norm_num)

/-- The continuous quadratic character of Q₂× defined by valuation parity. -/
def unramifiedQuadraticTwo : ContinuousMonoidHom ℚ_[2]ˣ ℂˣ where
  toFun u := (-1 : ℂˣ) ^ (u : ℚ_[2]).valuation
  map_one' := by sorry
  map_mul' := by sorry
  continuous_toFun := by sorry

end CharacterPrescriptionFixtures

section FiniteSection

/-- Reduction modulo λ = (1 + √−2): ℤ[√−2] → F₃, sending √−2 to −1. -/
def redSqrtNegTwo : ℤ√(-2) →+* ZMod 3 := Zsqrtd.lift ⟨-1, by decide⟩

/-- The section used by the octahedral mod-3 application (Darmon–Diamond–Taylor,
Theorem 3.14(a)): an injective homomorphism GL₂(F₃) → GL₂(ℤ[√−2]) reducing to the
identity modulo (1 + √−2). Use the explicit generators in Darmon–Diamond–Taylor; the matrix
and quadratic-integer carriers already exist at the pins. -/
theorem gl2F3_section :
    ∃ s : GeneralLinearGroup (Fin 2) (ZMod 3) →* GeneralLinearGroup (Fin 2) (ℤ√(-2)),
      Function.Injective s ∧
        (GeneralLinearGroup.map redSqrtNegTwo).comp s = MonoidHom.id _ := by sorry

end FiniteSection

/-! ## Layer R17.6: Characteristic two and residual modularity -/

section RamifiedCurveIdeals

/-- The ideal-power test for contraction of the reordered curve correspondence
with ramification orders a<d. The witness n=a works even when a>1. -/
theorem ramification_contraction {R : Type*} [CommRing R] (I : Ideal R)
    {a d : ℕ} (ha : 0 < a) (had : a < d) :
    I ^ d ≤ I ^ a ∧ ∃ n : ℕ, 0 < n ∧ (I ^ d) ^ n ≤ (I ^ a) ^ (n + 1) := by sorry

end RamifiedCurveIdeals

section CharacteristicTwo
variable {G : Type*} [Group G] {k : Type*} [Field k] [CharP k 2]

/-- A finite determinant character in characteristic two has a finite square root; its inverse scalar twist has determinant one. -/
theorem determinant_untwist (r : G →* GeneralLinearGroup (Fin 2) k)
    (hfinite : Set.Finite (Set.range r)) :
    ∃ ξ : G →* kˣ, Set.Finite (Set.range ξ) ∧
      ∀ g, ξ g ^ 2 = GeneralLinearGroup.det (r g) ∧
        GeneralLinearGroup.det (GeneralLinearGroup.scalar (Fin 2) (ξ g)⁻¹ * r g) = 1 := by sorry

/-- A finite irreducible rank-two representation in characteristic two
with solvable projective image has odd dihedral projective image. -/
theorem solvable_characteristicTwo_projective_dihedral [IsAlgClosed k]
    (r : G →* GeneralLinearGroup (Fin 2) k)
    (hfinite : Set.Finite (Set.range r))
    (hsolv : Group.IsSolvable (ProjGenLinGroup.mk.comp r).range)
    (hirr : Representation.IsIrreducible
      ((Units.coeHom (Module.End k (Fin 2 → k))).comp
        (GeneralLinearGroup.toLin.toMonoidHom.comp r))) :
    ∃ n : ℕ, 3 ≤ n ∧ Odd n ∧
      Nonempty ((ProjGenLinGroup.mk.comp r).range ≃* DihedralGroup n) := by sorry

/-- The four dyadic exponent consequences of the discriminant and conductor identity. -/
theorem teichmuller_conductor (D : ℤ) (normF N ν : ℕ) (hN : Odd N)
    (hfund : D % 4 = 1 ∨ D % 16 = 8 ∨ D % 16 = 12)
    (hcond : D.natAbs * normF = 2 ^ ν * N) :
    (Odd D → Odd normF → ν = 0) ∧ (D % 8 = 5 → normF % 8 = 4 → ν = 2) ∧
      (D % 8 = 4 → Odd normF → ν = 2) ∧ (D % 8 = 0 → Odd normF → ν = 3) := by sorry

end CharacteristicTwo

section TransferExports
variable {G H V W Λ K : Type*} [Group G] [Group H] [Field K]

/-- Surjectivity modulo the projective kernel preserves the projective range under restriction. -/
theorem disjoint_irreducibility (i : H →* G)
    (r : G →* GeneralLinearGroup (Fin 2) K)
    (hdisj : i.range ⊔ (ProjGenLinGroup.mk.comp r).ker = ⊤) :
    Set.range (ProjGenLinGroup.mk.comp (r.comp i)) = Set.range (ProjGenLinGroup.mk.comp r) := by sorry

/-- Restriction surjective modulo the projective kernel preserves
irreducibility in every finite rank. -/
theorem disjoint_restriction_irreducible (n : ℕ) (i : H →* G)
    (r : G →* GeneralLinearGroup (Fin n) K)
    (hdisj : i.range ⊔ (ProjGenLinGroup.mk.comp r).ker = ⊤)
    (hirr : Representation.IsIrreducible
      ((Units.coeHom (Module.End K (Fin n → K))).comp
        (GeneralLinearGroup.toLin.toMonoidHom.comp r))) :
    Representation.IsIrreducible
      ((Units.coeHom (Module.End K (Fin n → K))).comp
        (GeneralLinearGroup.toLin.toMonoidHom.comp (r.comp i))) := by sorry

/-- The index-two induction restriction criterion over an algebraically closed field, including characteristic two. -/
theorem quadratic_restriction {Γ k : Type*} [Group Γ] [Field k] [IsAlgClosed k]
    (Kgp E : Subgroup Γ)
    [Kgp.Normal] (hK : Kgp.index = 2) (θ : Kgp →* kˣ) (σθ : Representation k Kgp k)
    (hσθ : ∀ x, σθ x = (θ x : k) • LinearMap.id) :
    Representation.IsIrreducible ((Representation.ind Kgp.subtype σθ).comp E.subtype) ↔
      ∃ s ∈ E, s ∉ Kgp ∧ ∃ x : Kgp, (x : Γ) ∈ E ∧ θ x ≠ θ (MulAut.conjNormal s x) := by sorry

/-- Restriction of a supplied Frobenius power agrees in every coefficient
specialization with the matrix representative of AutomorphicSpectralTheory
§7.1 canonical weak base change. -/
theorem compatible_base_change (ρ : Λ → G →* GeneralLinearGroup (Fin 2) K)
    (i : H →* G) (FrobF : V → G) (FrobE : W → H) (below : W → V) (f : W → ℕ)
    (hfrob : ∀ w, i (FrobE w) = FrobF (below w) ^ f w) :
    ∀ ell w, ρ ell (i (FrobE w)) = unramifiedBaseChange (ρ ell (FrobF (below w))) (f w) := by sorry

/-- Matching irreducible restrictions over algebraically closed coefficients differ by a finite quotient character. -/
theorem compatible_descent_twist [IsAlgClosed K]
    (E : Subgroup G) [E.Normal] [E.FiniteIndex]
    (r s : G →* GeneralLinearGroup (Fin 2) K) (P : GeneralLinearGroup (Fin 2) K)
    (hres : ∀ h : E, r h = P * s h * P⁻¹)
    (hirr : Representation.IsIrreducible
      ((Units.coeHom (Module.End K (Fin 2 → K))).comp
        (GeneralLinearGroup.toLin.toMonoidHom.comp (s.comp E.subtype)))) :
    ∃ χ : G →* Kˣ, Set.Finite (Set.range χ) ∧ (∀ h : E, χ h = 1) ∧
      ∀ g, r g = P * GeneralLinearGroup.scalar (Fin 2) (χ g) * s g * P⁻¹ := by sorry

end TransferExports

end TauCeti.GL2Transfer

/-
README-only definitions and API targets:
CentralCharacterL2 and its inner product, completeness, translation and measure API (R16.1).
brauerCharacter, brauerCharacter_conjugate, brauerCharacter_one, brauerCharacter_spectrum.
cdtVexingType, cdtVexingType_lattice, cdtVexingType_restrict, cdtVexingType_unramified.
The CDT type and both vexing selector branches require a(θ/θ^σ) = a(θ) = n ≥ 1
for the unramified quadratic character; regularity alone does not supply this input.
quadraticDirichletFive_ne_one, quadraticDirichletFive_two.
steinbergProjectorDifference.
steinbergProjectorDifference_central, steinbergProjectorDifference_eval, steinbergProjectorDifference_twist, tamelyDihedral.
tamelyDihedral_parameter, tamelyDihedral_unramified_twist.
Their intended signatures, hypotheses, source locators and Checks are specified
in the corresponding README sections.
-/
