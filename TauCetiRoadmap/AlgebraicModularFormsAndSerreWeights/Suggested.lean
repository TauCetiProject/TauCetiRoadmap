import Mathlib
import TauCeti.NumberTheory.ModularForms.Newforms.Coefficient
import TauCeti.RingTheory.DedekindDomain.IntegralClosure

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
The weight-one prime moment uses the supplied cuspidal eigenform and good-index
eigenvalue interface. Attachment traces are Hecke eigenvalues; Fourier coefficients
agree with them under first-coefficient normalization.

The series operators describe coefficients; their preservation of geometric forms
is a separate target. The arithmetic tables take classified local data and do not
construct those data from a Galois representation. The eigenvalue-lifting theorem
allows inseparable coefficient extensions and does not prescribe a lifted vector.
-/

open scoped TensorProduct
open IsLocalRing

#check TauCeti.integralClosure.isDedekindDomain

/-! ## Layer R15.1: geometric forms and comparison

Section spaces, descent and the integral logarithmic Kodaira–Spencer comparison
are README targets. Their moduli and logarithmic carriers are required there.
-/

namespace TauCeti.KatzModularForms

/-- The stabilizer equation in odd weight forces vanishing when 2 is a unit. -/
example {A M : Type*} [CommRing A] [AddCommGroup M] [Module A M]
    (h2 : IsUnit (2 : A)) (f : M) (h : -f = f) : f = 0 := by sorry

/-- The Eisenstein coefficients use `σ₃`, including its value at two. -/
example :
  let e4 : PowerSeries ℤ := PowerSeries.mk
    (fun n => if n = 0 then 1 else 240 * n.divisors.sum (fun d => (d : ℤ)^3))
  PowerSeries.coeff 0 e4 = 1 ∧ PowerSeries.coeff 1 e4 = 240 ∧
    PowerSeries.coeff 2 e4 = 2160 := by sorry

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

example (l : ℕ) (c d : A) : seriesHecke l c d 0 = 0 := by sorry

example (delta : PowerSeries ℤ) (h : PowerSeries.coeff 2 delta = -24) :
    PowerSeries.coeff 1 (seriesHecke 2 (2^11) 1 delta) = -24 := by sorry

example :
    PowerSeries.coeff 2 (seriesHecke 2 (1 : ℤ) (-1) PowerSeries.X) = -1 ∧
    PowerSeries.coeff 2 (seriesHecke 2 (1 : ℤ) 1 PowerSeries.X) = 1 := by sorry
/-- The leading coefficient of `Δ` remains one after every residue map. -/
example {O k : Type*} [CommRing O] [Field k] (place : O →+* k)
    (delta : PowerSeries O) (h : PowerSeries.coeff 1 delta = 1) :
    PowerSeries.map place delta ≠ 0 := by sorry
end QHecke
end TauCeti.KatzModularForms

namespace TauCeti.GeometricHecke
open CategoryTheory AlgebraicGeometry

/-- A curve square moving a point cannot be the identity. -/
example (T X : Scheme) (point : T ⟶ X) (w D : X ⟶ X)
    (hsq : w ≫ w = D) (hmoved : point ≫ D ≠ point) :
    w ≫ w ≠ 𝟙 X := by sorry

/-- The weight-two scalar square obstructs an involution. -/
example {M : Type*} [AddCommGroup M] [Module ℚ M] [Nontrivial M]
    (W : Module.End ℚ M) (h : W*W = (4 : ℚ) • (1 : Module.End ℚ M)) :
    W*W ≠ 1 := by sorry

/-- Inverse roots give opposite weight-one evaluations when the evaluation is nonzero. -/
example {K M : Type*} [Field K] [AddCommGroup M] [Module K M]
    (h2 : (2 : K) ≠ 0) (Wneg W : Module.End K M) (hsign : Wneg = -W)
    (ell : Module.Dual K M) (f : M) (hne : ell (W f) ≠ 0) :
    ell (Wneg f) ≠ ell (W f) := by sorry

