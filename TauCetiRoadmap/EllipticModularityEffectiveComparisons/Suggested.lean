module

public import Mathlib
public import TauCeti.NumberTheory.ModularForms.Newforms.Basic
public import TauCeti.NumberTheory.ModularForms.Newforms.Newform
public import TauCeti.NumberTheory.ModularForms.DiamondOperators
public import TauCeti.AlgebraicGeometry.EllipticCurve.Affine.Point.Galois
public import TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.Kernel
public import TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.BaseChange.Basic
public import TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.Hom.Add

/-!
# Elliptic modularity and effective residual comparisons: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti APIs: Martin’s dimension
formula and sharp bound, Kraus’s finite-prime coefficient recognition, the
integral ideal Sturm theorem, Kraus’s prime-power coefficient congruence, the
four-divisible two-isogeny realization, the prime and composite cyclic-isogeny
degree classifications, the two uniform irreducibility bounds, split-normalizer
exclusion, nonsplit containment of proper images, integrality of j under a
genus-zero isogeny and nonsplit image, and Lemos’s surjectivity theorem.

The removed-prime exponent bound and Kraus's rational and full-two-torsion
realization theorems are not statable at the pins: the arithmetic elliptic
conductor, full residual Artin conductor and Serre weight interfaces are missing.
The split-Cartan rational-point theorem lacks its modular curve and cusp/CM
loci; the elliptic image exclusion is stated separately on native torsion.
The four exceptional-prime rational-point exhaustions likewise lack the
congruence modular curves and their Picard Jacobians at the pins.
The mixed winding quotient, its nonvanishing and cusp formal immersion
lack mixed modular Jacobians, integral Hecke quotients and their integral models.
The general quantitative elliptic-isogeny bound lacks the stable Faltings-height
interface. These headlines remain README targets without replacement predicates or admitted data.
-/

@[expose] public section

noncomputable section
open scoped BigOperators WeierstrassCurve NumberField
open Classical

namespace TauCetiRoadmap.EllipticModularityEffectiveComparisons

/-! ## Layer 0: sharp weight-two newspace dimensions -/

/-- Martin's rational local factors (s, v∞, v₂, v₃, Möbius), with identity
at exponent zero and zero at nonprime bases of positive exponent. -/
def localTerms (p e : ℕ) : Fin 5 → ℚ :=
  if e = 0 then 1 else if ¬ p.Prime then 0 else
    ![
      (if e = 1 then 1 - 1 / (p : ℚ) else if e = 2 then
        1 - 1 / (p : ℚ) - 1 / (p : ℚ)^2 else
        (1 - 1 / (p : ℚ)) * (1 - 1 / (p : ℚ)^2)),
      (if e % 2 = 1 then 0 else if e = 2 then (p : ℚ) - 2 else
        (p : ℚ)^(e / 2 - 2) * ((p : ℚ) - 1)^2),
      (if p = 2 then (if e = 1 ∨ e = 2 then -1 else if e = 3 then 1 else 0)
        else if p % 4 = 1 then (if e = 2 then -1 else 0)
        else (if e = 1 then -2 else if e = 2 then 1 else 0)),
      (if p = 3 then (if e = 1 ∨ e = 2 then -1 else if e = 3 then 1 else 0)
        else if p % 3 = 1 then (if e = 2 then -1 else 0)
        else (if e = 1 then -2 else if e = 2 then 1 else 0)),
      (if e = 1 then -1 else 0)]

/-- The five-product arithmetic expression for the weight-two newspace dimension;
zero at level zero is only a total-function convention (Martin, Theorem 1). -/
def martinValue (N : ℕ) : ℚ :=
  if N = 0 then 0 else
    let T : Fin 5 → ℚ := fun j => ∏ p ∈ N.primeFactors, localTerms p (N.factorization p) j
    (N : ℚ) * T 0 / 12 - T 1 / 2 - T 2 / 4 - T 3 / 3 + T 4

/-- The dimension of the native weight-two newspace with trivial nebentypus. -/
abbrev newDimension (N : ℕ) [NeZero N] : ℕ :=
  Module.finrank ℂ ↥(TauCeti.cuspFormsNew N 2 ⊓
    cuspFormCharSpace 2 (1 : (ZMod N)ˣ →* ℂˣ))

/-- Martin's arithmetic expression equals the actual trivial-character newspace
dimension (Theorem 1 at weight two). -/
theorem martin_dimension_formula (N : ℕ) [NeZero N] :
    martinValue N = (newDimension N : ℚ) := by sorry

/-- Martin's sharp bound, including its complete equality characterization
(Theorem 2, preprint p. 3). -/
theorem martin_sharp_bound (N : ℕ) [NeZero N] :
    12 * newDimension N ≤ N + 1 ∧
      (12 * newDimension N = N + 1 ↔ N = 35 ∨ (N.Prime ∧ N % 12 = 11)) := by sorry

