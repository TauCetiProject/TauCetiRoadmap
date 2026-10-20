import Mathlib
import TauCeti.NumberTheory.ModularForms.HeckeSlash.Operators
import TauCeti.NumberTheory.ModularForms.Newforms.Newform
import TauCeti.NumberTheory.ModularForms.Newforms.Coefficient

/-!
# AlgebraicModularFormsAndSerreWeights: representative target signatures

These are suggested Lean forms, not an exhaustive checklist. The roadmap in
README.md is definitive. This file records light definitions and theorem signatures
statable against the pinned Mathlib and Tau Ceti APIs. Geometric form spaces,
coherent correspondences, local classification of representations and residual
modularity witnesses are specified in the README.
The classical coefficient realization there allows the coefficient prime to divide
the level, using the base with both inverted. The rank-two pairing statement below
identifies the Frobenius characteristic polynomial, including scalar operators.
The classical attachments use holomorphic character spaces, number-field adic
completions and the integral-closure action of the absolute Galois group. The
weight-one prime moment uses the supplied cuspidal eigenform and good-index
eigenvalue interface. Attachment traces are Hecke eigenvalues; Fourier coefficients
agree with them under first-coefficient normalization.

The series operators describe coefficients; their preservation of geometric forms
is a separate target. The arithmetic tables take classified local data and do not
construct those data from a Galois representation. The eigenvalue-lifting theorem
allows inseparable coefficient extensions and does not prescribe a lifted vector.
-/

open scoped TensorProduct
open IsLocalRing

/-! ## Headline theorems -/
namespace TauCeti.ClassicalModularGalois

/-- A holomorphic good-prime eigenform of weight at least two has a continuous
semisimple attachment over every completion of its coefficient number field,
unramified outside the level and coefficient prime, with the prescribed arithmetic
Frobenius polynomials, including Eisenstein forms and coefficient primes dividing
the level. -/
theorem higherWeight_attachment {N : ℕ} [NeZero N] (k : ℤ) (hk : 2 ≤ k)
    (K : Type*) [Field K] [NumberField K] (ι : K →+* ℂ)
    (χ : (ZMod N)ˣ →* Kˣ)
    (f : modFormCharSpace k ((Units.map ι.toMonoidHom).comp χ))
    (hf : f ≠ 0) (a : ℕ → K)
    (heig : ∀ (q : ℕ) (hq : q.Prime) (_hqN : Nat.Coprime q N),
      HeckeRing.GL2.heckeTNat k q (_hn := ⟨hq.ne_zero⟩) f.val = ι (a q) • f.val)
    (ℓ : ℕ) [Fact ℓ.Prime]
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers K))
    (hv : (ℓ : NumberField.RingOfIntegers K) ∈ v.asIdeal) :
    let act := fun σ : Field.absoluteGaloisGroup ℚ =>
      ((show AlgebraicClosure ℚ ≃ₐ[ℚ] AlgebraicClosure ℚ from σ).restrictScalars ℤ).mapIntegralClosure
    ∃ ρ : Representation (v.adicCompletion K) (Field.absoluteGaloisGroup ℚ)
        (Fin 2 → v.adicCompletion K),
      Continuous (fun z : Field.absoluteGaloisGroup ℚ × (Fin 2 → v.adicCompletion K) =>
        ρ z.1 z.2) ∧ ρ.IsSemisimpleRepresentation ∧
      ∀ (q : ℕ) (_hq : q.Prime) (hqN : Nat.Coprime q N), q ≠ ℓ →
        ∀ Q : Ideal (integralClosure ℤ (AlgebraicClosure ℚ)), Q.IsMaximal →
          (q : integralClosure ℤ (AlgebraicClosure ℚ)) ∈ Q →
          (∀ σ, (∀ x, act σ x - x ∈ Q) → ρ σ = 1) ∧
          ∀ σ, (act σ).toAlgHom.IsArithFrobAt Q →
            LinearMap.charpoly (ρ σ) = Polynomial.X ^ 2 -
              Polynomial.C (NumberField.FinitePlace.embedding v (a q)) * Polynomial.X +
              Polynomial.C (NumberField.FinitePlace.embedding v
                ((χ (ZMod.unitOfCoprime q hqN) : K) * (q : K) ^ (k - 1))) := by
  sorry

/-- A holomorphic weight-one good-prime eigenform with odd character has a
continuous finite-image semisimple complex attachment, unramified outside its
level, whose arithmetic Frobenius traces are the Hecke eigenvalues. Its
irreducibility is equivalent to cuspidality of the form. -/
theorem weightOne_attachment {N : ℕ} [NeZero N]
    (χ : (ZMod N)ˣ →* ℂˣ) (hodd : (χ (-1) : ℂ) = -1)
    (f : modFormCharSpace 1 χ) (hf : f ≠ 0) (a : ℕ → ℂ)
    (heig : ∀ (q : ℕ) (hq : q.Prime) (_hqN : Nat.Coprime q N),
      HeckeRing.GL2.heckeTNat 1 q (_hn := ⟨hq.ne_zero⟩) f.val = a q • f.val) :
    let act := fun σ : Field.absoluteGaloisGroup ℚ =>
      ((show AlgebraicClosure ℚ ≃ₐ[ℚ] AlgebraicClosure ℚ from σ).restrictScalars ℤ).mapIntegralClosure
    ∃ ρ : Representation ℂ (Field.absoluteGaloisGroup ℚ) (Fin 2 → ℂ),
      Continuous (fun z : Field.absoluteGaloisGroup ℚ × (Fin 2 → ℂ) => ρ z.1 z.2) ∧
      (Set.range ρ).Finite ∧ ρ.IsSemisimpleRepresentation ∧
      (ρ.IsIrreducible ↔ ModularForm.IsCuspForm f.val) ∧
      ∀ (q : ℕ) (_hq : q.Prime) (hqN : Nat.Coprime q N),
        ∀ Q : Ideal (integralClosure ℤ (AlgebraicClosure ℚ)), Q.IsMaximal →
          (q : integralClosure ℤ (AlgebraicClosure ℚ)) ∈ Q →
          (∀ σ, (∀ x, act σ x - x ∈ Q) → ρ σ = 1) ∧
          ∀ σ, (act σ).toAlgHom.IsArithFrobAt Q →
            LinearMap.charpoly (ρ σ) = Polynomial.X ^ 2 - Polynomial.C (a q) * Polynomial.X +
              Polynomial.C (χ (ZMod.unitOfCoprime q hqN) : ℂ) := by
  sorry

end TauCeti.ClassicalModularGalois

namespace TauCeti.ResidualModularity

/-- A normalized coefficient sequence satisfies the prime Hecke recurrences
with second Euler coefficient `e`, including the coefficient at index zero. -/
def IsEigensequence {R : Type*} [CommRing R] (e a : ℕ → R) : Prop :=
  a 1 = 1 ∧ ∀ ℓ : ℕ, ℓ.Prime → ∀ n : ℕ,
    a (ℓ * n) + e ℓ * (if ℓ ∣ n then a (n / ℓ) else 0) = a ℓ * a n