/-- Infinity and zero cusp types have different boundary eigenvalues. -/
example : ((-1 + 3^2 : ℤ) : ZMod 5) = 3 ∧
    ((1 - 3^2 : ℤ) : ZMod 5) = 2 := by sorry
end TauCeti.GeometricHecke

/-! ## Layer R15.3: Hasse, seriesTheta and weight operations -/

namespace TauCeti.ModPModularForms
section Series
variable {A : Type*} [CommRing A]

/-- The series derivation `q d/dq`; geometric preservation is specified in R15.3. -/
noncomputable def seriesTheta (f : PowerSeries A) : PowerSeries A :=
  PowerSeries.mk (fun n => (n : A) * PowerSeries.coeff n f)

/-- `qU` selects coefficients; it does not assert geometric preservation. -/
noncomputable def qU (p : ℕ) : PowerSeries A →ₗ[A] PowerSeries A where
  toFun f := PowerSeries.mk (fun n => PowerSeries.coeff (p*n) f)
  map_add' f g := by ext n; simp
  map_smul' a f := by ext n; simp

/-- Coefficient selection by the formal `U` operator. -/
theorem qU_coefficient (p n : ℕ) (f : PowerSeries A) :
    PowerSeries.coeff n (qU p f) = PowerSeries.coeff (p*n) f := by sorry

/-- Formal `U` is a left inverse of coefficient-linear `V` when `p>0`. -/
theorem qU_qV (p : ℕ) (hp : 0 < p) (f : PowerSeries A) : qU p (PowerSeries.expand p (Nat.ne_of_gt hp) f) = f := by sorry

example (p : ℕ) (hp : 0 < p) :
    PowerSeries.expand p (Nat.ne_of_gt hp) (PowerSeries.X : PowerSeries A) = PowerSeries.X ^ p ∧
    qU p (PowerSeries.X ^ p : PowerSeries A) = PowerSeries.X := by sorry

example [IsDomain A] [CharP A 2] (a : A) (ha : a^2 ≠ a) :
    PowerSeries.expand 2 (by decide) (PowerSeries.C a * PowerSeries.X) ≠
      (PowerSeries.C a * PowerSeries.X)^2 := by sorry

example (p : ℕ) (hp : 2 ≤ p) : qU p (PowerSeries.X : PowerSeries A) = 0 := by sorry

example (p : ℕ) (hp : 0 < p) (a : A) :
    qU p (PowerSeries.C a) = PowerSeries.C a ∧
    PowerSeries.expand p (Nat.ne_of_gt hp) (PowerSeries.C a) = PowerSeries.C a := by sorry

example (f : PowerSeries A) (n : ℕ) :
    PowerSeries.coeff n (seriesTheta f) = (n : A) * PowerSeries.coeff n f := by sorry

example (delta : PowerSeries (ZMod 5)) (h : PowerSeries.coeff 2 delta = -24) :
    PowerSeries.coeff 2 (seriesTheta delta) = 2 := by sorry

example (p : ℕ) [Fact p.Prime] [CharP A p] (g : PowerSeries A) :
    seriesTheta (g^p) = 0 := by sorry

example : seriesTheta (1 : PowerSeries A) = 0 := by sorry

example : seriesTheta (PowerSeries.X^2 : PowerSeries ℤ) =
    2 * PowerSeries.X^2 := by sorry

/-- Formal coefficient identity underlying the weight-shifted Hecke relation. -/
theorem seriesTheta_hecke (p l : ℕ) [Fact p.Prime] [CharP A p]
    (c d : A) (f : PowerSeries A) :
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

/-- The expansion identity retains a nonzero scalar over mixed-characteristic torsion. -/
example :
    seriesTheta (PowerSeries.expand 3 (by decide) (PowerSeries.X : PowerSeries (ZMod 9))) =
      (3 : ZMod 9) • (PowerSeries.X ^ 3 : PowerSeries (ZMod 9)) ∧
    seriesTheta (PowerSeries.expand 3 (by decide) (PowerSeries.X : PowerSeries (ZMod 9))) ≠
      0 := by sorry

