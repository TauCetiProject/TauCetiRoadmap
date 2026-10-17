import Mathlib
import TauCeti.NumberTheory.NumberField.Global.RayClass.Modulus
import TauCeti.NumberTheory.ModularForms.Newforms.Newform
import TauCeti.RepresentationTheory.ClassicalGroups.SymmetricPower
import TauCeti.RepresentationTheory.CharacterTwist
import TauCeti.RepresentationTheory.ProjectiveRepresentation.SchurMultiplier
import TauCeti.Algebra.Quaternion.Split

/-!
# GL₂ automorphic representations and transfer: representative target signatures

The mathematical roadmap is `README.md`. This file records light definitions and
end theorems and milestones statable against the pinned Mathlib and Tau Ceti APIs.
These are suggested forms, not an exhaustive checklist of the roadmap's targets.

AutomorphicLFunctionsAndLocalFactors AL.2, GL₂ newvectors, supplies the lower-left
and last-row subgroups. The comparisons take supplied subgroups with explicit
membership equalities on the existing matrix groups. Local smoothness
and admissibility are hypotheses on Mathlib representations; no local or global
representation carrier is replaced. Frobenius is geometric in the automorphic
normalization, monodromy is retained, and coefficient twists use the existing
symmetric powers and character-twist API. Automorphic classes, local types,
Whittaker models and their transfer maps have their full specification in README.

AutomorphicFormsOnReductiveGroups §§7.2–7.3 supplies adelization, its inverse,
raising and Casimir formulas, scalar normalization and Hecke and diamond comparisons.
R16.1/finite-level-comparison identifies these with the matrix and level realizations;
R16.6 compares the supplied primitive occurrence with local newvectors and conductors.

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
fixtures below represent the supplied rank-two Satake substitution.

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

example {G : Type*} [CommGroup G] [TopologicalSpace G] [IsTopologicalGroup G]
    (H : Subgroup G) :
    ∃ Ψ : ContinuousMonoidHom G ℂˣ,
      (∀ h : H, Ψ h = 1) ∧ (∀ g : G, Ψ g = 1) ∧ (Set.range Ψ).Finite := by sorry

example {G : Type*} [CommGroup G] [Finite G] [TopologicalSpace G]
    [IsTopologicalGroup G] [DiscreteTopology G] (H : Subgroup G) (χ : H →* ℂˣ) :
    ∃ Ψ : ContinuousMonoidHom G ℂˣ,
      (∀ h : H, Ψ h = χ h) ∧ (Set.range Ψ).Finite := by sorry

example {G : Type*} [CommGroup G] [TopologicalSpace G] [IsTopologicalGroup G]
    (H N : Subgroup G) [N.FiniteIndex] (hN : IsOpen (N : Set G))
    (χ : H →* ℂˣ) (h : H) (hh : (h : G) ∈ N) (hne : χ h ≠ 1) :
    ¬ ∃ Ψ : ContinuousMonoidHom G ℂˣ,
      (∀ h : H, Ψ h = χ h) ∧ (∀ n ∈ N, Ψ n = 1) ∧ (Set.range Ψ).Finite ∧
      (∀ g : G, Ψ g ^ Monoid.exponent (G ⧸ N) = 1) := by sorry

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

omit hK hI in
example : (!![(2 : ℂ), 1; -1, 0] - 1) ^ 2 = 0 ∧
    !![(2 : ℂ), 1; -1, 0] - 1 ≠ 0 := by sorry

omit hK hI in
example : !![(5 : ℂ), 6; -1, 0] ^ 2 -
    5 • !![(5 : ℂ), 6; -1, 0] + 6 • (1 : Matrix (Fin 2) (Fin 2) ℂ) = 0 := by sorry

omit hK hI in
example : !![(5 : ℂ), 6; -1, 0] ^ 2 -
    5 • !![(5 : ℂ), 6; -1, 0] + 3 • (1 : Matrix (Fin 2) (Fin 2) ℂ) ≠ 0 := by sorry

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