/-! ## Layer 3: coefficient recognition and exact-conductor realization -/

/-- Kraus's finite-prime recognition: a normalized weight-two trivial-character
newform whose prime coefficients up to `I(N)/6` are integers has every Fourier
coefficient in `ℤ` (Kraus 1997, §3.2, Lemme 1). -/
theorem newform_integral_of_small_primes (N : ℕ) [NeZero N]
    (f : HeckeRing.GL2.Newform N 2) (hχ : f.χ = 1)
    (h : ∀ q : ℕ, q.Prime → 6 * q ≤ (CongruenceSubgroup.Gamma0 N).index →
      ∃ z : ℤ, (UpperHalfPlane.qExpansion 1 f.toCuspForm).coeff q = z)
    (n : ℕ) : ∃ z : ℤ, (UpperHalfPlane.qExpansion 1 f.toCuspForm).coeff n = z := by
  sorry

/-- The integral ideal Sturm theorem: for a weight-`k` form of character `χ` on
`Γ₁(N)` whose q-expansion is the `σ`-image of a sequence in `𝓞 K`, membership of
the coefficients in an ideal `J` for all `n` with `12 n ≤ k I(N)` forces membership
for every `n` (Kraus 1997, Appendix II, Proposition 1). -/
theorem integral_ideal_sturm (N : ℕ) [NeZero N] (k : ℕ) (χ : (ZMod N)ˣ →* ℂˣ)
    (K : Type*) [Field K] [NumberField K] (σ : K →+* ℂ)
    (f : modFormCharSpace (N := N) (k : ℤ) χ) (a : ℕ → 𝓞 K)
    (ha : ∀ n, σ (a n) = (UpperHalfPlane.qExpansion 1 f.1).coeff n)
    (J : Ideal (𝓞 K))
    (hJ : ∀ n, 12 * n ≤ k * (CongruenceSubgroup.Gamma0 N).index → a n ∈ J)
    (n : ℕ) : a n ∈ J := by
  sorry

/-- Kraus's prime-power congruence: for a normalized weight-two trivial-character
newform with coefficients realized in `𝓞 K`, a prime ideal `P` and `m ≥ 1`, the
congruences `a_q ≡ q + 1` at good primes and `(q + 1)(a_q - 1) ∈ P^m` at primes
`q ∣ 2N` with `q² ∤ 4N`, all for `6 q ≤ I(lcm N 4)`, give `a_q ≡ q + 1 mod P^m`
at every prime `q ∤ 2N` (Kraus 1997, Appendix II, Proposition 2). -/
theorem kraus_prime_power_congruence (N : ℕ) [NeZero N]
    (f : HeckeRing.GL2.Newform N 2) (hχ : f.χ = 1)
    (K : Type*) [Field K] [NumberField K] (σ : K →+* ℂ) (a : ℕ → 𝓞 K)
    (ha : ∀ n, σ (a n) = (UpperHalfPlane.qExpansion 1 f.toCuspForm).coeff n)
    (P : Ideal (𝓞 K)) [P.IsPrime] (m : ℕ) (hm : 1 ≤ m)
    (hgood : ∀ q : ℕ, q.Prime → 6 * q ≤ (CongruenceSubgroup.Gamma0 (Nat.lcm N 4)).index →
      ¬ q ∣ 2 * N → a q - ((q : 𝓞 K) + 1) ∈ P ^ m)
    (hbad : ∀ q : ℕ, q.Prime → 6 * q ≤ (CongruenceSubgroup.Gamma0 (Nat.lcm N 4)).index →
      q ∣ 2 * N → ¬ q ^ 2 ∣ 4 * N → ((q : 𝓞 K) + 1) * (a q - 1) ∈ P ^ m)
    (q : ℕ) (hq : q.Prime) (hq2N : ¬ q ∣ 2 * N) :
    a q - ((q : 𝓞 K) + 1) ∈ P ^ m := by
  sorry

/-- An integral Weierstrass model with elliptic rationalization whose point counts
modulo every odd prime not dividing its discriminant are divisible by four is
`ℚ`-isogenous, by an isogeny of degree one or two, to a curve with full rational
two-torsion (Kraus 1997, §3.3). -/
theorem four_divisible_isogeny_realization (W : WeierstrassCurve ℤ)
    [(W.baseChange ℚ).IsElliptic]
    (h4 : ∀ q : ℕ, q.Prime → q ≠ 2 → ¬ (q : ℤ) ∣ W.Δ →
      4 ∣ Nat.card (W.map (Int.castRingHom (ZMod q))).toAffine.Point) :
    ∃ F : WeierstrassCurve ℚ, ∃ (_ : F.IsElliptic),
      ∃ f : TauCeti.Isogeny (W.baseChange ℚ).toAffine F.toAffine,
        (f.degree = 1 ∨ f.degree = 2) ∧
          Nat.card (AddSubgroup.torsionBy F.toAffine.Point (2 : ℤ)) = 4 := by
  sorry

