import Mathlib
import TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.XSubT
import TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.SelmerGroupA

/-!
# ComputationalNumberTheory: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti APIs, with only the simple
definitions needed to express them.

The acceptance targets are Rabin's criterion; Pratt soundness, completeness and the
quadratic size bound; the Miller–Rabin bound; AKS and Pocklington primality criteria;
coprime Hensel factorization over complete DVRs and prime-power quotients; the
p-radical multiplier criterion; Ore's residual criterion; the local square and
prime-decomposition root criteria; integral Miller and modular bases and the
congruence Sturm bound; the nonordinary level-one classification below 200; complete
local descent images and the finite elliptic p-saturation criterion; complete root
isolation; quantitative continued Dirichlet and cusp-form error bounds; and Platt's
bounded-height and central nonvanishing theorems.

The weight-82 companion and the ordinary companion list are stated on scalar
extensions of the integral cusp lattices. Their Hecke actions are bundled integer
endomorphisms tied to the native Fourier recurrence; scalar extension uses Mathlib's
tensor product. Every headline listed above and these two companion headlines is
statable with these simple definitions at the pins.
-/

noncomputable section

open Polynomial
open scoped MatrixGroups

namespace TauCetiRoadmap.ComputationalNumberTheory

/-! ## Layer 0: exact presentations -/

/-- **Isolated algebraic root presentation** (README 0.8): a nonzero rational polynomial and a
closed rational rectangle containing exactly one of its complex roots. Repeated roots are allowed;
uniqueness concerns distinct roots. -/
structure IsolatedAlgebraicRoot where
  poly : ℚ[X]
  poly_ne_zero : poly ≠ 0
  re : NonemptyInterval ℚ
  im : NonemptyInterval ℚ
  isolates : ∃! z : ℂ, aeval z poly = 0 ∧ ((re.fst : ℝ) ≤ z.re ∧ z.re ≤ re.snd) ∧
    ((im.fst : ℝ) ≤ z.im ∧ z.im ≤ im.snd)

/-- The decoded value of a presentation: the unique root in its rectangle. -/
def IsolatedAlgebraicRoot.value (c : IsolatedAlgebraicRoot) : ℂ :=
  c.isolates.exists.choose

/-- **Rabin irreducibility presentation** (README 0.15), as a finite family of mathematical conditions:
`f` is monic of positive degree `n`, divides `X^(q^n) − X`, and is coprime to `X^(q^(n/s)) − X`
for every prime `s ∣ n`. Coprimality expresses existence of Bézout identities. -/
structure RabinCriterion {F : Type*} [Field F] [Fintype F] (f : F[X]) : Prop where
  monic : f.Monic
  natDegree_pos : 0 < f.natDegree
  dvd_frobenius : f ∣ X ^ (Fintype.card F ^ f.natDegree) - X
  coprime : ∀ s ∈ f.natDegree.primeFactors,
    IsCoprime (X ^ (Fintype.card F ^ (f.natDegree / s)) - X) f

/-- Rabin's Frobenius divisibility and coprimality conditions characterize monic
irreducible polynomials over every finite field (README §0.15; Shoup Exercise 20.2(a)). -/
theorem rabin_iff_irreducible {F : Type*} [Field F] [Fintype F]
    (f : F[X]) (hf : f.Monic) : RabinCriterion f ↔ Irreducible f := by
  sorry

/-! ## Layer 1: primality and factorization presentations -/

/-- **Recursive Pratt presentation** (README 1.1): the leaf `2`, or a node `(n, a, children)`
whose children certify the prime factors of `n − 1`, repeated with multiplicity. -/
inductive PrattTree where
  | two
  | node (n a : ℕ) (children : List PrattTree)

/-- The value: `2` at the leaf and the stored `n` at a node. -/
def PrattTree.value : PrattTree → ℕ
  | .two => 2
  | .node n _ _ => n

/-- Arithmetic conditions at a Pratt node: bounds, child product, Lucas congruences. -/
def PrattTree.nodeConditions (n a : ℕ) (cs : List PrattTree) : Prop :=
  3 ≤ n ∧ 0 < a ∧ a < n ∧ (cs.map PrattTree.value).prod = n - 1 ∧
    a ^ (n - 1) % n = 1 ∧ ∀ c ∈ cs, a ^ ((n - 1) / c.value) % n ≠ 1

mutual
/-- Validity is the Lucas conditions at each node, and validity of all its children. -/
def PrattTree.valid : PrattTree → Prop
  | .two => (2 : ℕ).Prime
  | .node n a cs => PrattTree.nodeConditions n a cs ∧ PrattTree.validList cs
/-- Every member of a finite list of Pratt trees is valid. -/
def PrattTree.validList : List PrattTree → Prop
  | [] => ∀ c ∈ ([] : List PrattTree), c.value.Prime
  | c :: cs => PrattTree.valid c ∧ PrattTree.validList cs

end

/-- **Soundness of Pratt presentations** (README 1.3). -/
theorem PrattTree.sound (c : PrattTree) (h : c.valid) : c.value.Prime := by
  sorry

/-- **Completeness of Pratt presentations** (README 1.4). -/
theorem PrattTree.complete (n : ℕ) (hn : n.Prime) :
    ∃ c : PrattTree, c.valid ∧ c.value = n := by
  sorry

mutual
/-- **Bit size of a Pratt tree** (README 1.5): one tag bit, the binary lengths of `n`, `a` and the
child count, and the sizes of all children, repeated children charged repeatedly. -/
def prattBitSize : PrattTree → ℕ
  | .two => 1
  | .node n a cs => 1 + (Nat.log 2 n + 1) + (Nat.log 2 a + 1) + (Nat.log 2 cs.length + 1) +
      prattBitSizeList cs