example (χ : Fˣ →* ℂˣ)
    (hχ : ∀ u : 𝒪[F]ˣ, χ (Units.map (algebraMap 𝒪[F] F).toMonoidHom u) = 1)
    (π : Representation ℂ (GeneralLinearGroup (Fin 2) F) ℂ)
    (hπ : ∀ g z, π g z = (χ (GeneralLinearGroup.det g) : ℂ) * z)
    (g : GeneralLinearGroup (Fin 2) F) (hg : χ (GeneralLinearGroup.det g) ≠ 1) :
    π g (1 : ℂ) ≠ 1 ∧
      Module.finrank ℂ (Representation.invariants (π.comp I.subtype)) ≠ 2 := by sorry

end IwahoriOldforms

/-! AutomorphicLFunctionsAndLocalFactors AL.2, GL₂ newvectors, supplies the least-level
conductor and normalized Whittaker line. The following classification checks supply a
nonempty level set in each concrete model and express its conductor as `Nat.find hex`. -/

section LocalModelFixtures
open scoped ValuativeRel
variable {p : ℕ} [Fact p.Prime]

/-- The norm-power character on Q_p with the normalized p-adic absolute value. -/
def localNormCharacter (p : ℕ) [Fact p.Prime] (t : ℝ) : ℚ_[p]ˣ →* ℂˣ := by sorry

/-- The norm character evaluates by the real power of the normalized absolute value. -/
theorem localNormCharacter_eval (t : ℝ) (u : ℚ_[p]ˣ) :
    (localNormCharacter p t u : ℂ) = (‖(u : ℚ_[p])‖ ^ t : ℝ) := by sorry

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
      (localPrincipalSeriesSpace χ₁ χ₂) := by sorry

/-- The induced action evaluates by right translation of its argument. -/
theorem localPrincipalSeriesRep_eval (χ₁ χ₂ : ℚ_[p]ˣ →* ℂˣ)
    (g x : GeneralLinearGroup (Fin 2) ℚ_[p]) (f : localPrincipalSeriesSpace χ₁ χ₂) :
    (localPrincipalSeriesRep χ₁ χ₂ g f : GeneralLinearGroup (Fin 2) ℚ_[p] → ℂ) x =
      (f : GeneralLinearGroup (Fin 2) ℚ_[p] → ℂ) (x * g) := by sorry

/-- Constants in the unnormalized flag-function realization of the reducible principal series. -/
def localSteinbergConstants (p : ℕ) [Fact p.Prime] :
    Submodule ℂ (localPrincipalSeriesSpace
      (localNormCharacter p (-(1/2))) (localNormCharacter p (1/2))) :=
  Submodule.span ℂ {⟨fun _ => 1, by sorry⟩}

/-- Steinberg is the flag-function quotient by constants, with a determinant twist. -/
def localSteinbergTwist (χ : ℚ_[p]ˣ →* ℂˣ) :
    Representation ℂ (GeneralLinearGroup (Fin 2) ℚ_[p])
      ((localPrincipalSeriesSpace (localNormCharacter p (-(1/2)))
        (localNormCharacter p (1/2))) ⧸ localSteinbergConstants p) := by sorry

/-- On the quotient, Steinberg's twist is the determinant character times right translation. -/
theorem localSteinbergTwist_quotient (χ : ℚ_[p]ˣ →* ℂˣ)
    (g : GeneralLinearGroup (Fin 2) ℚ_[p])
    (f : localPrincipalSeriesSpace (localNormCharacter p (-(1/2)))
      (localNormCharacter p (1/2))) :
    localSteinbergTwist χ g (Submodule.Quotient.mk f) =
      (χ (GeneralLinearGroup.det g) : ℂ) • Submodule.Quotient.mk
        (localPrincipalSeriesRep (localNormCharacter p (-(1/2)))
          (localNormCharacter p (1/2)) g f) := by sorry

-- The AL.2 last-row family, characterized on the integral matrix image.
variable (K₁ : ℕ → Subgroup (GeneralLinearGroup (Fin 2) ℚ_[p]))
    (hK₁ : ∀ n g, g ∈ K₁ n ↔ ∃ k : GeneralLinearGroup (Fin 2) 𝒪[ℚ_[p]],
      GeneralLinearGroup.map (algebraMap 𝒪[ℚ_[p]] ℚ_[p]) k = g ∧
        k.val 1 0 ∈ 𝓂[ℚ_[p]] ^ n ∧ k.val 1 1 - 1 ∈ 𝓂[ℚ_[p]] ^ n)
include hK₁