/-! ## Layer 4: rational cyclic isogenies and uniform irreducibility -/

/-- Geometric n-torsion of an elliptic Weierstrass curve over the fixed
algebraic closure of the rationals. -/
abbrev GeometricTorsion (E : WeierstrassCurve ℚ) [E.IsElliptic] (n : ℕ) :=
  AddSubgroup.torsionBy (E.baseChange (AlgebraicClosure ℚ)).toAffine.Point (n : ℤ)

/-- A rational isogeny of degree n with cyclic geometric kernel;
the kernel is taken after base change to the algebraic closure. -/
def CyclicIsogenyDegree (E : WeierstrassCurve ℚ) [E.IsElliptic] (n : ℕ) : Prop :=
  ∃ F : WeierstrassCurve ℚ, ∃ (_ : F.IsElliptic),
    ∃ f : TauCeti.Isogeny E.toAffine F.toAffine,
      f.degree = n ∧ IsAddCyclic ((f.map (algebraMap ℚ (AlgebraicClosure ℚ))).ker)

/-- The native ZMod n module on geometric n-torsion. -/
instance torsionModule (E : WeierstrassCurve ℚ) [E.IsElliptic] (n : ℕ) :
    Module (ZMod n) (GeometricTorsion E n) := AddSubgroup.torsionBy.zmodModule

/-- The coordinate Galois action on geometric torsion as a linear representation;
its operators are the native additive operators made ZMod-linear. -/
def torsionRepresentation (E : WeierstrassCurve ℚ) [E.IsElliptic] (n : ℕ) :
    Representation (ZMod n) ((AlgebraicClosure ℚ) ≃ₐ[ℚ] (AlgebraicClosure ℚ))
      (GeometricTorsion E n) where
  toFun σ := (Multiplicative.toAdd
    (E.torsionGaloisAction (K := AlgebraicClosure ℚ) (n : ℤ) σ)).toAddMonoidHom.toZModLinearMap n
  map_one' := by
    apply LinearMap.ext
    intro P
    exact congrArg (fun f : Multiplicative (AddAut (GeometricTorsion E n)) => Multiplicative.toAdd f P)
      (map_one (E.torsionGaloisAction (K := AlgebraicClosure ℚ) (n : ℤ)))
  map_mul' σ τ := by
    apply LinearMap.ext
    intro P
    exact congrArg (fun f : Multiplicative (AddAut (GeometricTorsion E n)) => Multiplicative.toAdd f P)
      (map_mul (E.torsionGaloisAction (K := AlgebraicClosure ℚ) (n : ℤ)) σ τ)