/-- The same `V` contribution has zero theta after passing to characteristic three. -/
example :
    seriesTheta (PowerSeries.expand 3 (by decide) (PowerSeries.X : PowerSeries (ZMod 3))) =
      0 := by sorry

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

/-- Eisenstein coefficient divisibilities underlying the first Hasse congruences. -/
example : 240 % 5 = 0 ∧ 504 % 7 = 0 ∧ 264 % 11 = 0 ∧
    65520 % 13 = 0 ∧ 691 % 13 ≠ 0 := by sorry

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

example : smallThetaCycle 3 1 false = some [5,9] ∧
    smallThetaCycle 3 1 true = some [5,9] := by sorry

example : largeThetaCycle 2 1 true = none := by sorry

example : largeThetaCycle 0 1 true = none := by sorry

example (p : ℕ) (hp : 3 < p) : largeThetaCycle p (p+1) false = none := by sorry

-- The arithmetic table distinguishes the ordinary final drop.
example : largeThetaCycle 5 2 false = some [8, 14, 20, 2] := by sorry

example : largeThetaCycle 5 2 true = some [8, 14, 20, 10] := by sorry

/-- Exponent of the ordinary unit-character group at a prime power. -/
def ordinaryWeightDivisor (p m : ℕ) : ℕ :=
  if p = 2 then 2^(if m=1 then 0 else if m=2 then 1 else m-2)
  else (p-1)*p^(m-1)


example : ordinaryWeightDivisor 2 1 = 1 := by sorry

example : ordinaryWeightDivisor 2 2 = 2 ∧ ordinaryWeightDivisor 2 3 = 2 ∧
    ordinaryWeightDivisor 2 4 = 4 := by sorry

example : ordinaryWeightDivisor 5 2 = 20 := by sorry

/-- The inverse deck character follows the weight-`k` trivialization. -/
theorem igusaCharacterCalculation {K : Type*} [Field K] (u a f : Kˣ) (k : ℤ) :
    (f * (u*a)^(-k) : Kˣ) = u^(-k) * (f*a^(-k)) := by sorry
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

example : tameExponents (.niveauTwo 1 3) = some (1, 3) ∧
    tameExponents (.wild 1 3 true) = none := by sorry

example : wildExponents (.wild 3 1 false) = some (3, 1) ∧
    wildExponents (.niveauOne 0 0) = none := by sorry

example : wildExponents (.niveauTwo 1 3) = none := by rfl

example : tameExponents (.niveauTwo 0 1) = some (0, 1) := by rfl

example : tameExponents (.niveauOne 0 0) = some (0, 0) := by rfl

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

/-- The arithmetic wild branch retains the peu/très and dyadic corrections. -/
theorem serreWeight_wild (p alpha beta : ℕ) (peu : Bool) :
    serreWeight p (.wild alpha beta peu) =
      if beta=alpha+1 then
        if peu then 2+alpha*(p+1) else if p=2 then 4 else (alpha+1)*(p+1)
      else 1+p*min alpha beta+max alpha beta := by sorry

example (p : ℕ) : serreWeight p (.niveauTwo 0 1) = 2 := by sorry

example (p : ℕ) [Fact p.Prime] : serreWeight p (.niveauOne 0 0) = p := by sorry

example : serreWeight 5 (.niveauTwo 1 3) = 9 ∧
    serreWeight 5 (.niveauTwo 0 2) = 3 ∧ 9 = 3+1*(5+1) := by sorry

example (p : ℕ) [Fact p.Prime] : ¬ (p-1 ≤ p-2) := by sorry

example (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) :
    serreWeight p (.wild 0 1 true) = 2 ∧
    serreWeight p (.wild 0 1 false) = p+1 := by sorry

example : serreWeight 5 (.wild 1 3 true) = 9 := by sorry

example : wildExponents (.wild 0 1 true) = wildExponents (.wild 0 1 false) ∧
    serreWeight 2 (.wild 0 1 true) ≠ serreWeight 2 (.wild 0 1 false) := by sorry

example : serreWeight 2 (.wild 0 1 true) = 2 ∧
    serreWeight 2 (.wild 0 1 false) = 4 := by sorry

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