example (χ₁ χ₂ : ℚ_[p]ˣ →* ℂˣ)
    (hunit : ∀ u : 𝒪[ℚ_[p]]ˣ,
      χ₁ (Units.map (algebraMap 𝒪[ℚ_[p]] ℚ_[p]).toMonoidHom u) = 1 ∧
      χ₂ (Units.map (algebraMap 𝒪[ℚ_[p]] ℚ_[p]).toMonoidHom u) = 1)
    (hgen : χ₁ * χ₂⁻¹ ≠ localNormCharacter p 1 ∧
      χ₁ * χ₂⁻¹ ≠ localNormCharacter p (-1)) :
    ∃ hex : (∃ n, ∃ v ∈ Representation.invariants
      ((localPrincipalSeriesRep χ₁ χ₂).comp (K₁ n).subtype), v ≠ 0),
      @Nat.find _ (Classical.decPred _) hex = 0 := by sorry

example (χ : ℚ_[p]ˣ →* ℂˣ)
    (hunit : ∀ u : 𝒪[ℚ_[p]]ˣ,
      χ (Units.map (algebraMap 𝒪[ℚ_[p]] ℚ_[p]).toMonoidHom u) = 1) :
    ∃ hex : (∃ n, ∃ v ∈ Representation.invariants
      ((localSteinbergTwist χ).comp (K₁ n).subtype), v ≠ 0),
      @Nat.find _ (Classical.decPred _) hex = 1 := by sorry

example (χ : ℚ_[p]ˣ →* ℂˣ) (a : ℕ) (ha : 2 ≤ a)
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
/-- The nonsingular GL₂ spherical recurrence. -/
theorem sphericalValues_recurrence (α β : ℂ) (m : ℕ) :
    sphericalValues α β (m + 2) = (α + β) * sphericalValues α β (m + 1) -
      α * β * sphericalValues α β m := by sorry

/-- At equal Satake roots the value is (m+1)αᵐ. -/
theorem sphericalValues_equal (α : ℂ) (m : ℕ) :
    sphericalValues α α m = (m + 1) * α ^ m := by sorry

example (α β : ℂ) : sphericalValues α β 1 = α + β := by sorry

example (α β : ℂ) : sphericalValues α β 2 = α^2 + α*β + β^2 := by sorry

example : sphericalValues 1 1 2 = 3 := by sorry

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

/-- The nonzero rank-one monodromy matrix and its geometric Frobenius relation; q is a nonzero square root of the residue cardinality. -/
theorem steinbergParameter (q α : ℂ) (hq : q ≠ 0) (hα : α ≠ 0) :
    let N : Matrix (Fin 2) (Fin 2) ℂ := !![0, 1; 0, 0]
    let R : Matrix (Fin 2) (Fin 2) ℂ := !![α / q, 0; 0, α * q]
    N ^ 2 = 0 ∧ N ≠ 0 ∧ R * N = (q ^ 2)⁻¹ • (N * R) := by sorry

#check Matrix.det_smul
#check Complex.Gammaℝ_def
#check Complex.Gammaℂ_def
#check Complex.Gammaℝ_mul_Gammaℝ_add_one

example : Complex.Gammaℂ 1 = (Real.pi : ℂ)⁻¹ := by sorry

example : Complex.Gammaℝ 1 * Complex.Gammaℝ 2 = Complex.Gammaℂ 1 := by sorry

example : Complex.Gammaℂ 2 = (2 * (Real.pi : ℂ)^2)⁻¹ := by sorry

end Parameters

/-! ## Layer R16.4: Global cuspidal representations -/

section Global

/-- The subset with trivial stabilizer for a specified group action; the automorphic application uses determinant twists on cusp isomorphism classes. -/
def nonCM (H P : Type*) [Group H] [MulAction H P] : Set P :=
  {π | ∀ χ : H, χ • π = π → χ = 1}

/-- Character translation preserves the trivial-stabilizer condition. -/
theorem nonCM_twist {H P : Type*} [Group H] [MulAction H P]
    (π : P) (hπ : π ∈ nonCM H P) (χ : H) : χ • π ∈ nonCM H P := by sorry

/-- The central-character transformation law forces every rank-two self-twist to square to one. -/
theorem nonCM_self_twist_square {H P : Type*} [CommGroup H] [MulAction H P]
    (central : P → H) (hcentral : ∀ χ π, central (χ • π) = χ ^ 2 * central π)
    (π : P) (χ : H) (hχ : χ • π = π) : χ ^ 2 = 1 := by sorry