/-- Applying a coefficient ring homomorphism preserves a normalized Hecke
coefficient sequence and maps its second Euler coefficient at the same time. -/
theorem IsEigensequence.map {R S : Type*} [CommRing R] [CommRing S]
    {e a : ℕ → R} (h : IsEigensequence e a) (φ : R →+* S) :
    IsEigensequence (φ ∘ e) (φ ∘ a) := by
  refine ⟨by simpa using congrArg φ h.1, ?_⟩
  intro ℓ hℓ n
  have hn := congrArg φ (h.2 ℓ hℓ n)
  by_cases hd : ℓ ∣ n <;> simpa [Function.comp_def, hd] using hn

/-- Realization of a ring-valued sequence as the Fourier coefficients of a
cusp form of the specified level and integer weight through a fixed coefficient map. -/
def IsRealizedIn (R : Type*) [CommRing R] (ι : R →+* ℂ)
    (N : ℕ) [NeZero N] (k : ℤ) (b : ℕ → R) : Prop :=
  ∃ f : CuspForm ((CongruenceSubgroup.Gamma1 N).map (Matrix.SpecialLinearGroup.mapGL ℝ)) k,
    ∀ n, (UpperHalfPlane.qExpansion 1 f).coeff n = ι (b n)

/-- A coefficient realization transports along a ring map when the complex
coefficient maps commute. The same cusp form realizes the mapped sequence. -/
theorem IsRealizedIn_baseChange {R S : Type*} [CommRing R] [CommRing S]
    {ι : R →+* ℂ} {j : S →+* ℂ} (φ : R →+* S) (hcomp : j.comp φ = ι)
    {N : ℕ} [NeZero N] {k : ℤ} {b : ℕ → R}
    (h : IsRealizedIn R ι N k b) : IsRealizedIn S j N k (φ ∘ b) := by
  obtain ⟨f, hf⟩ := h
  refine ⟨f, fun n => ?_⟩
  rw [hf n]
  exact (congrArg (fun ψ : R →+* ℂ => ψ (b n)) hcomp).symm

/-- In a specified character space over the complex numbers, the normalized
prime coefficient equations characterize full Hecke eigenforms. The character
is extended by zero, so primes dividing the level give the `U` equation. -/
theorem isEigensequence_iff_eigenform {N : ℕ} [NeZero N] {k : ℤ}
    (f : CuspForm ((CongruenceSubgroup.Gamma1 N).map (Matrix.SpecialLinearGroup.mapGL ℝ)) k)
    (χ : (ZMod N)ˣ →* ℂˣ) (hχ : f ∈ cuspFormCharSpace k χ)
    (h₁ : (UpperHalfPlane.qExpansion 1 f).coeff 1 = 1) :
    IsEigensequence
        (fun ℓ => (MulChar.ofUnitHom χ : DirichletCharacter ℂ N) ℓ * (ℓ : ℂ) ^ (k - 1))
        (fun n => (UpperHalfPlane.qExpansion 1 f).coeff n) ↔
      ∃ F : HeckeRing.GL2.Eigenform N k, F.toCuspForm = f ∧ F.χ = χ := by
  sorry

end TauCeti.ResidualModularity

namespace TauCeti.ResidualModularity

/-- A nonzero reduction of an integral holomorphic form of positive weight
with a good-prime Hecke eigenvalue system has a continuous semisimple residual
attachment over the chosen finite residue field. It is unramified outside the
level and residue characteristic and has the prescribed Frobenius polynomials.
The DVR, its coefficient embedding and its residue map specify the place. -/
theorem residual_attachment
    {N : ℕ} [NeZero N] (k : ℕ) (hk : 1 ≤ k)
    (O K κ : Type*) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [Field K] [NumberField K] [Algebra O K] [IsFractionRing O K]
    [Field κ] [Finite κ] [TopologicalSpace κ] [DiscreteTopology κ]
    (p : ℕ) [Fact p.Prime] [CharP κ p]
    (ι : K →+* ℂ) (red : O →+* κ)
    (hred : RingHom.ker red = maximalIdeal O)
    (χ : (ZMod N)ˣ →* Oˣ)
    (f : modFormCharSpace (k : ℤ)
      ((Units.map (ι.comp (algebraMap O K)).toMonoidHom).comp χ))
    (b : ℕ → O)
    (hb : ∀ n, (UpperHalfPlane.qExpansion 1 f.val).coeff n = ι (algebraMap O K (b n)))
    (hne : ∃ n, red (b n) ≠ 0) (a : ℕ → κ)
    (heig : ∀ (q : ℕ) (_hq : q.Prime) (hqN : Nat.Coprime q N), q ≠ p →
      ∀ n, red (b (q * n)) +
        (if q ∣ n then red ((q : O) ^ (k - 1) *
          (χ (ZMod.unitOfCoprime q hqN) : O) * b (n / q)) else 0) =
        a q * red (b n)) :
    let act := fun σ : Field.absoluteGaloisGroup ℚ =>
      ((show AlgebraicClosure ℚ ≃ₐ[ℚ] AlgebraicClosure ℚ from σ).restrictScalars ℤ).mapIntegralClosure
    ∃ ρ : Representation κ (Field.absoluteGaloisGroup ℚ) (Fin 2 → κ),
      Continuous (fun z : Field.absoluteGaloisGroup ℚ × (Fin 2 → κ) => ρ z.1 z.2) ∧
      ρ.IsSemisimpleRepresentation ∧
      ∀ (q : ℕ) (_hq : q.Prime) (hqN : Nat.Coprime q N), q ≠ p →
        ∀ Q : Ideal (integralClosure ℤ (AlgebraicClosure ℚ)), Q.IsMaximal →
          (q : integralClosure ℤ (AlgebraicClosure ℚ)) ∈ Q →
          (∀ σ, (∀ x, act σ x - x ∈ Q) → ρ σ = 1) ∧
          ∀ σ, (act σ).toAlgHom.IsArithFrobAt Q →
            LinearMap.charpoly (ρ σ) = Polynomial.X ^ 2 - Polynomial.C (a q) * Polynomial.X +
              Polynomial.C (red (χ (ZMod.unitOfCoprime q hqN) : O) * (q : κ) ^ (k - 1)) := by
  sorry

end TauCeti.ResidualModularity

namespace TauCeti.EigenvalueLifting

section DeligneSerre
variable (O K : Type*) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
  [Field K] [Algebra O K] [IsFractionRing O K]
variable {M ι : Type*} [AddCommGroup M] [Module O M]
  [Module.Finite O M] [Module.Free O M]