/-- The dyadic très branch exceeds three; trivial cyclotomic twists preserve it. -/
example : serreWeight 2 (.wild 0 1 false) = 4 ∧
    ¬ serreWeight 2 (.wild 0 1 false) ≤ 2+1 := by sorry

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

/-- The two dyadic exceptions distinguish Edixhoven and classical weights. -/
theorem edixhovenExceptionalValues :
    edixhovenWeight 2 (.niveauOne 0 0) = 1 ∧
    serreWeight 2 (.niveauOne 0 0) = 2 ∧
    edixhovenWeight 2 (.wild 0 1 false) = 3 ∧
    serreWeight 2 (.wild 0 1 false) = 4 := by sorry
example : edixhovenWeight 5 (.niveauOne 0 0) = 1 ∧
    serreWeight 5 (.niveauOne 0 0) = 5 := by sorry

example (p : ℕ) [Fact p.Prime] :
    edixhovenWeight p (.niveauTwo 0 1) = 2 ∧
    serreWeight p (.niveauTwo 0 1) = 2 := by sorry

example : edixhovenWeight 2 (.wild 0 1 true) = 2 ∧
    serreWeight 2 (.wild 0 1 true) = 2 := by sorry
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

/-- Nilpotent operators have scalar zero on a nonzero eigenline. -/
example (r : H →ₐ[R] Module.End k V) (f : V) (hf : f ≠ 0)
    (χ : H →ₐ[R] k) (hχ : ∀ h, r h f = χ h • f)
    (h : H) (hnil : IsNilpotent h) : χ h = 0 := by sorry
end InvariantLine

section CharacterTests
variable {k : Type*} [Field k]

/-- The scalar line gives the scalar character. -/
example (r : k →ₐ[k] Module.End k k) (hr : ∀ a x : k, r a x = a * x)
    (χ : k →ₐ[k] k) (hχ : ∀ a : k, r a 1 = χ a • (1 : k)) (a : k) :
    χ a = a := by sorry

/-- The two coordinate lines of the diagonal action give different characters. -/
example (r : (k × k) →ₐ[k] Module.End k (k × k))
    (hr : ∀ h x : k × k, r h x = (h.1 * x.1, h.2 * x.2))
    (χ₁ χ₂ : (k × k) →ₐ[k] k)
    (hχ₁ : ∀ h, r h (1, 0) = χ₁ h • ((1, 0) : k × k))
    (hχ₂ : ∀ h, r h (0, 1) = χ₂ h • ((0, 1) : k × k)) :
    χ₁ (1, 0) = 1 ∧ χ₂ (1, 0) = 0 := by sorry
end CharacterTests

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

section DeligneSerre
variable (O K : Type*) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
  [Field K] [Algebra O K] [IsFractionRing O K]
variable {M ι : Type*} [AddCommGroup M] [Module O M]
  [Module.Finite O M] [Module.Free O M]

/-- Deligne–Serre 6.11. This retains the complete mathematical
content, with explicit scalar and residue maps. No prescribed reduction of `f′`
appears, no separability is assumed, and `V` need not be finite over `O`. -/
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

section RegressionExamples
variable {D : Type*} [CommRing D] [IsDomain D]

/-- Matrix `[[0,π],[0,0]]` over any domain: every nonzero eigenvector has `y=0`.
Specialize to a dominating DVR; its reduction therefore cannot be `e₂`. -/
theorem nilpotent_eigenvector_nonlifting (π : D) (hπ : π ≠ 0)
    (eigenvalue x y : D) (hv : x ≠ 0 ∨ y ≠ 0)
    (hfirst : π * y = eigenvalue * x) (hsecond : 0 = eigenvalue * y) :
    eigenvalue = 0 ∧ y = 0 := by
  sorry

example {k : Type*} [Field k] :
    (0 * (1 : k), 0) = (0 : k) • ((0, 1) : k × k) := by
  sorry