/-- The total size of a list of trees. -/
def prattBitSizeList : List PrattTree → ℕ
  | [] => 0
  | c :: cs => prattBitSize c + prattBitSizeList cs

end

/-- **Quadratic size of Pratt presentations** (README 1.6). -/
theorem pratt_small_tree : ∃ C : ℕ, ∀ n : ℕ, n.Prime →
    ∃ c : PrattTree, c.valid ∧ c.value = n ∧
      prattBitSize c ≤ C * (Nat.log 2 n + 1) ^ 2 := by
  sorry

/-- **Strong Miller–Rabin liar** (README 1.7): with `n − 1 = 2^h·t`, `t` odd, either `a^t = 1` or
`a^(t·2^j) = −1` in `ZMod n` for some `j < h`. The sample space is `1, …, n − 1`. -/
def StrongLiar (n a : ℕ) : Prop :=
  1 < n ∧ Odd n ∧ 0 < a ∧ a < n ∧
    ((a : ZMod n) ^ ((n - 1) / 2 ^ (n - 1).factorization 2) = 1 ∨
      ∃ j < (n - 1).factorization 2,
        (a : ZMod n) ^ ((n - 1) / 2 ^ (n - 1).factorization 2 * 2 ^ j) = -1)

/-- **The Miller–Rabin bound** (README 1.9): an odd composite `n` has at most `(n − 1)/4` strong
liars among `1, …, n − 1`. -/
theorem strongLiar_card_le (n : ℕ) (hn : 1 < n) (hodd : Odd n) (hc : ¬ n.Prime) :
    4 * Nat.card {a : ℕ // StrongLiar n a} ≤ n - 1 := by
  sorry

/-- The multiplicative order of the residue class of `n` modulo `r`. -/
def aksOrder (n r : ℕ) : ℕ := orderOf (n : ZMod r)

/-- Binary length, with length one assigned to zero. -/
def aksLen (n : ℕ) : ℕ := Nat.log 2 n + 1

/-- The least AKS-admissible modulus, with sentinel zero at `n ≤ 1`. -/
def aksParameter (n : ℕ) : ℕ :=
  if hn : n ≤ 1 then 0 else
    Nat.find (show ∃ r : ℕ, 2 ≤ r ∧ (1 < Nat.gcd n r ∨
        (Nat.Coprime n r ∧ 4 * aksLen n ^ 2 < aksOrder n r)) from
      ⟨n, by omega, Or.inl (by simpa using (show 1 < n by omega))⟩)

/-- **AKS polynomial congruences** (README 1.12): `(X + j)^n ≡ X^n + j` modulo `X^r − 1` over
`ZMod n` for `1 ≤ j ≤ ℓ`. -/
def AKSIdentities (n r ℓ : ℕ) : Prop :=
  ∀ j : ℕ, 1 ≤ j → j ≤ ℓ →
    (X + C (j : ZMod n)) ^ n %ₘ (X ^ r - 1) = (X ^ n + C (j : ZMod n)) %ₘ (X ^ r - 1)

/-- **Shoup's AKS test** (README 1.13), as an arithmetic predicate excluding
`n ≤ 1` and perfect powers, and imposing the finite congruence family up to `2·len(n)·⌊√r⌋ + 1`. -/
def AKSAccepts (n : ℕ) : Prop :=
  1 < n ∧ (¬ ∃ a b : ℕ, 1 < a ∧ 1 < b ∧ a ^ b = n) ∧
    (aksParameter n = n ∨ (Nat.gcd n (aksParameter n) = 1 ∧
      AKSIdentities n (aksParameter n) (2 * aksLen n * Nat.sqrt (aksParameter n) + 1)))

/-- **Correctness of AKS** (README 1.14). -/
theorem aks_correct (n : ℕ) : AKSAccepts n ↔ n.Prime := by
  sorry

/-- **Pocklington's criterion** (README 1.16): if `F ∣ n − 1`, `n < F²`, and every prime
`q ∣ F` has a witness `a` with `a^(n−1) ≡ 1` and `gcd(a^((n−1)/q) − 1, n) = 1`, then `n` is
prime. The witness may depend on `q` (a natural number; an integer witness reduces modulo `n`),
and `F` need not be coprime to `(n − 1)/F`. -/
theorem pocklington_prime (n F : ℕ) (hn : 1 < n) (hF1 : 1 < F) (hF : F ∣ n - 1) (hF2 : n < F ^ 2)
    (h : ∀ q, q.Prime → q ∣ F →
      ∃ a : ℕ, a ^ (n - 1) ≡ 1 [MOD n] ∧ Nat.Coprime (a ^ ((n - 1) / q) - 1) n) :
    n.Prime := by
  sorry

/-- **Hensel lifting modulo `p^k`** (README 1.26): a coprime monic factorization modulo `p` of a
monic `f ∈ ℤ[X]` lifts uniquely to a monic factorization modulo `p^k`. -/
theorem henselLift (p : ℕ) [Fact p.Prime] (k : ℕ) (hk : 1 ≤ k) (f : ℤ[X]) (hf : f.Monic)
    (g₀ h₀ : (ZMod p)[X]) (hg₀ : g₀.Monic) (hh₀ : h₀.Monic) (hcop : IsCoprime g₀ h₀)
    (hfac : f.map (Int.castRingHom (ZMod p)) = g₀ * h₀) :
    ∃! gh : (ZMod (p ^ k))[X] × (ZMod (p ^ k))[X],
      gh.1.Monic ∧ gh.2.Monic ∧
      gh.1.map (ZMod.castHom (dvd_pow_self p (by omega)) (ZMod p)) = g₀ ∧
      gh.2.map (ZMod.castHom (dvd_pow_self p (by omega)) (ZMod p)) = h₀ ∧
      f.map (Int.castRingHom (ZMod (p ^ k))) = gh.1 * gh.2 := by
  sorry

/-- Coprime monic residue factors lift uniquely over every complete DVR (README 1.26a). -/
theorem henselFactor_completeDVR (O : Type*) [CommRing O] [IsDomain O]
    [IsDiscreteValuationRing O] [IsAdicComplete (IsLocalRing.maximalIdeal O) O]
    (f : O[X]) (hf : f.Monic)
    (g₀ h₀ : (IsLocalRing.ResidueField O)[X]) (hg₀ : g₀.Monic) (hh₀ : h₀.Monic)
    (hcop : IsCoprime g₀ h₀) (hfac : f.map (IsLocalRing.residue O) = g₀ * h₀) :
    ∃! gh : O[X] × O[X], gh.1.Monic ∧ gh.2.Monic ∧ f = gh.1 * gh.2 ∧
      gh.1.map (IsLocalRing.residue O) = g₀ ∧ gh.2.map (IsLocalRing.residue O) = h₀ := by
  sorry

/-! ## Layer 2: order presentations and local arithmetic -/

/-- **Multiplier ring of a lattice** (README 2.2): `{x ∈ K | x·I ⊆ I}` for any `ℤ`-submodule `I`;
the zero lattice has the whole field as multiplier ring.  -/
def multiplierRing {L : Type*} [Field L] [CharZero L] (I : Submodule ℤ L) : Subalgebra ℤ L where
  carrier := {x | ∀ y ∈ I, x * y ∈ I}
  mul_mem' {a b} ha hb y hy := by rw [mul_assoc]; exact ha _ (hb y hy)
  add_mem' {a b} ha hb y hy := by rw [add_mul]; exact I.add_mem (ha y hy) (hb y hy)
  algebraMap_mem' r y hy := by
    rw [algebraMap_int_eq, eq_intCast, ← zsmul_eq_mul]
    exact I.smul_mem r hy

/-- **Local maximality of an order** (README 2.3): every integral element has a multiple prime to
`p` in `R`. -/
def IsPMaximal {K : Type*} [Field K] [CharZero K] (R : Subalgebra ℤ K) (p : ℕ) : Prop :=
  ∀ x : K, IsIntegral ℤ x → ∃ a : ℤ, ¬ (p : ℤ) ∣ a ∧ (a : K) * x ∈ R

/-- **The `p`-radical in field coordinates** (README 2.5): the radical of `pR` in `R`, viewed as
a lattice in `K`. For any natural `p` and any subalgebra `R`, it consists of the elements of `R`
with a positive power in `pR`. -/
def pRadicalLattice {K : Type*} [Field K] [NumberField K] (R : Subalgebra ℤ K) (p : ℕ) : Submodule ℤ K :=
  ((Ideal.span {(p : R)}).radical.restrictScalars ℤ).map (R.val.toLinearMap.restrictScalars ℤ)

/-- **Multiplier criterion for `p`-maximality** (README 2.6), for an order `R` (finitely generated,
spanning `K` over `ℚ`). -/
theorem pRadical_multiplier_eq_iff {K : Type*} [Field K] [NumberField K] (R : Subalgebra ℤ K)
    (hfg : (Subalgebra.toSubmodule R).FG) (hspan : Submodule.span ℚ (R : Set K) = ⊤)
    (p : ℕ) [Fact p.Prime] :
    multiplierRing (pRadicalLattice R p) = R ↔ IsPMaximal R p := by
  sorry

/-- **Exact `φ`-adic expansion** (README 2.16): the `i`-th coefficient of `f` in base `φ` is
`(f /ₘ φ^i) %ₘ φ`. -/
def phiExpansion {R : Type*} [CommRing R] (φ f : R[X]) (i : ℕ) : R[X] :=
  (f /ₘ φ ^ i) %ₘ φ

/-- **Gauss valuation of a coefficient** (README 2.17): `⊤` for the zero polynomial. -/
def coefficientValuation (p : ℕ) (a : ℤ[X]) : WithTop ℕ :=
  a.support.inf fun i => ((padicValInt p (a.coeff i) : ℕ) : WithTop ℕ)

/-- **A finite negative `φ`-Newton side** (README 2.18): from `(s, u)` to `(s + e·d, u − h·d)`,
slope `−h/e`, `gcd(e, h) = 1`, endpoints on the line and every point on or above it. The theorems
that use it assume `p` prime and `φ` monic of positive degree. -/
def IsPhiNewtonSide (p : ℕ) (φ f : ℤ[X]) (s u e h d : ℕ) : Prop :=
  0 < e ∧ 0 < h ∧ 0 < d ∧ Nat.Coprime e h ∧ h * d ≤ u ∧
    coefficientValuation p (phiExpansion φ f s) = u ∧
    coefficientValuation p (phiExpansion φ f (s + e * d)) = (u - h * d : ℕ) ∧
    ∀ i, ∀ v : ℕ, coefficientValuation p (phiExpansion φ f i) = v →
      e * u + h * s ≤ e * v + h * i ∧ (e * v + h * i = e * u + h * s → s ≤ i ∧ i ≤ s + e * d)

/-- Normalize each integer φ-coefficient by the side ordinate before reducing in the
residue quotient, then assemble the residual polynomial (README 2.19). -/
def phiResidualPolynomial (p : ℕ) (φ f : ℤ[X]) (s u e h d : ℕ) :
    Polynomial (AdjoinRoot (φ.map (Int.castRingHom (ZMod p)))) :=
  ∑ j ∈ Finset.range (d + 1), Polynomial.monomial j
    (AdjoinRoot.mk (φ.map (Int.castRingHom (ZMod p)))
      ((∑ i ∈ (phiExpansion φ f (s + e * j)).support, Polynomial.monomial i
        ((phiExpansion φ f (s + e * j)).coeff i / (p : ℤ) ^ (u - h * j))).map
          (Int.castRingHom (ZMod p))))

/-- A monic polynomial with one finite negative φ-side and irreducible residual polynomial
is irreducible over `ℚ_p` (README 2.20). -/
theorem ore_residual_irreducible (p : ℕ) [Fact p.Prime] (φ f : ℤ[X])
    (hφ : φ.Monic) (hm : 0 < φ.natDegree)
    (hirr : Irreducible (φ.map (Int.castRingHom (ZMod p)))) (hf : f.Monic)
    (e h d : ℕ) (hside : IsPhiNewtonSide p φ f 0 (h * d) e h d)
    (hred : f.map (Int.castRingHom (ZMod p)) =
      (φ.map (Int.castRingHom (ZMod p))) ^ (e * d))
    (hres : Irreducible (phiResidualPolynomial p φ f 0 (h * d) e h d)) :
    Irreducible (f.map (Int.castRingHom ℚ_[p])) := by
  sorry

open ValuativeRel IsNonarchimedeanLocalField in
/-- A unit in a characteristic-zero nonarchimedean local field is a square iff it is a
square modulo `4π`, for any uniformizer `π` (README 2.22). -/
theorem isSquare_iff_isSquare_mod (L : Type*) [Field L] [ValuativeRel L]
    [TopologicalSpace L] [IsNonarchimedeanLocalField L] [CharZero L]
    (π : 𝒪[L]) (hπ : Irreducible π) (u : (𝒪[L])ˣ) :
    IsSquare ((u : 𝒪[L]) : L) ↔
      ∃ w : 𝒪[L], (u : 𝒪[L]) - w ^ 2 ∈ Ideal.span {4 * π} := by
  sorry

/-- The degree-one primes above `p` count the roots in `ℚ_p`; a generating root identifies
`K` with `ℚ[X]/(f)` (README 2.23). -/
theorem card_padicRoots_eq (K : Type*) [Field K] [NumberField K]
    (f : ℚ[X]) (hf : f.Monic) (hirr : Irreducible f) (θ : K)
    (hθ : aeval θ f = 0) (hgen : Algebra.adjoin ℚ {θ} = ⊤)
    (p : ℕ) [Fact p.Prime] :
    Nat.card {x : ℚ_[p] // aeval x f = 0} =
      Nat.card {P : Ideal (NumberField.RingOfIntegers K) //
        P.IsPrime ∧ P ≠ ⊥ ∧ P ∣ Ideal.span {(p : NumberField.RingOfIntegers K)} ∧
          P.ramificationIdx ℤ = 1 ∧ P.inertiaDeg ℤ = 1} := by
  sorry

/-! ## Layer 3: exact modular and elliptic arithmetic data -/

open _root_.UpperHalfPlane _root_.ModularForm

/-- **Integral `q`-expansion lattice at level one** (README 3.1): the forms whose width-one
`q`-expansion coefficients are all integers (the set is already a lattice, so it is its own span).
It lives on the `q`-expansion side, distinct from the integral modular-symbol module. -/
def integralModularLattice (k : ℤ) : Submodule ℤ (ModularForm 𝒮ℒ k) :=
  Submodule.span ℤ {f | ∀ n, ∃ a : ℤ, (qExpansion 1 f).coeff n = a}

/-- **Integral cusp-form lattice** (README 3.2). -/
def integralCuspLattice (k : ℤ) : Submodule ℤ (CuspForm 𝒮ℒ k) :=
  Submodule.span ℤ {f | ∀ n, ∃ a : ℤ, (qExpansion 1 f).coeff n = a}

/-- **The Miller basis exists** (README 3.3): for even `k` there is a `ℤ`-basis of the integral
cusp lattice whose first `d` coefficients form the identity matrix. -/
theorem exists_millerBasis (k : ℕ) (hk : Even k) :
    ∃ b : Module.Basis (Fin (Module.finrank ℂ (CuspForm 𝒮ℒ (k : ℤ)))) ℤ (integralCuspLattice k),
      ∀ i j, (qExpansion 1 (b i : CuspForm 𝒮ℒ (k : ℤ))).coeff (j.val + 1) =
        if i = j then 1 else 0 := by
  sorry

/-- The full integral modular lattice has a basis detected by distinct coefficients at the
Sturm bound, including the constant coefficient (README 3.3a). -/
theorem exists_integralModularBasis (k : ℕ) :
    ∃ b : Module.Basis (Fin (Module.finrank ℂ (ModularForm 𝒮ℒ (k : ℤ)))) ℤ
        (integralModularLattice k),
      ∃ pivot : Fin (Module.finrank ℂ (ModularForm 𝒮ℒ (k : ℤ))) → ℕ,
        Function.Injective pivot ∧ (∀ i, pivot i ≤ k / 12) ∧
          ∀ i j, (qExpansion 1 (b j : ModularForm 𝒮ℒ (k : ℤ))).coeff (pivot i) =
            if i = j then 1 else 0 := by
  sorry

/-- **Level-one congruence Sturm bound** (README 3.4). -/
theorem levelOne_congruence_sturm (k : ℕ) (p : ℕ) (hp : p.Prime)
    (f : integralModularLattice (k : ℤ))
    (h : ∀ n ≤ k / 12, ∃ a : ℤ, (p : ℤ) ∣ a ∧ (qExpansion 1 (f : ModularForm 𝒮ℒ (k : ℤ))).coeff n = a) :
    ∀ n, ∃ a : ℤ, (p : ℤ) ∣ a ∧ (qExpansion 1 (f : ModularForm 𝒮ℒ (k : ℤ))).coeff n = a := by
  sorry

/-- The integer Hecke operators on the level-one Fourier lattice, specified by
their complete coefficient recurrence (README §§3.6–3.7). This bundles existing
linear maps; the recurrence fixes each prime operator uniquely. -/
structure IntegralHeckeAction (k : ℕ) where
  op : ℕ → Module.End ℤ (integralCuspLattice (k : ℤ))
  coeff : ∀ p : ℕ, p.Prime → ∀ (f : integralCuspLattice (k : ℤ)) (n : ℕ),
    (qExpansion 1 (op p f : CuspForm 𝒮ℒ (k : ℤ))).coeff n =
      (qExpansion 1 (f : CuspForm 𝒮ℒ (k : ℤ))).coeff (p * n) +
        (if p ∣ n then (p : ℂ) ^ (k - 1) *
          (qExpansion 1 (f : CuspForm 𝒮ℒ (k : ℤ))).coeff (n / p) else 0)

/-- Reduction of the integral cusp lattice followed by scalar extension to an
algebraic closure of the prime field, as a native tensor product (README §§3.13a–3.14).
The localized Fourier-lattice comparison and, for p > 3, the geometric reduction-image
comparison are targets in README §3.13a. -/
abbrev ResidualCuspSpace (p k : ℕ) [Fact p.Prime] :=
  TensorProduct ℤ (AlgebraicClosure (ZMod p)) (integralCuspLattice (k : ℤ))

/-- The Hecke action on the residual cusp space is the scalar extension of the
specified integer operator (README §§3.14–3.15). -/
def residualHecke {p k : ℕ} [Fact p.Prime] (T : IntegralHeckeAction k) (l : ℕ) :
    Module.End (AlgebraicClosure (ZMod p)) (ResidualCuspSpace p k) :=
  (T.op l).baseChange (AlgebraicClosure (ZMod p))

/-- A nonordinary level-one pair has a nonzero integral cusp form modulo p killed
by T_p modulo p. The coefficient recurrence expresses this kernel on native forms,
without choosing a basis or a residual eigenvector (README §3.11). -/
def NonordinaryLevelOnePair (k p : ℕ) : Prop :=
  p.Prime ∧ 2 ≤ k ∧ Even k ∧
    ∃ f : integralCuspLattice (k : ℤ),
      (∃ n, ¬ ∃ a : ℤ, (p : ℤ) ∣ a ∧ (qExpansion 1 (f : CuspForm 𝒮ℒ (k : ℤ))).coeff n = a) ∧
      ∀ n, ∃ a : ℤ, (p : ℤ) ∣ a ∧
        (qExpansion 1 (f : CuspForm 𝒮ℒ (k : ℤ))).coeff (p * n) +
          (if p ∣ n then (p : ℂ) ^ (k - 1) *
            (qExpansion 1 (f : CuspForm 𝒮ℒ (k : ℤ))).coeff (n / p) else 0) = a

/-- The complete nonordinary level-one pairs with 2 ≤ k < p < 200
(README §3.13; CG13 Appendix, N-marked entries and companion weights). -/
theorem nonordinary_pairs_lt_200 (p k : ℕ) (hp : p.Prime) (hp200 : p < 200)
    (hk : 2 ≤ k) (hkp : k < p) (heven : Even k) :
    NonordinaryLevelOnePair k p ↔ (p, k) ∈
      ([(59, 16), (59, 46), (79, 38), (79, 44), (107, 28), (107, 82),
        (131, 40), (131, 94), (139, 36), (139, 106), (151, 60), (151, 94),
        (173, 24), (173, 152), (193, 72), (193, 124)] : List (ℕ × ℕ)) := by
  sorry

/-- The normalized integral weight-26 form has a simultaneous companion at
weight 82 modulo 107, with eigenvalue l^81 a_l for every prime l ≠ 107
(README §3.14; BCG Theorem 2.4, proof). The normalization identifies the unique
weight-26 cusp form ΔE₄²E₆. -/
theorem weight82_companion_system [Fact (Nat.Prime 107)] (T : IntegralHeckeAction 82)
    (f : integralCuspLattice 26)
    (hf : (qExpansion 1 (f : CuspForm 𝒮ℒ 26)).coeff 1 = 1) :
    ∃ a : ℕ → ℤ, (∀ n, (qExpansion 1 (f : CuspForm 𝒮ℒ 26)).coeff n = a n) ∧
      ∃ v : ResidualCuspSpace 107 82, v ≠ 0 ∧
        ∀ l : ℕ, l.Prime → l ≠ 107 → residualHecke T l v =
          ((l : AlgebraicClosure (ZMod 107)) ^ 81 * (a l : AlgebraicClosure (ZMod 107))) • v := by
  sorry

/-- An ordinary companion pair consists of two nonzero simultaneous residual
Hecke eigenvectors at weights k and p+1−k; the first has nonzero p-eigenvalue,
and the other prime eigenvalues have twist p−k (README §3.15). -/
def OrdinaryCompanionPair (p k : ℕ) [Fact p.Prime] : Prop :=
  2 ≤ k ∧ k < p ∧ Even k ∧ Even (p + 1 - k) ∧
    ∃ T : IntegralHeckeAction k, ∃ U : IntegralHeckeAction (p + 1 - k),
      ∃ a b : ℕ → AlgebraicClosure (ZMod p),
        ∃ v : ResidualCuspSpace p k, ∃ w : ResidualCuspSpace p (p + 1 - k),
          v ≠ 0 ∧ w ≠ 0 ∧ a p ≠ 0 ∧
            (∀ l : ℕ, l.Prime → residualHecke T l v = a l • v) ∧
            (∀ l : ℕ, l.Prime → residualHecke U l w = b l • w) ∧
            ∀ l : ℕ, l.Prime → l ≠ p → b l = (l : AlgebraicClosure (ZMod p)) ^ (p - k) * a l

/-- The six ordinary companion pairs used in the level-one cohomology argument,
including the required coprimality (README §3.16; BCG Remark 3.3; CG13 Appendix). -/
theorem ordinary_companion_list (p k : ℕ) [Fact p.Prime]
    (hpair : (p, k) ∈ ([(107, 26), (139, 20), (173, 68), (179, 30), (191, 30), (193, 48)] :
      List (ℕ × ℕ))) : OrdinaryCompanionPair p k ∧ Nat.Coprime (k - 1) (p - 1) := by
  sorry

/-- **The subgroup generated by exact abscissae** (README 3.18): the classes of `x − T`, in
Tau Ceti's square-class group `W.M`, for a finite list of abscissae in the local field; a
presentation uses the images of rational abscissae. -/
def localImageSpan {K : Type*} [Field K] [DecidableEq K]
    (W : WeierstrassCurve.Affine K) [W.IsElliptic] [W.IsCharNeTwoNF] (xs : List K) : Subgroup W.M :=
  Subgroup.closure ((fun x => W.μX x) '' {x | x ∈ xs})

/-- **The size check completes a local image at a prime** (README 3.19). -/
theorem localImageSpan_eq_range_of_card_padic (p : ℕ) [Fact p.Prime] [DecidableEq ℚ_[p]]
    (W : WeierstrassCurve.Affine ℚ_[p]) [W.IsElliptic] [W.IsCharNeTwoNF] (xs : List ℚ_[p])
    (hxs : ∀ x ∈ xs, W.f.eval x ≠ 0 ∧ IsSquare (W.f.eval x))
    (hcard : Nat.card (localImageSpan W xs) =
      (1 + Nat.card {x : ℚ_[p] // W.f.eval x = 0}) * (if p = 2 then 2 else 1)) :
    localImageSpan W xs = (WeierstrassCurve.Affine.μ (W := W)).range := by
  sorry

/-- **The size check at the real place** (README 3.19). -/
theorem localImageSpan_eq_range_of_card_real [DecidableEq ℝ] (W : WeierstrassCurve.Affine ℝ)
    [W.IsElliptic] [W.IsCharNeTwoNF] (xs : List ℝ)
    (hxs : ∀ x ∈ xs, 0 < W.f.eval x)
    (hcard : 2 * Nat.card (localImageSpan W xs) = 1 + Nat.card {x : ℝ // W.f.eval x = 0}) :
    localImageSpan W xs = (WeierstrassCurve.Affine.μ (W := W)).range := by
  sorry

/-- Every rational elliptic curve in characteristic-not-two normal form has a complete
finite local descent image at p generated by rational abscissae (README §3.20). -/
theorem exists_complete_localImage_padic (p : ℕ) [Fact p.Prime] [DecidableEq ℚ_[p]]
    (W : WeierstrassCurve.Affine ℚ) [W.IsElliptic] [W.IsCharNeTwoNF]
    : letI : (W.map (algebraMap ℚ ℚ_[p])).IsCharNeTwoNF := ⟨by simp, by simp⟩
      ∃ xs : List ℚ,
      (∀ x ∈ xs, (W.map (algebraMap ℚ ℚ_[p])).f.eval (x : ℚ_[p]) ≠ 0 ∧
        IsSquare ((W.map (algebraMap ℚ ℚ_[p])).f.eval (x : ℚ_[p]))) ∧
      localImageSpan (W.map (algebraMap ℚ ℚ_[p])) (xs.map (fun x => (x : ℚ_[p]))) =
        (WeierstrassCurve.Affine.μ (W := W.map (algebraMap ℚ ℚ_[p]))).range := by
  sorry

/-- Rational abscissae also generate the complete real local descent image
of a rational elliptic curve (README §3.20). -/
theorem exists_complete_localImage_real [DecidableEq ℝ]
    (W : WeierstrassCurve.Affine ℚ) [W.IsElliptic] [W.IsCharNeTwoNF]
    : letI : (W.map (algebraMap ℚ ℝ)).IsCharNeTwoNF := ⟨by simp, by simp⟩
      ∃ xs : List ℚ,
      (∀ x ∈ xs, 0 < (W.map (algebraMap ℚ ℝ)).f.eval (x : ℝ)) ∧
      localImageSpan (W.map (algebraMap ℚ ℝ)) (xs.map (fun x => (x : ℝ))) =
        (WeierstrassCurve.Affine.μ (W := W.map (algebraMap ℚ ℝ))).range := by
  sorry

/-- At every good odd prime, the local descent image is exactly the unramified
square classes of square norm (README §3.21). -/
theorem localImage_of_good_odd (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) [DecidableEq ℚ_[p]]
    (W : WeierstrassCurve.Affine ℚ_[p]) [W.IsElliptic] [W.IsCharNeTwoNF]
    (hgood : W.badPrimes ℤ_[p] = ∅) :
    (WeierstrassCurve.Affine.μ (W := W)).range = W.selmerGroupA ℤ_[p] ⊓ W.normM.ker := by
  sorry

/-- **`p`-saturated subgroups** (README 3.22). -/
def IsPSaturated {A : Type*} [AddCommGroup A] (G : AddSubgroup A) (p : ℕ) : Prop :=
  ∀ a : A, p • a ∈ G → a ∈ G

/-- Finitely many divisibility tests characterize p-saturation of a subgroup of
rational elliptic points, together with independence modulo pG. The listed points
need only generate G/pG; ambient p-torsion must lie in G (README §§3.23, 3.26). -/
theorem pSaturationCriterion_iff (W : WeierstrassCurve ℚ) [W.IsElliptic]
    (G : AddSubgroup W.toAffine.Point) (p : ℕ) (hp : p.Prime) [NeZero p]
    {m : ℕ} (g : Fin m → W.toAffine.Point) (hg : ∀ i, g i ∈ G)
    (hgen : ∀ x ∈ G, ∃ b : Fin m → ℤ, ∃ y ∈ G, x = ∑ i, b i • g i + p • y) :
    ((∀ b : Fin m → Fin p,
        (∃ Q : W.toAffine.Point, ∑ i, (b i).val • g i = p • Q) → ∀ i, b i = 0) ∧
      ∀ Q : W.toAffine.Point, p • Q = 0 → Q ∈ G) ↔
    (IsPSaturated G p ∧
      ∀ b : Fin m → ℤ, (∃ Q ∈ G, ∑ i, b i • g i = p • Q) →
        ∀ i, (p : ℤ) ∣ b i) := by
  sorry

/-! ## Layer 4: quantitative analytic bounds and finite Gram data -/

/-- **Rational complex boxes** (README 4.7). -/
def complexBoxSet (R I : NonemptyInterval ℚ) : Set ℂ :=
  {z | ((R.fst : ℝ) ≤ z.re ∧ z.re ≤ R.snd) ∧ ((I.fst : ℝ) ≤ z.im ∧ z.im ≤ I.snd)}

/-- A right-half-plane digamma truncation has an explicit vanishing tail (README 4.17a). -/
theorem digamma_series_remainder (z : ℂ) (hz : 0 < z.re) (N : ℕ) (hN : 1 ≤ N) :
    ‖Complex.digamma z - (-(Real.eulerMascheroniConstant : ℂ) +
      ∑ n ∈ Finset.range N, ((n + 1 : ℂ)⁻¹ - (n + z)⁻¹))‖ ≤
      ‖z - 1‖ / ((N : ℝ) - 1 + min 1 z.re) := by
  sorry

/-- The derivative of digamma has the corresponding reciprocal-square tail (README 4.17a). -/
theorem trigamma_series_remainder (z : ℂ) (hz : 0 < z.re) (N : ℕ) (hN : 1 ≤ N) :
    ‖deriv Complex.digamma z - ∑ n ∈ Finset.range N, (n + z)⁻¹ ^ 2‖ ≤
      1 / ((N : ℝ) - 1 + min 1 z.re) := by
  sorry

/-- **Complete isolation of the roots of a rational polynomial** (README 4.19). -/
theorem exists_disjoint_root_presentations (f : ℚ[X]) (hf : f ≠ 0) :
    ∃ l : List IsolatedAlgebraicRoot, (∀ c ∈ l, c.poly = f) ∧ (l.map (·.value)).Nodup ∧
      l.Pairwise (fun c d => Disjoint (complexBoxSet c.re c.im) (complexBoxSet d.re d.im)) ∧
      ∀ z : ℂ, aeval z f = 0 ↔ z ∈ l.map (·.value) := by
  sorry

/-- The finite even-order Euler–Maclaurin approximation to Hurwitz zeta.
At s = 1 only the polar term is removed, giving the value needed in a nonprincipal
character sum (README §4.19a; DLMF 25.11.7). All uses have t > 0 and N,m ≥ 1. -/
def hurwitzEMPartial (s : ℂ) (t : ℝ) (N m : ℕ) : ℂ :=
  (∑ n ∈ Finset.range N, ((n : ℂ) + t) ^ (-s)) +
    (if s = 1 then -(Real.log (N + t) : ℂ)
      else ((N : ℂ) + t) ^ (1 - s) / (s - 1)) +
    ((N : ℂ) + t) ^ (-s) / 2 +
    ∑ r ∈ Finset.range m,
      (bernoulli (2 * (r + 1)) : ℂ) / (Nat.factorial (2 * (r + 1)) : ℂ) *
        (ascPochhammer ℂ (2 * (r + 1) - 1)).eval s *
          ((N : ℂ) + t) ^ (1 - s - 2 * (r + 1))

/-- The finite character sum of Hurwitz Euler–Maclaurin approximations, including
the q to the minus s normalization (README §4.19a). -/
def dirichletEMPartial {q : ℕ} (χ : DirichletCharacter ℂ q) (s : ℂ) (N m : ℕ) : ℂ :=
  (q : ℂ) ^ (-s) * ∑ a ∈ Finset.range q,
    χ (a + 1) * hurwitzEMPartial s ((a + 1 : ℝ) / q) N m

/-- A bound for the absolute value of the periodic even Bernoulli polynomial,
obtained by bounding each monomial on [0,1] (README §4.19a). -/
def bernoulliBound (m : ℕ) : ℝ :=
  ∑ j ∈ Finset.range (2 * m + 1), (Nat.choose (2 * m) j : ℝ) * |(bernoulli j : ℝ)|

/-- The uniform continued Dirichlet error bound, including the removable value at
one for a nonprincipal character (README §4.19a; DLMF 25.11.4 and 25.11.7).
The denominator and all real bases are strictly positive under these hypotheses. -/
theorem dirichlet_eulerMaclaurin_remainder {q : ℕ} [NeZero q]
    (χ : DirichletCharacter ℂ q) (s : ℂ) (hpole : χ = 1 → s ≠ 1)
    (N m : ℕ) (hN : 1 ≤ N) (hm : 1 ≤ m)
    (σ₀ B : ℝ) (hσ : σ₀ ≤ s.re) (hB : ‖s‖ ≤ B) (horder : 1 < σ₀ + 2 * m) :
    ‖χ.LFunction s - dirichletEMPartial χ s N m‖ ≤
      (q : ℝ) ^ (1 - σ₀) * bernoulliBound m *
        (∏ j ∈ Finset.range (2 * m), (B + j)) / (Nat.factorial (2 * m) : ℝ) *
          (N : ℝ) ^ (1 - σ₀ - 2 * m) / (σ₀ + 2 * m - 1) := by
  sorry

/-- The first N terms of the split Mellin expansion of a level-one cusp-form
L-function, with its Fricke factor i to the k (README §4.20a). -/
def cuspMellinPartial (k : ℕ) (f : CuspForm 𝒮ℒ (k : ℤ)) (s : ℂ) (N : ℕ) : ℂ :=
  (2 * Real.pi : ℂ) ^ s / Complex.Gamma s *
    ∑ n ∈ Finset.range N, (qExpansion 1 f).coeff (n + 1) *
      ∫ t : ℝ in Set.Ici 1, Complex.exp (-2 * Real.pi * (n + 1 : ℂ) * t) *
        ((t : ℂ) ^ (s - 1) + Complex.I ^ k * (t : ℂ) ^ ((k : ℂ) - s - 1))

/-- The two Mellin tails have an explicit uniform geometric bound on every
specified argument strip with bounded reciprocal-Gamma prefactor (README §4.20a).
The reciprocal-Gamma convention also covers nonpositive integers. -/
theorem cusp_mellin_tail (k : ℕ) (hk : (0 : ℤ) < k)
    (f : CuspForm 𝒮ℒ (k : ℤ)) (C : ℚ) (hC : 0 < C)
    (hcoeff : ∀ n : ℕ, 1 ≤ n → ‖(qExpansion 1 f).coeff n‖ ≤
      (C : ℝ) * (n : ℝ) ^ ((k : ℝ) / 2))
    (s : ℂ) (σ₀ σ₁ H : ℝ) (hσ₀ : σ₀ ≤ s.re) (hσ₁ : s.re ≤ σ₁)
    (hH : ‖(2 * Real.pi : ℂ) ^ s / Complex.Gamma s‖ ≤ H)
    (N : ℕ) (hcut : max 0 (max (σ₁ - 1) ((k : ℝ) - σ₀ - 1)) < 2 * Real.pi * (N + 1))
    (hratio : (k : ℝ) / 2 / (N + 1) < 2 * Real.pi) :
    ‖ModularForm.L hk f s - cuspMellinPartial k f s N‖ ≤
      2 * (C : ℝ) * H * (N + 1 : ℝ) ^ ((k : ℝ) / 2) *
        Real.exp (-2 * Real.pi * (N + 1)) /
          ((2 * Real.pi * (N + 1) - max 0 (max (σ₁ - 1) ((k : ℝ) - σ₀ - 1))) *
            (1 - Real.exp ((k : ℝ) / 2 / (N + 1) - 2 * Real.pi))) := by
  sorry

/-- **Platt's bounded-height theorem** (README 4.22): for primitive characters of modulus
`q ≤ 400000`, zeros in the strip up to height `H(q)` lie on the critical line; the parity in `H(q)`
is that of the modulus. -/
theorem platt_bounded_height {q : ℕ} [NeZero q] (hq : q ≤ 400000) (χ : DirichletCharacter ℂ q)
    (hχ : χ.IsPrimitive) (s : ℂ) (hs : 0 < s.re ∧ s.re < 1)
    (ht : |s.im| ≤ if Even q then max (10 ^ 8 / (q : ℝ)) (7.5 * 10 ^ 7 / (q : ℝ) + 200)
      else max (10 ^ 8 / (q : ℝ)) (3.75 * 10 ^ 7 / (q : ℝ) + 200))
    (h0 : χ.LFunction s = 0) : s.re = 1 / 2 := by
  sorry

/-- **Platt's central nonvanishing** (README 4.23). -/
theorem platt_central_nonvanishing {q : ℕ} [NeZero q] (hq : q ≤ 2000000)
    (χ : DirichletCharacter ℂ q) (hχ : χ.IsPrimitive) : χ.LFunction (1 / 2) ≠ 0 := by
  sorry

end TauCetiRoadmap.ComputationalNumberTheory