/-- Mazur's prime-degree classification, including CM possibilities. -/
theorem prime_cyclic_isogeny_degrees (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (r : ℕ) (hr : r.Prime) (h : CyclicIsogenyDegree E r) :
    r ∈ ({2, 3, 5, 7, 11, 13, 17, 19, 37, 43, 67, 163} : Finset ℕ) := by
  sorry

/-- The complete Mazur–Kenku rational cyclic-degree list includes the identity. -/
theorem rational_cyclic_isogeny_degrees (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (n : ℕ) (h : CyclicIsogenyDegree E n) :
    (1 ≤ n ∧ n ≤ 19) ∨ n ∈ ({21, 25, 27, 37, 43, 67, 163} : Finset ℕ) := by
  sorry

/-- A rational point of exact order two forces irreducibility at all primes ell ≥ 11. -/
theorem rational_two_uniform_irreducibility (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (ell : ℕ) [Fact ell.Prime] (hbound : 11 ≤ ell)
    (hE : ∃ P : E.toAffine.Point, P ≠ 0 ∧ (2 : ℤ) • P = 0) :
    (torsionRepresentation E ell).IsIrreducible := by
  sorry

/-- Full rational two-torsion forces irreducibility at every prime ell ≥ 5. -/
theorem full_two_uniform_irreducibility (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (ell : ℕ) [Fact ell.Prime] (hbound : 5 ≤ ell)
    (hE : Nat.card (AddSubgroup.torsionBy E.toAffine.Point (2 : ℤ)) = 4) :
    (torsionRepresentation E ell).IsIrreducible := by
  sorry

/-! ## Layer 5: rational cyclic-isogeny surjectivity -/

/-- Every geometric endomorphism is an integer multiple of the identity;
this tests complex multiplication over the algebraic closure. -/
def GeometricallyNonCM (E : WeierstrassCurve ℚ) [E.IsElliptic] : Prop :=
  ∀ f : TauCeti.Isogeny.Hom (E.baseChange (AlgebraicClosure ℚ)).toAffine
      (E.baseChange (AlgebraicClosure ℚ)).toAffine,
    ∃ n : ℤ, f = n • (1 : TauCeti.Isogeny.Hom
      (E.baseChange (AlgebraicClosure ℚ)).toAffine (E.baseChange (AlgebraicClosure ℚ)).toAffine)

/-- A split-normalizer image preserves an unordered pair of distinct order-p
subgroups of the actual geometric p-torsion. Its split-Cartan-normalizer
interpretation is used only at odd primes; at `p = 2` it is strictly stronger. -/
def SplitNormalizerImage (E : WeierstrassCurve ℚ) [E.IsElliptic] (p : ℕ) : Prop :=
  ∃ V W : AddSubgroup (GeometricTorsion E p), V ≠ W ∧ Nat.card V = p ∧ Nat.card W = p ∧
    ∀ σ : (AlgebraicClosure ℚ) ≃ₐ[ℚ] (AlgebraicClosure ℚ),
      let a := (Multiplicative.toAdd
        (E.torsionGaloisAction (K := AlgebraicClosure ℚ) (p : ℤ) σ)).toAddMonoidHom
      (V.map a = V ∧ W.map a = W) ∨ (V.map a = W ∧ W.map a = V)

/-- A nonsplit-normalizer image: the actual Galois operators on geometric
p-torsion normalize a cyclic group of additive automorphisms of order `p² - 1`,
which at a prime `p` is a nonsplit Cartan subgroup. Used only at prime p. -/
def NonsplitNormalizerImage (E : WeierstrassCurve ℚ) [E.IsElliptic] (p : ℕ) : Prop :=
  ∃ C : Subgroup (Multiplicative (AddAut (GeometricTorsion E p))),
    IsCyclic C ∧ Nat.card C = p ^ 2 - 1 ∧
      (E.torsionGaloisAction (K := AlgebraicClosure ℚ) (p : ℤ)).range ≤
        Subgroup.normalizer (C : Set (Multiplicative (AddAut (GeometricTorsion E p))))

/-- Bilu–Parent–Rebolledo excludes split-normalizer images for a non-CM rational
elliptic curve at every prime p>11 except 13. -/
theorem split_normalizer_exclusion (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (hCM : GeometricallyNonCM E) (p : ℕ) (hp : p.Prime) (hbound : 11 < p)
    (h13 : p ≠ 13) : ¬ SplitNormalizerImage E p := by
  sorry

/-- For a geometrically non-CM rational elliptic curve and a prime `p > 37`, a
nonsurjective torsion image lies in a nonsplit Cartan normalizer (Lemos 2017,
Theorem 2.3, from Mazur, Serre and Bilu–Parent–Rebolledo). -/
theorem proper_image_nonsplit (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (hCM : GeometricallyNonCM E) (p : ℕ) (hp : p.Prime) (hbound : 37 < p)
    (hprop : ¬ Function.Surjective
      (E.torsionGaloisAction (K := AlgebraicClosure ℚ) (p : ℤ))) :
    NonsplitNormalizerImage E p := by
  sorry

/-- A rational cyclic isogeny of degree `r ∈ {2, 3, 5, 7, 13}` together with a
nonsplit-normalizer image at a prime `p` outside that set forces an integral
`j`-invariant, with no non-CM hypothesis (Lemos 2017, Proposition 2.1). -/
theorem cyclic_isogeny_integral_j (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (r : ℕ) (hr : r ∈ ({2, 3, 5, 7, 13} : Finset ℕ)) (hiso : CyclicIsogenyDegree E r)
    (p : ℕ) (hp : p.Prime) (hpr : p ∉ ({2, 3, 5, 7, 13} : Finset ℕ))
    (hns : NonsplitNormalizerImage E p) : ∃ z : ℤ, E.j = z := by
  sorry

/-- Lemos's rational cyclic-isogeny uniformity theorem: every prime above 37
has full torsion automorphism image for each geometrically non-CM curve
with a rational cyclic isogeny of degree greater than one. -/
theorem lemos_uniform_surjectivity (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (hCM : GeometricallyNonCM E) (n : ℕ) (hn : 1 < n) (hiso : CyclicIsogenyDegree E n)
    (p : ℕ) (hp : p.Prime) (hbound : 37 < p) :
    Function.Surjective (E.torsionGaloisAction (K := AlgebraicClosure ℚ) (p : ℤ)) := by
  sorry

end TauCetiRoadmap.EllipticModularityEffectiveComparisons