/-- A nonzero eigenvector of `[[0,π],[1,0]]` forces `λ²=π`. -/
theorem ramified_eigenvalue_equation (π eigenvalue x y : D) (hv : x ≠ 0 ∨ y ≠ 0)
    (hfirst : π * y = eigenvalue * x) (hsecond : x = eigenvalue * y) : eigenvalue ^ 2 = π := by
  sorry

example (π α : D) (hα : α ^ 2 = π) :
    (π * 1, α) = α • ((α, 1) : D × D) := by
  sorry

example {O K : Type*} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [Field K] [Algebra O K] [IsFractionRing O K]
    (π : O) (hπ : Irreducible π) :
    ∀ a : K, a ^ 2 ≠ algebraMap O K π := by
  sorry

example {K : Type*} [Field K] (π : K) (hπ : ∀ a : K, a ^ 2 ≠ π) :
    ¬ ∃ eigenvalue x y : K, (x ≠ 0 ∨ y ≠ 0) ∧ π * y = eigenvalue * x ∧ x = eigenvalue * y := by
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

/-- A shift divisible by `p−1` preserves the cyclotomic determinant exponent. -/
theorem weightShiftDeterminant (p k n : ℕ) (hn : (p-1) ∣ n) :
    Nat.ModEq (p-1) k (k+n) := by sorry
end TauCeti.EigenvalueLifting

/-! ## Layer R15.5A: Frobenius polynomials and classical weight-one prime moments -/
namespace TauCeti.ClassicalModularGalois

/-- The alternating pairing and transpose identity determine rank-two Frobenius
trace, determinant and characteristic polynomial, including scalar Frobenius.
The scalar `eigenvalue` is the Hecke eigenvalue of the character block. -/
theorem frobeniusPolynomial_of_pairing {K : Type*} [Field K] [CharZero K]
    (F V : Matrix (Fin 2) (Fin 2) K) (eigenvalue epsilon c : K)
    (hepsilon : epsilon ≠ 0) (hc : c ≠ 0)
    (B : LinearMap.BilinForm K (Fin 2 → K)) (hB : B.IsAlt) (hperfect : B.Nondegenerate)
    (hhecke : F + epsilon • V = eigenvalue • (1 : Matrix (Fin 2) (Fin 2) K))
    (hproduct : F * V = c • (1 : Matrix (Fin 2) (Fin 2) K))
    (htranspose : ∀ x y, B (F.mulVec x) y = B x ((epsilon • V).mulVec y)) :
    F.trace = eigenvalue ∧ F.det = epsilon * c ∧
      F.charpoly = Polynomial.X^2 - Polynomial.C eigenvalue * Polynomial.X +
        Polynomial.C (epsilon * c) := by sorry

/-- Scalar Frobenius has a repeated characteristic root. -/
example : ((2 : ℚ) • (1 : Matrix (Fin 2) (Fin 2) ℚ)).charpoly =
    (Polynomial.X - Polynomial.C (2 : ℚ))^2 := by sorry

/-- The two operator relations alone do not identify the characteristic polynomial. -/
example :
    (1 : Matrix (Fin 2) (Fin 2) ℚ) + (2 : ℚ) • 1 = (3 : ℚ) • 1 ∧
    (1 : Matrix (Fin 2) (Fin 2) ℚ) * ((2 : ℚ) • 1) = (2 : ℚ) • 1 ∧
    (1 : Matrix (Fin 2) (Fin 2) ℚ).charpoly ≠
      Polynomial.X^2 - Polynomial.C (3 : ℚ) * Polynomial.X + Polynomial.C 2 := by sorry

/-- Good-prime coefficients of a normalized cusp eigenform equal its Hecke eigenvalues. -/
example {N : ℕ} [NeZero N] {k : ℤ}
    (f : HeckeRing.GL2.EigenformAwayFromLevel N k)
    (h₁ : (UpperHalfPlane.qExpansion 1 f.toCuspForm).coeff 1 = 1)
    (n : ℕ+) (hn : Nat.Coprime (n : ℕ) N) :
    (UpperHalfPlane.qExpansion 1 f.toCuspForm).coeff (n : ℕ) = f.eigenvalue n hn :=
  f.qExpansion_coeff_eq_eigenvalue h₁ n hn