example {H : Type*} [Group H] (π : H) : π ∈ nonCM H H := by sorry

section TrivialCyclicAction
local instance : MulAction (Multiplicative (ZMod 3)) PUnit where
  smul _ _ := PUnit.unit
  one_smul _ := rfl
  mul_smul _ _ _ := rfl

example : PUnit.unit ∉ nonCM (Multiplicative (ZMod 3)) PUnit := by sorry
end TrivialCyclicAction

example {H P : Type*} [Group H] [MulAction H P] (π : P) (χ : H)
    (hne : χ ≠ 1) (hsquare : χ ^ 2 = 1) (hfix : χ • π = π) :
    π ∉ nonCM H P := by sorry

/-! ## Layer R16.5: Whittaker integrals and analytic recognition -/

/-- The unitary reflection s↦1−s becomes the classical reflection t↦k−t. -/
theorem globalEpsilon (k : ℂ) (s : ℂ) :
    (1 - s) + (k - 1) / 2 = k - (s + (k - 1) / 2) := by sorry

end Global

/-! ## Layer R16.6: Classical and Hilbert weights -/

section Classical

example {M N d : ℕ} [NeZero M] [NeZero N] [NeZero d] {k : ℤ}
    (f : HeckeRing.GL2.Newform M k) (hd : d * M ∣ N) (hMN : M < N) :
    CuspForm.levelRaise d (TauCeti.Gamma1_map_le_conjAct_scaleGL_of_dvd hd)
        f.toCuspForm ∈ TauCeti.cuspFormsOld N k ∧
      ∀ g : HeckeRing.GL2.Newform N k,
        CuspForm.levelRaise d (TauCeti.Gamma1_map_le_conjAct_scaleGL_of_dvd hd)
          f.toCuspForm ≠ g.toCuspForm := by sorry

example {N : ℕ} [NeZero N] {k : ℤ} (f : HeckeRing.GL2.Newform N k)
    (c : ℂ) (hc : c ≠ 1) : c * (UpperHalfPlane.qExpansion 1 f.toCuspForm).coeff 1 ≠ 1 := by sorry

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

example (g : Fin 1 → GeneralLinearGroup (Fin 2) ℂ) :
    Module.finrank ℂ (HilbertWeightSpace ℂ (fun _ : Fin 1 => 2)) = 1 ∧
      hilbertWeightRepresentation ℂ (fun _ : Fin 1 => 2) (fun _ => 0) g = 1 := by sorry

example (u : ℂˣ) :
    Module.finrank ℂ (HilbertWeightSpace ℂ (fun _ : Fin 1 => 3)) = 2 ∧
      hilbertWeightRepresentation ℂ (fun _ : Fin 1 => 3) (fun _ => 1)
          (fun _ => GeneralLinearGroup.scalar (Fin 2) u) =
        (u : ℂ) ^ 3 • (1 : Module.End ℂ (HilbertWeightSpace ℂ (fun _ : Fin 1 => 3))) := by sorry

example : ¬ ∃ m₁ m₂ w : ℤ, 2 + 2 * m₁ = w ∧ 3 + 2 * m₂ = w := by sorry

example (u : ℂˣ) :
    hilbertWeightFactor ℂ 2 (-1) (GeneralLinearGroup.scalar (Fin 2) u) =
      (u : ℂ) ^ (-2 : ℤ) • (1 : Module.End ℂ (Sym[ℂ]^0 (Fin 2 → ℂ))) ∧
    hilbertWeightRepresentation ℂ (fun _ : Fin 1 => 2) (fun _ => -1)
        (fun _ => GeneralLinearGroup.scalar (Fin 2) u) =
      (u : ℂ) ^ (-2 : ℤ) •
        (1 : Module.End ℂ (HilbertWeightSpace ℂ (fun _ : Fin 1 => 2))) := by sorry

example (u : Fin 2 → ℂˣ) :
    let k : Fin 2 → ℕ := ![2, 4]
    let m : Fin 2 → ℤ := ![1, 0]
    Module.finrank ℂ (HilbertWeightSpace ℂ k) = 3 ∧
      (∀ i, (k i : ℤ) + 2 * m i = 4) ∧
      hilbertWeightRepresentation ℂ k m
          (fun i => GeneralLinearGroup.scalar (Fin 2) (u i)) =
        ((u 0 : ℂ) ^ 2 * (u 1 : ℂ) ^ 2) •
          (1 : Module.End ℂ (HilbertWeightSpace ℂ k)) := by sorry