/-- A common residual eigenvalue system for commuting operators on a finite
free module over any DVR lifts to an integral eigenvector over a dominating DVR
with finite fraction-field extension and the specified residue-field embedding. -/
theorem deligneSerreEigenvalueLifting
    (T : ι → Module.End O M) (hcomm : ∀ i j, Commute (T i) (T j))
    (a : ι → ResidueField O) (f : ResidueField O ⊗[O] M) (hf : f ≠ 0)
    (heig : ∀ i, (T i).baseChange (ResidueField O) f = a i • f) :
    ∃ (L : IntermediateField K (AlgebraicClosure K)) (V : ValuationSubring L)
      (i : O →+* V) (j : ResidueField O →+* ResidueField V),
      letI : Algebra O V := i.toAlgebra
      Module.Finite K L ∧ IsDiscreteValuationRing V ∧
      Function.Injective i ∧ Function.Injective j ∧
      (∀ x : O, (i x : L) = algebraMap K L (algebraMap O K x)) ∧
      (residue V).comp i = j.comp (residue O) ∧
      Ideal.comap i (maximalIdeal V) = maximalIdeal O ∧
      ∃ (b : ι → V) (f' : V ⊗[O] M), f' ≠ 0 ∧
        ∀ t, (T t).baseChange V f' = b t • f' ∧ residue V (b t) = j (a t) := by
  sorry
end DeligneSerre

end TauCeti.EigenvalueLifting

namespace TauCeti.KatzModularForms

/-- A holomorphic congruence modular form with rational expansion has one
integer clearing all denominators, including primes dividing its level. -/
theorem boundedDenominators
    (N : ℕ) [NeZero N] (k : ℤ)
    (Γ : Subgroup (Matrix.SpecialLinearGroup (Fin 2) ℤ))
    (hlevel : CongruenceSubgroup.Gamma N ≤ Γ)
    (f : ModularForm (Γ.map (Matrix.SpecialLinearGroup.mapGL ℝ)) k)
    (a : ℕ → ℚ)
    (ha : ∀ n, (UpperHalfPlane.qExpansion (N : ℝ) f).coeff n = (a n : ℂ)) :
    ∃ D : ℕ, 0 < D ∧ ∀ n, ∃ b : ℤ, (D : ℚ) * a n = b := by
  sorry
end TauCeti.KatzModularForms

namespace TauCeti.KatzModularForms

/-! ## Layer R15.2: integral q-expansion and coherent Hecke theory -/

section QHecke
variable {A : Type*} [CommRing A]

/-- The formal Hecke coefficient model with `c=l^(k−1)` and diamond scalar `d`.
The geometric operator retains its full-level structures as specified in R15.2. -/
noncomputable def seriesHecke (l : ℕ) (c d : A) (f : PowerSeries A) : PowerSeries A :=
  PowerSeries.mk (fun n => PowerSeries.coeff (l * n) f +
    if l ∣ n then c * d * PowerSeries.coeff (n / l) f else 0)

/-- The two summands of the formal Hecke coefficient formula. -/
theorem seriesHecke_coefficient (l n : ℕ) (c d : A) (f : PowerSeries A) :
    PowerSeries.coeff n (seriesHecke l c d f) = PowerSeries.coeff (l * n) f +
      if l ∣ n then c * d * PowerSeries.coeff (n / l) f else 0 := by sorry

/-- The formal Hecke model commutes with every coefficient ring homomorphism. -/
theorem seriesHecke_map {B : Type*} [CommRing B] (u : A →+* B)
    (l : ℕ) (c d : A) (f : PowerSeries A) :
    PowerSeries.map u (seriesHecke l c d f) =
      seriesHecke l (u c) (u d) (PowerSeries.map u f) := by sorry

end QHecke

end TauCeti.KatzModularForms

/-! ## Layer R15.3: Hasse, seriesTheta and weight operations -/

namespace TauCeti.ModPModularForms
section Series
variable {A : Type*} [CommRing A]

/-- The series derivation `q d/dq`; geometric preservation is specified in R15.3. -/
noncomputable def seriesTheta (f : PowerSeries A) : PowerSeries A :=
  PowerSeries.mk (fun n => (n : A) * PowerSeries.coeff n f)

/-- The coefficient formula characterizes the series operator `q d/dq`. -/
theorem seriesTheta_coefficient (f : PowerSeries A) (n : ℕ) :
    PowerSeries.coeff n (seriesTheta f) = (n : A) * PowerSeries.coeff n f := by
  sorry

/-- The series theta operator agrees with `q` times the formal derivative. -/
theorem seriesTheta_eq_X_mul_derivative (f : PowerSeries A) :
    seriesTheta f = PowerSeries.X * PowerSeries.derivative f := by
  sorry

/-- The series theta operator satisfies the product rule. -/
theorem seriesTheta_mul (f g : PowerSeries A) :
    seriesTheta (f * g) = seriesTheta f * g + f * seriesTheta g := by
  sorry

/-- In characteristic `p` the series theta operator annihilates every pth power. -/
theorem seriesTheta_pow_charP (p : ℕ) [Fact p.Prime] [CharP A p]
    (g : PowerSeries A) : seriesTheta (g ^ p) = 0 := by
  sorry

/-- The residue-zero Cartier operator selects coefficients at multiples of `p`.
The generic `PowerSeries.cartier` API is available after the declared Tau Ceti pin;
geometric preservation is specified in R15.3. -/
noncomputable def qU (p : ℕ) : PowerSeries A →ₗ[A] PowerSeries A where
  toFun f := PowerSeries.mk (fun n => PowerSeries.coeff (p*n) f)
  map_add' f g := by ext n; simp
  map_smul' a f := by ext n; simp

/-- The residue-zero Cartier coefficient equation for the formal `U` operator. -/
theorem qU_coefficient (p n : ℕ) (f : PowerSeries A) :
    PowerSeries.coeff n (qU p f) = PowerSeries.coeff (p*n) f := by sorry

/-- Formal `U` is a left inverse of coefficient-linear `V` when `p>0`. -/
theorem qU_qV (p : ℕ) (hp : 0 < p) (f : PowerSeries A) : qU p (PowerSeries.expand p (Nat.ne_of_gt hp) f) = f := by sorry

/-- The formal weight-shifted Hecke identity holds over every commutative coefficient ring. -/
theorem seriesTheta_hecke (l : ℕ) (c d : A) (f : PowerSeries A) :
    TauCeti.KatzModularForms.seriesHecke l ((l : A)^2*c) d (seriesTheta f) =
      (l : A) • seriesTheta (TauCeti.KatzModularForms.seriesHecke l c d f) := by sorry

/-- Coefficient-linear expansion scales `q d/dq` by the expansion index. -/
theorem seriesTheta_expand (p : ℕ) (hp : 0 < p) (f : PowerSeries A) :
    seriesTheta (PowerSeries.expand p (Nat.ne_of_gt hp) f) =
      (p : A) • PowerSeries.expand p (Nat.ne_of_gt hp) (seriesTheta f) := by sorry

/-- Theta vanishes on coefficient-linear `V` in characteristic `p`. -/
theorem seriesTheta_expand_charP (p : ℕ) (hp : 0 < p) [CharP A p]
    (f : PowerSeries A) :
    seriesTheta (PowerSeries.expand p (Nat.ne_of_gt hp) f) = 0 := by sorry

/-- Weight one retains the `V` term in its formal Hecke formula. -/
theorem seriesHecke_weightOne (p : ℕ) (hp : 0 < p) (d : A) (f : PowerSeries A) :
    TauCeti.KatzModularForms.seriesHecke p 1 d f =
      qU p f + d • PowerSeries.expand p (Nat.ne_of_gt hp) f := by sorry
end Series

/-- Injectivity on uniformizer torsion detects injectivity on a power-torsion source. -/
theorem injective_of_injective_on_uniformizer_torsion
    {O M P : Type*} [CommRing O] [AddCommGroup M] [AddCommGroup P]
    [Module O M] [Module O P] (varpi : O) (F : M →ₗ[O] P)
    (htors : Module.IsTorsion' M (Submonoid.powers varpi))
    (hsoc : ∀ x : M, varpi • x = 0 → F x = 0 → x = 0) :
    Function.Injective F := by sorry

/-- Change of dual basis in a Frobenius-semilinear rank-one module. -/
theorem hasseScalar_weight {A : Type*} [CommRing A] (p : ℕ)
    [Fact p.Prime] [CharP A p]
    (F : A →ₛₗ[frobenius A p] A) (lambda : Aˣ) :
    (lambda : A) * F (↑(lambda⁻¹) : A) =
      (↑(lambda ^ (1-(p : ℤ))) : A) * F 1 := by sorry

/-- Edixhoven Proposition 3.3: small-prime arithmetic table on filtration and ordinarity data. -/
def smallThetaCycle (p k : ℕ) (ordinary : Bool) : Option (List ℕ) :=
  match p, k, ordinary with
  | 2, 1, _ => some [4]
  | 2, 2, false => some [2]
  | 2, 2, true => some [4]
  | 2, 3, true => some [6]
  | 3, 1, _ => some [5,9]
  | 3, 2, false => some [6,2]
  | 3, 2, true => some [6,6]
  | 3, 3, false => some [3,3]
  | 3, 3, true => some [5,9]
  | 3, 4, true => some [8,12]
  | _, _, _ => none

/-- The small-prime arithmetic table distinguishes absent and exceptional rows. -/
theorem thetaCyclesSmallCharacteristic :
    smallThetaCycle 2 3 false = none ∧ smallThetaCycle 2 3 true = some [6] ∧
    smallThetaCycle 3 2 false = some [6,2] ∧ smallThetaCycle 3 3 false = some [3,3] := by sorry

/-- Edixhoven Proposition 3.3: arithmetic table for `p>3` on classified filtration data. -/
def largeThetaCycle (p k : ℕ) (ordinary : Bool) : Option (List ℕ) :=
  if p.Prime ∧ 3 < p then
    let progression := fun start count => (List.range count).map (fun j => start+j*(p+1))
    if ordinary then
      if k=1 ∨ k=p then some (progression (p+2) (p-1))
      else if 2 ≤ k ∧ k ≤ p-1 then
        some (progression (k+p+1) (p-k) ++ progression (2*p+2-k) (k-1))
      else if k=p+1 then some (progression (2*p+2) (p-1))
      else none
    else
      if k=1 then some (progression (p+2) (p-1))
      else if k=2 then some (progression (p+3) (p-2) ++ [2])
      else if 3 ≤ k ∧ k ≤ p-1 then
        some (progression (k+p+1) (p-k) ++ progression (p+3-k) (k-2) ++ [k])
      else if k=p then some (progression 3 (p-2) ++ [p])
      else none
  else none

/-- Every admissible large-prime arithmetic row has `p−1` entries. -/
theorem thetaCycles (p k : ℕ) [Fact p.Prime] (hp : 3 < p)
    (hk : 1 ≤ k ∧ k ≤ p+1) (ordinary : Bool)
    (hadmissible : ordinary = false → k ≠ p+1) :
    ∃ cycle : List ℕ, largeThetaCycle p k ordinary = some cycle ∧
      cycle.length = p-1 := by sorry

/-- Exponent of the ordinary unit-character group at a prime power. -/
def ordinaryWeightDivisor (p m : ℕ) : ℕ :=
  if p = 2 then 2^(if m=1 then 0 else if m=2 then 1 else m-2)
  else (p-1)*p^(m-1)

/-- The ordinary weight divisor is the exponent of the full prime-power unit group. -/
theorem ordinaryWeightDivisor_eq_exponent (p m : ℕ) [Fact p.Prime] (hm : 1 ≤ m) :
    ordinaryWeightDivisor p m = Monoid.exponent (ZMod (p ^ m))ˣ := by
  sorry

end TauCeti.ModPModularForms

/-! ## Layer R15.4: the local Serre weight -/
namespace TauCeti.SerreWeight
/-- Three arithmetic branches of classified rank-two local data. -/
inductive LocalData where
  | niveauOne (a b : ℕ)
  | niveauTwo (a b : ℕ)
  | wild (alpha beta : ℕ) (peu : Bool)
  deriving DecidableEq

/-- Projection of the already normalized tame data, not a classification algorithm. -/
def tameExponents : LocalData → Option (ℕ × ℕ)
  | .niveauOne a b | .niveauTwo a b => some (a,b)
  | .wild _ _ _ => none

/-- Projects the ordered quotient/stable-line exponents; `LocalData` retains the peu/très branch. -/
def wildExponents : LocalData → Option (ℕ × ℕ)
  | .wild a b _ => some (a,b)
  | _ => none

/-- Classical Serre arithmetic table, retaining the unramified and dyadic corrections. -/
def serreWeight (p : ℕ) : LocalData → ℕ
  | .niveauOne a b => if a=0 ∧ b=0 then p else 1+p*a+b
  | .niveauTwo a b => 1+p*a+b
  | .wild alpha beta peu =>
      if beta=alpha+1 then
        if peu then 2+alpha*(p+1) else if p=2 then 4 else (alpha+1)*(p+1)
      else 1+p*min alpha beta+max alpha beta

/-- Niveau-two exponents satisfy the twist formula before renormalization. -/
theorem serreWeight_twist (p a b : ℕ) (hab : a ≤ b) :
    serreWeight p (.niveauTwo a b) =
      serreWeight p (.niveauTwo 0 (b-a)) + a*(p+1) := by sorry

/-- At odd primes the très weight exceeds the peu weight by `p−1`. -/
theorem serreWeight_wild (p alpha : ℕ) [Fact p.Prime] (hp : p ≠ 2) :
    serreWeight p (.wild alpha (alpha+1) false) =
      serreWeight p (.wild alpha (alpha+1) true) + (p-1) := by sorry

/-- Outside either adjacent exceptional branch, exchanging wild exponents preserves weight. -/
theorem serreWeight_wild_symm (p alpha beta : ℕ) (peu : Bool)
    (hab : beta ≠ alpha+1) (hba : alpha ≠ beta+1) :
    serreWeight p (.wild alpha beta peu) = serreWeight p (.wild beta alpha peu) := by sorry

/-- The tame arithmetic weight has the required determinant exponent modulo `p−1`. -/
theorem determinantWeightCongruence (p a b : ℕ) [Fact p.Prime] :
    Nat.ModEq (p-1) ((1+p*a+b)-1) (a+b) := by sorry

/-- Every admissible branch of the normalized arithmetic table has weight at least two. -/
theorem recipeLowerBound (p : ℕ) [Fact p.Prime] (d : LocalData)
    (h : match d with
      | .niveauOne a b => a ≤ b ∧ b ≤ p-2
      | .niveauTwo a b => a < b ∧ b ≤ p-1
      | .wild a b _ => a ≤ p-2 ∧ 1 ≤ b ∧ b ≤ p-1) :
    2 ≤ serreWeight p d := by sorry

/-- The tame arithmetic rows with exponents `(0,r)` have weight `r+1` in the FL range. -/
theorem fontaineLaffailleWeight (p r : ℕ) [Fact p.Prime] (hr : 1 ≤ r) (h : r ≤ p-2) :
    serreWeight p (.niveauTwo 0 r) = r+1 ∧
    serreWeight p (.niveauOne 0 r) = r+1 := by sorry

/-- The wild Fontaine–Laffaille row has weight `r+1`, with the peu condition at `r=1`. -/
theorem fontaineLaffailleWildWeight (p r : ℕ) [Fact p.Prime]
    (hr : 1 ≤ r) (h : r ≤ p-2) (peu : Bool) (hpeu : r = 1 → peu = true) :
    serreWeight p (.wild 0 r peu) = r+1 := by
  sorry

/-- The niveau-two arithmetic weight is two precisely for exponents `(0,1)`. -/
theorem weightTwoNiveauTwo (p a b : ℕ) (hp : 2 ≤ p) (hab : a < b) :
    serreWeight p (.niveauTwo a b) = 2 ↔ a=0 ∧ b=1 := by sorry

/-- Normalized dyadic arithmetic data have classical weight two or four. -/
theorem dyadicWeightTwoOrFour (d : LocalData)
    (h : match d with
      | .niveauOne a b => a=0 ∧ b=0
      | .niveauTwo a b => a=0 ∧ b=1
      | .wild a b _ => a=0 ∧ b=1) :
    serreWeight 2 d = 2 ∨ serreWeight 2 d = 4 := by sorry

/-- Every integer power of a character valued in `𝔽₂×` is trivial. -/
theorem dyadicCyclotomicCharacter {G : Type*} [Group G]
    (chi : G →* (ZMod 2)ˣ) (i : ℤ) : ∀ g : G, chi g ^ i = 1 := by sorry

/-- The Tate-extension arithmetic branch has the stated classical weights. -/
theorem semistableMultiplicativeWeight (p : ℕ) [Fact p.Prime] (peu : Bool) :
    serreWeight p (.wild 0 1 peu) =
      if peu then 2 else if p=2 then 4 else p+1 := by sorry

/-- The two normalized bad-dihedral numerical constraints give the two possible weights. -/
theorem badDihedralNormalizedWeight (p k : ℕ) [Fact p.Prime]
    (hp : 3 ≤ p) (hk : 2 ≤ k ∧ k ≤ p+1)
    (h : p=2*k-1 ∨ p=2*k-3) : k=(p+1)/2 ∨ k=(p+3)/2 := by sorry

/-- Edixhoven arithmetic table on the same classified data. -/
def edixhovenWeight (p : ℕ) : LocalData → ℕ
  | .niveauOne a b => 1+p*a+b
  | .niveauTwo a b => 1+p*a+b
  | .wild alpha beta peu =>
      1+p*min alpha beta+max alpha beta +
        if beta=alpha+1 ∧ peu=false then p-1 else 0

/-- The Edixhoven and classical arithmetic tables agree outside their unramified
and dyadic très exceptions, for every normalized local branch. -/
theorem edixhovenWeight_comparison (p : ℕ) [Fact p.Prime] (d : LocalData)
    (h : match d with
      | .niveauOne a b => a ≤ b ∧ b ≤ p-2
      | .niveauTwo a b => a < b ∧ b ≤ p-1
      | .wild a b _ => a ≤ p-2 ∧ 1 ≤ b ∧ b ≤ p-1) :
    edixhovenWeight p d =
      if d = .niveauOne 0 0 then 1
      else if p = 2 ∧ d = .wild 0 1 false then 3
      else serreWeight p d := by
  sorry

/-- The two dyadic exceptions distinguish Edixhoven and classical weights. -/
theorem edixhovenExceptionalValues :
    edixhovenWeight 2 (.niveauOne 0 0) = 1 ∧
    serreWeight 2 (.niveauOne 0 0) = 2 ∧
    edixhovenWeight 2 (.wild 0 1 false) = 3 ∧
    serreWeight 2 (.wild 0 1 false) = 4 := by sorry

end TauCeti.SerreWeight

/-! ## Layer R15.5: Deligne–Serre eigenvalue lifting -/
namespace TauCeti.EigenvalueLifting

section InvariantLine
variable {R k H V : Type*} [CommRing R] [Field k] [Algebra R k]
  [Ring H] [Algebra R H] [AddCommGroup V] [Module k V] [Module R V]
  [IsScalarTower R k V] [SMulCommClass R k V]

/-- A nonzero invariant line determines one algebra character. -/
theorem existsUnique_eigencharacter
    (r : H →ₐ[R] Module.End k V) (f : V) (hf : f ≠ 0)
    (hs : ∀ h : H, ∃ a : k, r h f = a • f) :
    ∃! χ : H →ₐ[R] k, ∀ h : H, r h f = χ h • f := by sorry

end InvariantLine

section ResidualAlgebra
variable {O k M ι : Type*} [CommRing O] [Field k] [Algebra O k]
  [AddCommGroup M] [Module O M]

/-- A line invariant under each operator is invariant under the generated algebra. -/
theorem adjoin_invariant_line (T : ι → Module.End O M) (f : k ⊗[O] M)
    (hs : ∀ i, ∃ a : k, (T i).baseChange k f = a • f) :
    ∀ h : Algebra.adjoin O (Set.range T),
      ∃ a : k, (h.val : Module.End O M).baseChange k f = a • f := by
  sorry
end ResidualAlgebra

section HorizontalPrime
variable {O H : Type*} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
  [CommRing H] [Algebra O H] [Module.Finite O H] [Module.Free O H]

/-- A residual character of a finite free DVR algebra has a horizontal prime below its kernel. -/
theorem horizontal_prime (χ : H →ₐ[O] ResidueField O) :
    ∃ P : Ideal H, P.IsPrime ∧ P ≤ RingHom.ker χ.toRingHom ∧
      Ideal.comap (algebraMap O H) P = ⊥ := by
  sorry
end HorizontalPrime

section CharacterLift
variable (O K : Type*) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
  [Field K] [Algebra O K] [IsFractionRing O K]
variable {H : Type*} [CommRing H] [Algebra O H]
  [Module.Finite O H] [Module.Free O H]

/-- An explicit residue-field square, not an equality between elements of
unrelated residue fields. Only the fraction field is required finite. -/
theorem character_valuation_lift (χ : H →ₐ[O] ResidueField O) :
    ∃ (L : IntermediateField K (AlgebraicClosure K)) (V : ValuationSubring L)
      (i : O →+* V) (j : ResidueField O →+* ResidueField V) (ψ : H →+* V),
      Module.Finite K L ∧ IsDiscreteValuationRing V ∧
      Function.Injective i ∧ Function.Injective j ∧
      (∀ x : O, (i x : L) = algebraMap K L (algebraMap O K x)) ∧
      ψ.comp (algebraMap O H) = i ∧
      (residue V).comp ψ = j.comp χ.toRingHom ∧
      Ideal.comap i (maximalIdeal V) = maximalIdeal O := by
  sorry
end CharacterLift

section Socle
variable {A V : Type*} [CommRing A] [AddCommGroup V] [Module A V]

/-- A nilpotent ideal annihilates a nonzero vector in every nonzero module. -/
theorem nilpotent_ideal_socle [Nontrivial V] (I : Ideal A) (hI : IsNilpotent I) :
    ∃ v : V, v ≠ 0 ∧ ∀ a ∈ I, a • v = 0 := by
  sorry

/-- Clear the finitely many annihilation denominators, rather than asserting
that a localized eigenvector already lies in the original module. -/
theorem localized_socle_descent [IsNoetherianRing A]
    (I : Ideal A) [I.IsMaximal] [IsArtinianRing (Localization.AtPrime I)]
    (hne : Nontrivial (LocalizedModule I.primeCompl V)) :
    ∃ v : V, v ≠ 0 ∧ ∀ a ∈ I, a • v = 0 := by
  sorry
end Socle

section FaithfulCharacter
variable {k H V : Type*} [Field k] [CommRing H] [Algebra k H]
  [Module.Finite k H] [AddCommGroup V] [Module k V] [Module.Finite k V]

/-- Every character of a finite-dimensional commutative algebra occurs in a faithful finite module. -/
theorem faithful_character_occurrence (r : H →ₐ[k] Module.End k V)
    (hr : Function.Injective r) (χ : H →ₐ[k] k) :
    ∃ v : V, v ≠ 0 ∧ ∀ h : H, r h v = χ h • v := by
  sorry

/-- A finite-dimensional commutative algebra action and its transposed action
on the field dual have the same support, including nonsemisimple actions. -/
theorem dual_support (r : H →ₐ[k] Module.End k V)
    (rDual : H →ₐ[k] Module.End k (Module.Dual k V))
    (hdual : ∀ h, rDual h = (r h).dualMap) :
    letI : Module H V := Module.compHom V r.toRingHom
    letI : Module H (Module.Dual k V) := Module.compHom (Module.Dual k V) rDual.toRingHom
    Module.support H V = Module.support H (Module.Dual k V) := by
  sorry
end FaithfulCharacter

section GenericFaithfulness
variable {O L M : Type*} [CommRing O] [IsDomain O] [CommRing L]
  [Algebra O L] [Module.Flat O L] [AddCommGroup M] [Module O M]
  [Module.Finite O M] [Module.Free O M]

/-- The pure-tensor formula fixes the canonical action. Its existence is the
usual tensor-product universal property; its injectivity is the substantive claim.
It is injectivity of the scalar-extended algebra, not just of `H`. -/
theorem generic_action_faithfulness (H : Subalgebra O (Module.End O M))
    (r : (L ⊗[O] H) →ₐ[L] Module.End L (L ⊗[O] M))
    (hr : ∀ (a : L) (h : H), r (a ⊗ₜ[O] h) =
      a • (h.val : Module.End O M).baseChange L) :
    Function.Injective r := by
  sorry
end GenericFaithfulness

section Denominators
variable {O K M ι : Type*} [CommRing O] [IsDomain O]
  [Field K] [Algebra O K] [IsFractionRing O K]
  [AddCommGroup M] [Module O M] [Module.Finite O M] [Module.Free O M]

/-- Clearing coordinates gives an integral representative of a generic eigenline. -/
theorem integral_eigenvector (T : ι → Module.End O M) (a : ι → O)
    (v : K ⊗[O] M) (hv : v ≠ 0)
    (heig : ∀ i, (T i).baseChange K v = algebraMap O K (a i) • v) :
    ∃ w : M, w ≠ 0 ∧ ∀ i, T i w = a i • w := by
  sorry
end Denominators


section RegressionExamples
variable {D : Type*} [CommRing D] [IsDomain D]

/-- Matrix `[[0,π],[0,0]]` over any domain: every nonzero eigenvector has `y=0`.
Specialize to a dominating DVR; its reduction therefore cannot be `e₂`. -/
theorem nilpotent_eigenvector_nonlifting (π : D) (hπ : π ≠ 0)
    (eigenvalue x y : D) (hv : x ≠ 0 ∨ y ≠ 0)
    (hfirst : π * y = eigenvalue * x) (hsecond : 0 = eigenvalue * y) :
    eigenvalue = 0 ∧ y = 0 := by
  sorry

/-- A nonzero eigenvector of `[[0,π],[1,0]]` forces `λ²=π`. -/
theorem ramified_eigenvalue_equation (π eigenvalue x y : D) (hv : x ≠ 0 ∨ y ≠ 0)
    (hfirst : π * y = eigenvalue * x) (hsecond : x = eigenvalue * y) : eigenvalue ^ 2 = π := by
  sorry

/-- A uniformizer is not a square in the DVR fraction field, so the companion
operator `[[0,π],[1,0]]` has no nonzero eigenvector over that field. -/
theorem uniformizer_requires_eigenvalue_extension
    {O K : Type*} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [Field K] [Algebra O K] [IsFractionRing O K]
    (π : O) (hπ : Irreducible π) :
    (∀ a : K, a ^ 2 ≠ algebraMap O K π) ∧
    ¬ ∃ eigenvalue x y : K, (x ≠ 0 ∨ y ≠ 0) ∧
      algebraMap O K π * y = eigenvalue * x ∧ x = eigenvalue * y := by
  sorry

/-- The first-projection representation cannot realize the second-projection character. -/
theorem nonfaithful_character_nonoccurrence {k : Type*} [Field k] :
    ¬ ∃ v : k, v ≠ 0 ∧ ∀ h : k × k, h.1 * v = h.2 * v := by
  sorry
end RegressionExamples

/-- A full eigenform with nonzero first coefficient has normalization one. -/
theorem normalizeTrueEigenform {K M : Type*} [Field K] [AddCommGroup M] [Module K M]
    (a₁ : M →ₗ[K] K) (f : M) (h : a₁ f ≠ 0) :
    a₁ ((a₁ f)⁻¹ • f) = 1 := by sorry

end TauCeti.EigenvalueLifting

/-! ## Layer R15.5A: Frobenius polynomials and classical weight-one prime moments -/
namespace TauCeti.ClassicalModularGalois

/-- The alternating pairing and transpose identity determine rank-two Frobenius
trace, determinant and characteristic polynomial over every field, including scalar
Frobenius and zero values of `epsilon` or `c`. The scalar `eigenvalue` is the Hecke eigenvalue of the character block. -/
theorem frobeniusPolynomial_of_pairing {K : Type*} [Field K]
    (F V : Matrix (Fin 2) (Fin 2) K) (eigenvalue epsilon c : K)
    (B : LinearMap.BilinForm K (Fin 2 → K)) (hB : B.IsAlt) (hperfect : B.Nondegenerate)
    (hhecke : F + epsilon • V = eigenvalue • (1 : Matrix (Fin 2) (Fin 2) K))
    (hproduct : F * V = c • (1 : Matrix (Fin 2) (Fin 2) K))
    (htranspose : ∀ x y, B (F.mulVec x) y = B x ((epsilon • V).mulVec y)) :
    F.trace = eigenvalue ∧ F.det = epsilon * c ∧
      F.charpoly = Polynomial.X^2 - Polynomial.C eigenvalue * Polynomial.X +
        Polynomial.C (epsilon * c) := by sorry

/-- A weight-one cusp eigensystem has a convergent good-prime second moment
for every real `s>1`, bounded by `log(1/(s−1))` plus a constant near one. -/
theorem weightOne_primeMoment {N : ℕ} [NeZero N]
    (f : HeckeRing.GL2.EigenformAwayFromLevel N 1) :
    let b := fun q : {q : ℕ // q.Prime ∧ Nat.Coprime q N} =>
      ‖f.eigenvalue ⟨q.val, q.property.1.pos⟩ q.property.2‖ ^ 2
    (∀ s : ℝ, 1 < s →
      Summable (fun q => b q * (q.val : ℝ) ^ (-s))) ∧
    ∃ C δ : ℝ, 0 < δ ∧ ∀ s : ℝ, 1 < s → s < 1 + δ →
      (∑' q, b q * (q.val : ℝ) ^ (-s)) ≤ Real.log (1 / (s - 1)) + C := by sorry

/-- Outside a prime set of arbitrarily small upper Dirichlet density, the good
eigenvalues of a weight-one cusp form lie in a finite set. The bound uses
`log(1/(s−1))` as its prime-sum normalization near one. -/
theorem weightOne_finiteEigenvalues {N : ℕ} [NeZero N]
    (f : HeckeRing.GL2.EigenformAwayFromLevel N 1) (η : ℝ) (hη : 0 < η) :
    ∃ Y : Finset ℂ, ∀ ε : ℝ, 0 < ε → ∃ δ : ℝ, 0 < δ ∧
      ∀ s : ℝ, 1 < s → s < 1 + δ →
        (∑' q : {q : {q : ℕ // q.Prime ∧ Nat.Coprime q N} //
          f.eigenvalue ⟨q.val, q.property.1.pos⟩ q.property.2 ∉ Y},
          (q.val.val : ℝ) ^ (-s)) ≤ (η + ε) * Real.log (1 / (s - 1)) := by
  sorry

end TauCeti.ClassicalModularGalois

/-! ## Layer R15.6: residual modularity and the classical target -/
namespace TauCeti.ResidualModularity

/-- The coefficient ring generated by all Hecke eigenvalues and nebentypus values of `f`. -/
def coefficientRing {N : ℕ} [NeZero N] {k : ℤ}
    (f : HeckeRing.GL2.Eigenform N k) : Subring ℂ :=
  Subring.closure (Set.range (fun n : ℕ+ => f.eigenvalue n) ∪
    Set.range (fun d : (ZMod N)ˣ => (f.χ d : ℂ)))

/-- One coefficient reduction gives unramifiedness and the arithmetic Frobenius
polynomials of the full cusp eigenform at every prime away from its level and `p`. -/
def ArisesFrom {N : ℕ} [NeZero N] {k : ℤ} (f : HeckeRing.GL2.Eigenform N k)
    {F : Type*} [Field F] [Finite F] (p : ℕ) [Fact p.Prime] [CharP F p]
    (ρ : Representation F (Field.absoluteGaloisGroup ℚ) (Fin 2 → F)) : Prop :=
  let act := fun σ : Field.absoluteGaloisGroup ℚ =>
    ((show AlgebraicClosure ℚ ≃ₐ[ℚ] AlgebraicClosure ℚ from σ).restrictScalars ℤ).mapIntegralClosure
  ∃ φ : coefficientRing f →+* F,
    ∀ (q : ℕ) (hq : q.Prime) (hqN : Nat.Coprime q N), q ≠ p →
      ∀ Q : Ideal (integralClosure ℤ (AlgebraicClosure ℚ)), Q.IsMaximal →
        (q : integralClosure ℤ (AlgebraicClosure ℚ)) ∈ Q →
        (∀ σ, (∀ x, act σ x - x ∈ Q) → ρ σ = 1) ∧
        ∀ σ, (act σ).toAlgHom.IsArithFrobAt Q →
          LinearMap.charpoly (ρ σ) = Polynomial.X ^ 2 -
            Polynomial.C (φ ⟨f.eigenvalue ⟨q, hq.pos⟩,
              Subring.subset_closure (Or.inl ⟨_, rfl⟩)⟩) * Polynomial.X +
            Polynomial.C (φ ⟨(f.χ (ZMod.unitOfCoprime q hqN) : ℂ),
              Subring.subset_closure (Or.inr ⟨_, rfl⟩)⟩ * (q : F) ^ (k - 1))

/-- Residual modularity is attachment to a full cusp eigenform of positive weight. -/
def IsModular {F : Type*} [Field F] [Finite F] (p : ℕ) [Fact p.Prime] [CharP F p]
    (ρ : Representation F (Field.absoluteGaloisGroup ℚ) (Fin 2 → F)) : Prop :=
  ∃ (N : ℕ) (_ : NeZero N) (k : ℤ) (_ : 1 ≤ k) (f : HeckeRing.GL2.Eigenform N k),
    ArisesFrom f p ρ

/-- Extending residual coefficients preserves attachment to the same full eigenform.
The matrix equality identifies `ρ'` with scalar extension in the standard bases. -/
theorem ArisesFrom.baseChange {N : ℕ} [NeZero N] {k : ℤ}
    (f : HeckeRing.GL2.Eigenform N k) {F F' : Type*}
    [Field F] [Finite F] [Field F'] [Finite F']
    (p : ℕ) [Fact p.Prime] [CharP F p] [CharP F' p]
    (ι : F →+* F') (hι : Function.Injective ι)
    (ρ : Representation F (Field.absoluteGaloisGroup ℚ) (Fin 2 → F))
    (ρ' : Representation F' (Field.absoluteGaloisGroup ℚ) (Fin 2 → F'))
    (hρ' : ∀ σ, LinearMap.toMatrix' (ρ' σ) = (LinearMap.toMatrix' (ρ σ)).map ι)
    (h : ArisesFrom f p ρ) : ArisesFrom f p ρ' := by sorry

/-- At every divisible level a full eigenform with the same good-prime system
retains residual attachment after a finite extension of the residue field. -/
theorem ArisesFrom.of_dvd {N M : ℕ} [NeZero N] [NeZero M] {k : ℤ}
    (hk : 1 ≤ k) (f : HeckeRing.GL2.Eigenform N k) (hNM : N ∣ M)
    {F : Type*} [Field F] [Finite F] (p : ℕ) [Fact p.Prime] [CharP F p]
    (ρ : Representation F (Field.absoluteGaloisGroup ℚ) (Fin 2 → F))
    (h : ArisesFrom f p ρ) :
    ∃ (F' : Type) (_ : Field F') (_ : Finite F') (_ : CharP F' p)
      (ι : F →+* F') (ρ' : Representation F' (Field.absoluteGaloisGroup ℚ) (Fin 2 → F'))
      (g : HeckeRing.GL2.Eigenform M k),
      Function.Injective ι ∧
      (∀ σ, LinearMap.toMatrix' (ρ' σ) = (LinearMap.toMatrix' (ρ σ)).map ι) ∧
      (∀ (q : ℕ) (hq : q.Prime) (hqM : Nat.Coprime q M),
        g.eigenvalue ⟨q, hq.pos⟩ = f.eigenvalue ⟨q, hq.pos⟩ ∧
        g.χ (ZMod.unitOfCoprime q hqM) =
          f.χ (ZMod.unitOfCoprime q (hqM.of_dvd_right hNM))) ∧
      ArisesFrom g p ρ' := by sorry

/-- Every rank-two representation sends an involution to determinant `−1`
in characteristic two; the involution matrix can still be nontrivial. -/
theorem isSType_p2_odd {G K : Type*} [Group G] [Field K] [CharP K 2]
    (rho : G →* Matrix.GeneralLinearGroup (Fin 2) K)
    (c : G) (hc : c*c=1) : (rho c : Matrix (Fin 2) (Fin 2) K).det = -1 := by
  sorry

/-- The determinant identity fixes the parity of the residual character. -/
theorem determinantParity {k : Type*} [Field k] (weight : ℕ) (hw : 1 ≤ weight)
    (epsilon : k) (h : (-1 : k) = epsilon * (-1 : k)^(weight-1)) :
    epsilon = (-1 : k)^weight := by sorry

end TauCeti.ResidualModularity

/-
README-only targets and Checks (qualified by the package namespaces below).
Their full signatures, hypotheses and sources are specified in README.md; these
names are references, not Lean declarations.

TauCeti.KatzModularForms:
  coefficientMap, coefficientMap_comp, coefficientMap_id, coefficientMap_not_always_iso,
  coefficientMap_tate, coefficientMap_zero, cuspForms, cuspForms_iff, cuspForms_inclusion,
  cuspForms_weight_zero, delta_section, eisenstein_not_cuspidal, formsLevelOne,
  formsLevelOne_baseChange, formsLevelTwo, formsLevelTwo_baseChange, forms_add, forms_ext,
  forms_negative, forms_odd_low_level, forms_weight_zero, heckeT, heckeT_delta, heckeT_integral,
  heckeT_level_divisible, heckeT_other_normalisation, heckeT_qExpansion, levelOne_E4,
  levelOne_baseChange_fails_at_2_3, levelOne_via_rigid, levelTwo_weight_two,
  levelTwo_cusp_dimensions, levelTwo_parity_baseChange

TauCeti.GeometricHecke:
  curveFricke, curveFricke_double, curveFricke_not_involution, curveFricke_projection,
  curveFricke_quotient, curveFricke_sq, diamond_cusp, diamond_minus_one, diamond_mul,
  diamond_one, diamond_torsion, fricke, fricke_coefficients, fricke_not_involution, fricke_sq,
  fricke_weight_one, fricke_weight_zero, heckeCohomology, heckeCohomology_boundary,
  heckeCohomology_coefficients, heckeCohomology_commute, heckeCohomology_sections,
  heckeCohomology_zero_coefficients, rootFricke, rootFricke_coefficients, rootFricke_dual,
  rootFricke_dual_evaluation, rootFricke_inverse_root, rootFricke_torsion, rootFricke_weight_zero

TauCeti.ModPModularForms:
  hasseInvariant, hasseInvariant_tate, hasseInvariant_weight, hasse_E4_mod5,
  hasse_no_level_one_lift_p2, hasse_weight_zero_filtration, qU_constant, qV_X,
  qV_linear_not_power, supersingularForms, supersingularForms_p2_five, supersingularForms_eval,
  supersingularForms_ext, supersingularForms_mul, supersingularForms_negative,
  supersingularForms_weight_zero, supersingularRestriction, theta, theta_filtration,
  theta_hasse, theta_hecke, theta_kills_pth_powers, theta_qexp

TauCeti.SerreWeight:
  raynaud_maximal_model, serreWeight_baseChange, serreWeight_level_two_p5,
  serreWeight_normalisation_nonexample,
  serreWeight_supersingular, serreWeight_unramified_shift, serreWeight_wild_generic,
  serreWeight_wild_isomorphic, serreWeight_wild_p2, serreWeight_wild_same_ss

TauCeti.EigenvalueLifting:
  diagonal_character_test, eigencharacter_apply, eigencharacter_rescale, eigencharacter_unique,
  nilpotent_character_test, scalar_character_test

TauCeti.ResidualModularity:
  ClassicalTarget, IsSType, Witness, arisesFrom_baseChange,
  ArisesFrom.iff_integral_model,
  ArisesFrom.iff_exists_maximalIdeal_hecke, ArisesFrom.iff_integralClosure_congruence,
  ArisesFrom.iff_agrees_galoisAnemicEigenSystem,
  integralQExpansionLattice_finiteFree, integralQExpansionLattice_spans,
  integralQExpansionLattice_hecke_stable, weightOne_three_weightTwo,
  eisenstein_chiNegThree_mod_three,
  arisesFrom_11a1_three, not_arisesFrom_trivial_11a1_three, not_arisesFrom_11a1_three_delta,
  isModular_11a1_three, isModular_11a1_five, not_isModular_trivial_three,
  classicalTarget_baseChange, classicalTarget_implies_modular, isSType_11a1_three,
  isSType_baseChange, isSType_p2_odd, katz_vs_reduction, modpCuspForms,
  modpCuspForms_baseChange, modpCuspForms_mem, modpCuspForms_zero, not_isSType_11a1_five,
  reduced_delta, target_dyadic, target_unramified, target_weight_two,
  witness_lattice_independent, witness_place_sensitive, witness_scalar_extension,
  witness_11a1_trivial
-/