/-- The usual `E₄` has eigenvalue nine at two, distinct from its Fourier coefficient. -/
example (e4 : PowerSeries ℂ) (eigenvalue : ℂ)
    (h₁ : PowerSeries.coeff 1 e4 = 240) (h₂ : PowerSeries.coeff 2 e4 = 2160)
    (heig : TauCeti.KatzModularForms.seriesHecke 2 8 1 e4 = eigenvalue • e4) :
    eigenvalue = 9 ∧ PowerSeries.coeff 2 e4 ≠ eigenvalue := by sorry

/-- The eigenvalue of a nonzero eigenvector is invariant under nonzero rescaling. -/
example {K M : Type*} [Field K] [AddCommGroup M] [Module K M]
    (T : Module.End K M) (f : M) (hf : f ≠ 0) (c eigenvalue b : K) (hc : c ≠ 0)
    (hf_eig : T f = eigenvalue • f) (hcf_eig : T (c • f) = b • (c • f)) :
    b = eigenvalue := by sorry

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

end TauCeti.ClassicalModularGalois

/-! ## Layer R15.6: residual modularity and the classical target -/
namespace TauCeti.ResidualModularity

/-- Determinant oddness is automatic for an involution in characteristic two. -/
example {G K : Type*} [Group G] [Field K] [CharP K 2]
    (rho : G →* Matrix.GeneralLinearGroup (Fin 2) K)
    (c : G) (hc : c*c=1) : (rho c : Matrix (Fin 2) (Fin 2) K).det = -1 := by sorry

/-- The Frobenius polynomial of 11a1 at two modulo three differs from the trivial one. -/
example (F : Matrix (Fin 2) (Fin 2) (ZMod 3))
    (htrace : Matrix.trace F = 1) (hdet : F.det = 2) :
    F.charpoly ≠ (1 : Matrix (Fin 2) (Fin 2) (ZMod 3)).charpoly := by sorry

/-- The different Frobenius traces of 11a1 and `Δ` at two modulo three exclude attachment. -/
example (F D : Matrix (Fin 2) (Fin 2) (ZMod 3))
    (hF : Matrix.trace F = 1) (hD : Matrix.trace D = 0) :
    F.charpoly ≠ D.charpoly := by sorry

/-- The trivial rank-two representation over `𝔽₃` cannot satisfy determinant oddness. -/
example {G : Type*} [Group G]
    (rho : G →* Matrix.GeneralLinearGroup (Fin 2) (ZMod 3)) (c : G)
    (hodd : (rho c : Matrix (Fin 2) (Fin 2) (ZMod 3)).det = -1) :
    rho ≠ 1 := by sorry

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
  serreWeight_baseChange, serreWeight_level_two_p5, serreWeight_normalisation_nonexample,
  serreWeight_supersingular, serreWeight_unramified_shift, serreWeight_wild_generic,
  serreWeight_wild_isomorphic, serreWeight_wild_p2, serreWeight_wild_same_ss

TauCeti.EigenvalueLifting:
  diagonal_character_test, eigencharacter_apply, eigencharacter_rescale, eigencharacter_unique,
  nilpotent_character_test, scalar_character_test

TauCeti.ResidualModularity:
  ArisesFrom, ClassicalTarget, IsModular, IsSType, Witness, arisesFrom_baseChange,
  arisesFrom_11a1_three, not_arisesFrom_trivial_11a1_three, not_arisesFrom_11a1_three_delta,
  isModular_11a1_three, isModular_11a1_five, not_isModular_trivial_three,
  classicalTarget_baseChange, classicalTarget_implies_modular, isSType_11a1_three,
  isSType_baseChange, isSType_p2_odd, katz_vs_reduction, modpCuspForms,
  modpCuspForms_baseChange, modpCuspForms_mem, modpCuspForms_zero, not_isSType_11a1_five,
  reduced_delta, target_dyadic, target_unramified, target_weight_two,
  witness_lattice_independent, witness_place_sensitive, witness_scalar_extension,
  witness_11a1_trivial
-/