example (g : Fin 0 → GeneralLinearGroup (Fin 2) ℂ) :
    Module.finrank ℂ (HilbertWeightSpace ℂ (fun _ : Fin 0 => 2)) = 1 ∧
      hilbertWeightRepresentation ℂ (fun _ : Fin 0 => 2) (fun _ => 0) g = 1 := by sorry

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

example : Nonempty (QuaternionAlgebra K 1 0 1 ≃ₐ[K]
    Matrix (Fin 2) (Fin 2) K) := by sorry

example (v : HeightOneSpectrum (𝓞 K)) :
    ¬ ((∀ w ∈ (∅ : Finset (InfinitePlace K)), w.IsReal) ∧
      Even (({v} : Finset (HeightOneSpectrum (𝓞 K))).card +
        (∅ : Finset (InfinitePlace K)).card)) := by sorry

example (v : HeightOneSpectrum (𝓞 K)) (w : InfinitePlace K) (hw : w.IsReal) :
    (∀ z ∈ ({w} : Finset (InfinitePlace K)), z.IsReal) ∧
      Even (({v} : Finset (HeightOneSpectrum (𝓞 K))).card +
        ({w} : Finset (InfinitePlace K)).card) := by sorry

end QuaternionRamification

/-- Exchanging one member and one nonmember of a finite ramification set preserves even cardinality. -/
theorem quaternionSwap {V : Type*} [DecidableEq V] (S : Finset V)
    (v τ : V) (hv : v ∉ S) (hτ : τ ∈ S) (hvt : v ≠ τ) :
    Even S.card → Even (insert v (S.erase τ)).card := by sorry

example : Even (insert (2 : ℕ) (({0, 1} : Finset ℕ).erase 0)).card := by sorry

example : ¬ Even (insert (2 : ℕ) ({0, 1} : Finset ℕ)).card := by sorry

example : ¬ Even ({0} : Finset ℕ).card := by sorry

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

example (d : ℝ → ℝ≥0∞) :
    ((volume.withDensity d).map (fun t : ℝ => (t : AddCircle (1 : ℝ)))) {0} = 0 := by sorry

example (d : ℝ → ℝ≥0∞) :
    ((volume.withDensity d).map (fun t : ℝ => (t : AddCircle (1 : ℝ))))
      {((1 / 2 : ℝ) : AddCircle (1 : ℝ))} = 0 := by sorry

example :
    ((Measure.dirac (0 : ℝ)).map (fun t : ℝ => (t : AddCircle (1 : ℝ)))) {0} = 1 := by sorry

end SpectralCircle

end TauCeti.GL2Blueprint

namespace TauCeti.GL2Transfer

open _root_.Matrix

/-! ## Layer R17.4: Cyclic, solvable and cubic base change -/

section Satake
variable {K L : Type*} [CommRing K] [CommRing L]

/-- A matrix representative for the rank-two Satake substitution supplied by
AutomorphicSpectralTheory §§7.0b and 7.1, identified by README
R17.2/cyclic-local-matching: the canonical weak output has class `A ^ f` at an
unramified place of residue degree `f`. The formal value at zero is the identity. -/
def unramifiedBaseChange (A : GeneralLinearGroup (Fin 2) K)
    (f : ℕ) : GeneralLinearGroup (Fin 2) K := A ^ f

/-- Successive residue degrees in the supplied canonical base-change tower
give the same matrix representative as their product. -/
theorem unramifiedBaseChange_tower (A : GeneralLinearGroup (Fin 2) K) (f g : ℕ) :
    unramifiedBaseChange (unramifiedBaseChange A f) g =
      unramifiedBaseChange A (f * g) := by sorry

example (A : GeneralLinearGroup (Fin 2) K) : unramifiedBaseChange A 1 = A := by sorry

example (f : ℕ) : unramifiedBaseChange (1 : GeneralLinearGroup (Fin 2) K) f = 1 := by sorry

example (A : GeneralLinearGroup (Fin 2) ℚ) (hA : A.val = !![2, 0; 0, 3]) :
    (unramifiedBaseChange A 2).val = !![4, 0; 0, 9] ∧
    (unramifiedBaseChange A 2).val.trace = 13 ∧
    (unramifiedBaseChange A 2).val.det = 36 := by sorry

example (A : GeneralLinearGroup (Fin 2) ℚ) (hA : A.val = !![2, 0; 0, 3]) :
    unramifiedBaseChange A 2 ≠ unramifiedBaseChange A 1 := by sorry

example (A : GeneralLinearGroup (Fin 2) ℚ) (hA : A.val = !![2, 0; 0, 3]) :
    (unramifiedBaseChange (unramifiedBaseChange A 2) 3).val = !![64, 0; 0, 729] := by sorry

end Satake

section AdjointMatrix
variable {K : Type*} [Field K]

/-- The rank-three adjoint diagonal for a Satake pair; comparisons assume nonzero roots. -/
def adjointSatakeDiagonal (α β : K) : Matrix (Fin 3) (Fin 3) K :=
  diagonal ![α / β, 1, β / α]

example : adjointSatakeDiagonal (2 : ℚ) 3 =
    !![2/3, 0, 0; 0, 1, 0; 0, 0, 3/2] := by sorry

example (a : K) (ha : a ≠ 0) : adjointSatakeDiagonal a a = 1 := by sorry

/-- A common nonzero scalar twist leaves the adjoint Satake matrix unchanged. -/
theorem adjointSatakeDiagonal_twist (α β u : K) (hu : u ≠ 0) :
    adjointSatakeDiagonal (u * α) (u * β) = adjointSatakeDiagonal α β := by sorry

example : adjointSatakeDiagonal (2 : ℚ) 3 ≠ diagonal ![4, 6, 9] := by sorry

/-- The norm-character Satake parameters at the complementary-series boundary
have adjoint exponents +1/2, 0, -1/2. The Whittaker-type bridge in README uses
an attached induced module at this boundary, with its prescribed L-factors. -/
example (p : ℕ) [Fact p.Prime] (u : ℚ_[p]ˣ) :
    adjointSatakeDiagonal
        (GL2Blueprint.localNormCharacter p (1/4) u : ℂ)
        (GL2Blueprint.localNormCharacter p (-(1/4)) u : ℂ) =
      diagonal ![(GL2Blueprint.localNormCharacter p (1/2) u : ℂ), 1,
        (GL2Blueprint.localNormCharacter p (-(1/2)) u : ℂ)] := by sorry

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

example : pureCubicMatrix 0 1 0 ^ 3 = (2 : ℚ) • (1 : Matrix (Fin 3) (Fin 3) ℚ) := by sorry

example : pureCubicMatrix 1 0 0 = 1 := by sorry

example (a b c : ℚ) : (pureCubicMatrix a b c) 2 1 = b := by sorry

example : pureCubicNorm 1 1 1 = 1 := by sorry

example : pureCubicQuadratic 1 0 0 = 3 := by sorry

example : pureCubicNorm 0 1 0 = 2 := by sorry

example : pureCubicNorm 0 0 1 = 4 := by sorry

example : pureCubicQuadratic 1 1 1 = -3 := by sorry

example : pureCubicQuadratic 0 1 0 = 0 := by sorry

example : (Matrix.det (!![3, 0, 0; 0, 0, -3; 0, -3, 0] :
    Matrix (Fin 3) (Fin 3) ℚ)) = (-108 : ℚ) / 4 := by sorry

example : ¬ ∃ x : ZMod 8, x^2 = 5 := by sorry

end PureCubicPhase

section CubicExceptionFixtures

example : (!![0, -1; 1, -1] : Matrix (Fin 2) (Fin 2) ℤ)^3 = 1 := by sorry

example : (!![0, 1; 1, 0] : Matrix (Fin 2) (Fin 2) ℤ)^2 = 1 := by sorry

example :
    (!![0, 1; 1, 0] : Matrix (Fin 2) (Fin 2) ℤ) * !![0, -1; 1, -1] *
      !![0, 1; 1, 0] = (!![0, -1; 1, -1])^2 := by sorry

example : Matrix.mulVec (!![0, 1; 1, 0] : Matrix (Fin 2) (Fin 2) ℤ)
    ![1, 1] = ![1, 1] := by sorry

example : Matrix.mulVec (!![0, 1; 1, 0] : Matrix (Fin 2) (Fin 2) ℤ)
    ![1, -1] = ![-1, 1] := by sorry

example : Matrix.det (!![0, 1; 1, 0] : Matrix (Fin 2) (Fin 2) ℤ) = -1 := by sorry

end CubicExceptionFixtures

section QuadraticInduction

example {K : Type*} [CommRing K] (a b : K) :
    (!![0, a; b, 0] : Matrix (Fin 2) (Fin 2) K).det = -(a * b) := by sorry

end QuadraticInduction

/-- Finite ramification has the parity of the number of ramified real places. -/
theorem indefinite_parity (d t : ℕ) (hd : 1 ≤ d) (h : Even ((d - 1) + t)) :
    t % 2 = (d - 1) % 2 := by sorry

open Matrix IsDedekindDomain
open scoped BigOperators NumberField

/-! ## Layer R17.5: Automorphic induction and solvable Artin representations -/

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

section CharacteristicTwoLiftFixture
local instance : Fact (Nat.Prime 2) := ⟨by decide⟩

example :
    ∃ (E : Type) (_ : Field E) (_ : NumberField E)
      (v : HeightOneSpectrum (𝓞 E)),
      letI : v.asIdeal.IsPrime := v.isPrime
      ∃ (f : Localization.AtPrime v.asIdeal →+* AlgebraicClosure (ZMod 2))
        (ρ : GeneralLinearGroup (Fin 2) (ZMod 2) →*
          GeneralLinearGroup (Fin 2) (Localization.AtPrime v.asIdeal))
        (P : GeneralLinearGroup (Fin 2) (AlgebraicClosure (ZMod 2))),
        RingHom.ker f = IsLocalRing.maximalIdeal (Localization.AtPrime v.asIdeal) ∧
        ∀ g, GeneralLinearGroup.map
            (algebraMap (ZMod 2) (AlgebraicClosure (ZMod 2))) g =
          P * GeneralLinearGroup.map f (ρ g) * P⁻¹ := by sorry

end CharacteristicTwoLiftFixture

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

example : mixedSignInvolution ^ 2 = 1 := by sorry

example : mixedSignInvolution ≠ GeneralLinearGroup.scalar (Fin 2) (-1 : ℤˣ) := by sorry

example : GeneralLinearGroup.det mixedSignInvolution = (-1 : ℤˣ) := by sorry

example : GeneralLinearGroup.det
    (GeneralLinearGroup.map (Int.castRingHom (ZMod 3))
      (GeneralLinearGroup.scalar (Fin 2) (-1 : ℤˣ))) = 1 := by sorry

example : (1 : GeneralLinearGroup (Fin 2) ℤ) ^ 2 = 1 ∧
    GeneralLinearGroup.det
      (GeneralLinearGroup.map (Int.castRingHom (ZMod 2))
        (1 : GeneralLinearGroup (Fin 2) ℤ)) = (-1 : (ZMod 2)ˣ) ∧
    GeneralLinearGroup.det (1 : GeneralLinearGroup (Fin 2) ℤ) ≠ (-1 : ℤˣ) := by sorry

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

example (P : GeneralLinearGroup (Fin 2) (ZMod 3)) :
    GeneralLinearGroup.det
      (P * GeneralLinearGroup.map (Int.castRingHom (ZMod 3)) mixedSignInvolution * P⁻¹) =
        (-1 : (ZMod 3)ˣ) := by sorry

example (P : GeneralLinearGroup (Fin 2) (ZMod 3)) :
    GeneralLinearGroup.det
      (P * GeneralLinearGroup.map (Int.castRingHom (ZMod 3))
        (GeneralLinearGroup.scalar (Fin 2) (-1 : ℤˣ)) * P⁻¹) = 1 := by sorry

example (P : GeneralLinearGroup (Fin 2) (ZMod 2)) :
    (1 : GeneralLinearGroup (Fin 2) ℤ) ^ 2 = 1 ∧
    GeneralLinearGroup.det
      (P * GeneralLinearGroup.map (Int.castRingHom (ZMod 2))
        (1 : GeneralLinearGroup (Fin 2) ℤ) * P⁻¹) = (-1 : (ZMod 2)ˣ) ∧
    GeneralLinearGroup.det (1 : GeneralLinearGroup (Fin 2) ℤ) ≠ (-1 : ℤˣ) := by sorry

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

example : quadraticDirichletFive 0 = 0 := by sorry

example : quadraticDirichletFive 2 = -1 := by sorry

example : quadraticDirichletFive (-1) = 1 := by sorry

/-- The order-four additive character of ZMod 4 taking one to i. -/
def quarticCharacter : AddChar (ZMod 4) ℂ where
  toFun a := Complex.I ^ a.val
  map_zero_eq_one' := by sorry
  map_add_eq_mul' := by sorry

example : quarticCharacter 1 = Complex.I := by sorry

example : quarticCharacter 2 = -1 := by sorry

example : quarticCharacter 3 = -Complex.I := by sorry

example : quarticCharacter ^ 4 = 1 ∧ quarticCharacter ^ 2 ≠ 1 := by sorry

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

example : unramifiedQuadraticTwo twoUnit = -1 := by sorry

example (u : ℤ_[2]ˣ) :
    unramifiedQuadraticTwo (Units.map PadicInt.Coe.ringHom.toMonoidHom u) = 1 := by sorry

example (u : ℚ_[2]ˣ) (hu : IsOfFinOrder u) :
    unramifiedQuadraticTwo u = 1 := by sorry

example : unramifiedQuadraticTwo (-1) = 1 := by sorry

end CharacterPrescriptionFixtures

section FiniteSection

/-- Reduction modulo λ = (1 + √−2): ℤ[√−2] → F₃, sending √−2 to −1. -/
def redSqrtNegTwo : ℤ√(-2) →+* ZMod 3 := Zsqrtd.lift ⟨-1, by decide⟩

example : redSqrtNegTwo (⟨0, 1⟩ : ℤ√(-2)) = -1 := by sorry

example : redSqrtNegTwo (⟨1, 1⟩ : ℤ√(-2)) = 0 := by sorry

example : redSqrtNegTwo (⟨-1, 1⟩ : ℤ√(-2)) = 1 := by sorry

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

example {R : Type*} [CommRing R] (I : Ideal R) {d : ℕ} (hd : 1 < d) :
    I ^ d ≤ I ^ 1 ∧ ∃ n : ℕ, 0 < n ∧ (I ^ d) ^ n ≤ (I ^ 1) ^ (n + 1) := by sorry

example {R : Type*} [CommRing R] (I : Ideal R) : (I ^ 3) ^ 2 ≤ (I ^ 2) ^ 3 := by sorry

example : ¬ ∃ n : ℕ, 0 < n ∧
    ((Ideal.span ({(2 : ℤ)} : Set ℤ)) ^ 1) ^ n ≤
      ((Ideal.span ({(2 : ℤ)} : Set ℤ)) ^ 1) ^ (n + 1) := by sorry

end RamifiedCurveIdeals

section CharacteristicTwo
variable {G : Type*} [Group G] {k : Type*} [Field k] [CharP k 2]

/-- A finite determinant character in characteristic two has a finite square root; its inverse scalar twist has determinant one. -/
theorem determinant_untwist (r : G →* GeneralLinearGroup (Fin 2) k)
    (hfinite : Set.Finite (Set.range r)) :
    ∃ ξ : G →* kˣ, Set.Finite (Set.range ξ) ∧
      ∀ g, ξ g ^ 2 = GeneralLinearGroup.det (r g) ∧
        GeneralLinearGroup.det (GeneralLinearGroup.scalar (Fin 2) (ξ g)⁻¹ * r g) = 1 := by sorry

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
involution_det_eq_neg_one_of_reduction, involution_det_eq_neg_one_of_residual_conjugacy, involution_odd_of_reduction, nonCM_iff.
quadraticDirichletFive_ne_one, quadraticDirichletFive_two.
sphericalValues_swap, sphericalValues_zero, steinbergProjectorDifference.
steinbergProjectorDifference_central, steinbergProjectorDifference_eval, steinbergProjectorDifference_twist, tamelyDihedral.
tamelyDihedral_parameter, tamelyDihedral_unramified_twist, unramifiedBaseChange_conjugate.
unramifiedBaseChange_det, unramifiedBaseChange_map, unramifiedBaseChange_one.
Their intended signatures, hypotheses, source locators and Checks are specified
in the corresponding README sections.
-/
