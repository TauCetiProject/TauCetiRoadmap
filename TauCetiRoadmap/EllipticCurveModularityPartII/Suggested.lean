import Mathlib
import TauCeti.NumberTheory.ModularForms.Newforms.Basic
import TauCeti.NumberTheory.ModularForms.DiamondOperators
import TauCeti.NumberTheory.ModularForms.Newforms.Newform
import TauCeti.AlgebraicGeometry.EllipticCurve.Affine.Point.Galois
import TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.Kernel
import TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.BaseChange.Basic
import TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.Hom.Add
import TauCeti.RepresentationTheory.BaseChange
import TauCeti.AlgebraicGeometry.EllipticCurve.TateAlgorithm.Reduction.Conductor

/-!
# EllipticCurveModularityPartII: target signatures

The roadmap is README.md; this file is not the roadmap. It states its headline
theorems against the pinned Mathlib and Tau Ceti APIs.

Headlines: Martin's dimension formula and sharp equality criterion; the integral
norm bound and the removed-prime exponent bound; sharp Kraus rational and
full-two-torsion realization at the deletion level; uniform
irreducibility and absolute irreducibility with rational two-torsion; the prime,
non-CM prime and composite rational cyclic-isogeny degree classifications; the rational
j-tables at levels 11, 17 and 37; finite-prime
coefficient rationality; integral ideal-congruence Sturm; Cartan integrality,
the proper-image classification and Lemos's rational-isogeny surjectivity theorem;
unconditional modular abelian rank zero and the weight-two modular class
cup/Chern sign and Tate-module duality comparisons;
the quantitative elliptic isogeny-degree bound.

The removed-prime exponent bound reads the conductor as the norm of Tau Ceti's
`WeierstrassCurve.algorithmicConductor`, the conductor by Ogg's formula, and the minimal
discriminant as the norm of `WeierstrassCurve.minimalDiscriminantIdeal`; the realization
theorems at the deletion level read the conductor of the realized curve the same way. Kraus's
rational and full-two-torsion realization theorems in their form at the prime-to-ell Artin
conductor of the residual representation, with Serre weight two, are not statable at the pins:
that conductor and the Serre weight are missing. The Cartan
correspondence, winding quotient and formal immersion headlines
lack the modular curves with their moduli/j maps, modular Jacobians with integral
Hecke quotients, and their canonical integral models. They remain README targets;
no replacement predicates or admitted constructions are used here. The Bilu–Parent–Rebolledo
rational-point theorem and the normalized modular coordinates are not statable: the
corresponding modular curves with their moduli and j maps are missing. The rational j-tables
at levels 11, 17 and 37 are stated in moduli form, on elliptic curves over ℚ with a rational
cyclic isogeny; their form as j-images of `Y₀(r)(ℚ)` lacks the same modular curves. The
unconditional modular abelian rank-zero theorem lacks the attached modular quotient
and its L-function; the integral winding comparison lacks its Hecke quotient and
Néron cotangent realization. The coefficient-prime reduction alternative and
exceptional projective-image bound lack the local reduction/weight and projective
image interfaces. Full Néron torsion specialization lacks the Néron reduction map.
The finite-j exceptional-prime divisibility theorem lacks the good-reduction trace
and local inertia interfaces. The quantitative elliptic isogeny-degree theorem is
not statable because the stable Faltings-height carrier is missing. The weight-two
cup/Chern sign and Tate-module duality comparisons lack the normalized modular-unit
symbols, their étale classes and the attached filtered de Rham eigenform line at
the pins. README.md consumes PadicFamilies §§4.0.1–4.0.3 for the raw classes,
raw reciprocity and CM comparison, and specifies the additional supplier contracts
kato-labelled-pushforward and kato-labelled-reciprocity for labelled final levels;
no roadmap module is imported here.
-/

noncomputable section
open scoped BigOperators WeierstrassCurve NumberField
open Classical

namespace TauCetiRoadmap.EllipticCurveModularityPartII

/-! ## Layer 1: thresholds and sharp newspace dimensions -/

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
theorem dimension_comparison (N : ℕ) [NeZero N] :
    martinValue N = (newDimension N : ℚ) := by sorry

/-- Martin's sharp bound, including its complete equality characterization
(Theorem 2, preprint p. 3). -/
theorem martin_bound (N : ℕ) [NeZero N] :
    12 * newDimension N ≤ N + 1 ∧
      (12 * newDimension N = N + 1 ↔ N = 35 ∨ (N.Prime ∧ N % 12 = 11)) := by sorry

/-- Kraus's coefficient-rationality threshold `F♯(N) = (√(μ(N)/6) + 1)^(2 g⁺(N))`, with
`μ(N)` the index of `Γ₀(N)` and `g⁺(N)` the trivial-character newspace dimension
(Kraus, §3.1, equation (7)); the value `0` at `N = 0` is a total-function convention. -/
def sharpF (N : ℕ) : ℝ :=
  if h : N = 0 then 0 else
    haveI : NeZero N := ⟨h⟩
    (Real.sqrt (((CongruenceSubgroup.Gamma0 N).index : ℝ) / 6) + 1) ^ (2 * newDimension N)

/-- Kraus's two-torsion threshold `G♯(N) = (√(μ(lcm(N,4))/6) + 1)^2` (Kraus, §3.1,
equation (8)); the value `0` at `N = 0` is a total-function convention. -/
def sharpG (N : ℕ) : ℝ :=
  if N = 0 then 0 else
    (Real.sqrt (((CongruenceSubgroup.Gamma0 (Nat.lcm N 4)).index : ℝ) / 6) + 1) ^ 2

/-- Kraus's full-two-torsion threshold `H♯(N) = max(F♯(N), G♯(N))` (Kraus, §3.1,
equation (9)). -/
def sharpH (N : ℕ) : ℝ := max (sharpF N) (sharpG N)

/-! ## Layer 2: removed-prime exponent bounds -/

/-- Geometric n-torsion of an elliptic Weierstrass curve over the fixed
algebraic closure of the rationals. -/
abbrev GeometricTorsion (E : WeierstrassCurve ℚ) [E.IsElliptic] (n : ℕ) :=
  AddSubgroup.torsionBy (E.baseChange (AlgebraicClosure ℚ)).toAffine.Point (n : ℤ)

/-- The natural ZMod n module on geometric n-torsion. -/
instance torsionModule (E : WeierstrassCurve ℚ) [E.IsElliptic] (n : ℕ) :
    Module (ZMod n) (GeometricTorsion E n) := AddSubgroup.torsionBy.zmodModule

/-- The pinned additive torsion action, read as a linear representation via
AddMonoidHom.toZModLinearMap; the action on points is unchanged. -/
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

/-- A nonzero algebraic integer in a prime above ell has norm at least ell;
a uniform bound on all complex embeddings bounds that norm from above. -/
theorem norm_bound {K : Type*} [Field K] [NumberField K]
    (ell : ℕ) (hell : ell.Prime) (I : Ideal (𝓞 K))
    (hI : I.IsPrime) (hI0 : I ≠ ⊥)
    (habove : Ideal.comap (Int.castRingHom (𝓞 K)) I = Ideal.span {(ell : ℤ)})
    (x : 𝓞 K) (hx : x ∈ I) (hx0 : x ≠ 0) (B : ℝ)
    (hB : ∀ σ : K →ₐ[ℚ] ℂ, ‖σ (x : K)‖ ≤ B) :
    (ell : ℝ) ≤ |(Algebra.norm ℚ (x : K) : ℝ)| ∧
      |(Algebra.norm ℚ (x : K) : ℝ)| ≤ B ^ Module.finrank ℚ K := by sorry

/-- The deletion level `M₀` of an elliptic curve over ℚ at `ell` (Bennett–Siksek, §2,
equation (3)): the conductor `M`, read as the norm of Tau Ceti's algorithmic conductor ideal
of ℤ (the conductor by Ogg's formula), divided by the product of the primes `q` with
`ord_q M = 1` such that `ell` divides `ord_q Δ`, the exponent of `q` in the norm of the minimal
discriminant ideal. The prime `q = ell` is not excluded. -/
def deletionLevel (E : WeierstrassCurve ℚ) [E.IsElliptic] (ell : ℕ) : ℕ :=
  let M := Ideal.absNorm (WeierstrassCurve.algorithmicConductor ℤ E)
  let D := Ideal.absNorm (WeierstrassCurve.minimalDiscriminantIdeal ℤ E)
  M / ∏ q ∈ M.primeFactors.filter (fun q => M.factorization q = 1 ∧ ell ∣ D.factorization q), q

/-- The removed-prime exponent bound (Bennett–Siksek, Lemma 2.2, p. 359): if `E[ell]` is
irreducible for a prime `ell ≥ 3` and `p ≠ ell` divides the conductor exactly once with `ell`
dividing `ord_p Δ`, then `ell ≤ (√p + 1) ^ ((M₀ + 1) / 6)` for the deletion level `M₀`.
The hypothesis `ord_p M = 1` forces `p` to be prime. -/
theorem removed_prime_bound (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (ell : ℕ) [Fact ell.Prime] (hell : 3 ≤ ell)
    (hirr : (torsionRepresentation E ell).IsIrreducible)
    (p : ℕ) (hpl : p ≠ ell)
    (hpM : (Ideal.absNorm (WeierstrassCurve.algorithmicConductor ℤ E)).factorization p = 1)
    (hpΔ : ell ∣ (Ideal.absNorm (WeierstrassCurve.minimalDiscriminantIdeal ℤ E)).factorization p) :
    (ell : ℝ) ≤ (Real.sqrt p + 1) ^ (((deletionLevel E ell : ℝ) + 1) / 6) := by sorry

/-! ## Layer 3: rationality and exact-conductor realization -/

/-- A primitive weight-two trivial-character newform has integral coefficients
if its prime coefficients through the Sturm bound are integers
(Kraus, Lemma 1, pp. 1144–1145). -/
theorem rationality_of_small_prime_coefficients (N : ℕ) [NeZero N]
    (f : HeckeRing.GL2.Newform N 2) (hχ : f.χ = 1)
    (hsmall : ∀ q : ℕ, q.Prime → 6 * q ≤ (CongruenceSubgroup.Gamma0 N).index →
      ∃ z : ℤ, (UpperHalfPlane.qExpansion 1 f.toCuspForm).coeff q = (z : ℂ)) :
    ∀ n : ℕ, ∃ z : ℤ, (UpperHalfPlane.qExpansion 1 f.toCuspForm).coeff n = (z : ℂ) := by sorry

/-- Realization at the deletion level: for a prime `ell ≥ 3` with `E[ell]` irreducible and
`ell > F♯(M₀)`, `M₀` the deletion level, there is an elliptic curve `C/ℚ` of conductor exactly
`M₀` whose geometric `ell`-torsion is isomorphic to that of `E` as a Galois module. No Serre
weight or residual-conductor hypothesis is made (Bennett–Siksek, §2, Theorem 3 and p. 360;
Kraus's proof of Theorem 3, §3.2, p. 1145, run on the level-`M₀` newform). -/
theorem deletion_level_realization (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (ell : ℕ) [Fact ell.Prime] (hell : 3 ≤ ell)
    (hirr : (torsionRepresentation E ell).IsIrreducible)
    (hF : sharpF (deletionLevel E ell) < ell) :
    ∃ (C : WeierstrassCurve ℚ) (_ : C.IsElliptic),
      Ideal.absNorm (WeierstrassCurve.algorithmicConductor ℤ C) = deletionLevel E ell ∧
      ∃ e : GeometricTorsion E ell ≃ₗ[ZMod ell] GeometricTorsion C ell,
        ∀ σ P, e (torsionRepresentation E ell σ P) = torsionRepresentation C ell σ (e P) := by
  sorry

/-! ## Layer 4: full rational two-torsion realization -/

/-- For any nonnegative weight, level, nebentypus and ideal of a number field's
integers, coefficient membership through the Gamma0 Sturm bound implies membership
at every coefficient (Kraus, Appendix II, Proposition 1, p. 1158). -/
theorem integral_sturm_congruence (N : ℕ) [NeZero N] (k : ℕ)
    (χ : (ZMod N)ˣ →* ℂˣ) {K : Type*} [Field K] [NumberField K]
    (σ : K →ₐ[ℚ] ℂ) (J : Ideal (𝓞 K)) (f : modFormCharSpace (k : ℤ) χ)
    (a : ℕ → 𝓞 K)
    (ha : ∀ n, (UpperHalfPlane.qExpansion 1 f.val).coeff n = σ (a n : K))
    (hsmall : ∀ n : ℕ, 12 * n ≤ k * (CongruenceSubgroup.Gamma0 N).index → a n ∈ J) :
    ∀ n : ℕ, a n ∈ J := by sorry

/-! ## Layer 5: uniform two-torsion irreducibility -/

/-- Every geometric endomorphism is an integer multiple of the identity;
this tests complex multiplication over the algebraic closure. -/
def NonCM (E : WeierstrassCurve ℚ) [E.IsElliptic] : Prop :=
  ∀ f : TauCeti.Isogeny.Hom (E.baseChange (AlgebraicClosure ℚ)).toAffine
      (E.baseChange (AlgebraicClosure ℚ)).toAffine,
    ∃ n : ℤ, f = n • (1 : TauCeti.Isogeny.Hom
      (E.baseChange (AlgebraicClosure ℚ)).toAffine (E.baseChange (AlgebraicClosure ℚ)).toAffine)

/-- A rational isogeny of degree n with cyclic geometric kernel;
the kernel is taken after base change to the algebraic closure. -/
def HasCyclicIsogeny (E : WeierstrassCurve ℚ) [E.IsElliptic] (n : ℕ) : Prop :=
  ∃ F : WeierstrassCurve ℚ, ∃ (_ : F.IsElliptic),
    ∃ f : TauCeti.Isogeny E.toAffine F.toAffine,
      f.degree = n ∧ IsAddCyclic ((f.map (algebraMap ℚ (AlgebraicClosure ℚ))).ker)

/-- Mazur's prime-degree classification for rational cyclic isogenies,
including the CM degrees (Theorem 1, pp. 129–130). -/
theorem prime_isogeny_degrees (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (p : ℕ) (hp : p.Prime) (h : HasCyclicIsogeny E p) :
    p ∈ ({2, 3, 5, 7, 11, 13, 17, 19, 37, 43, 67, 163} : Finset ℕ) := by sorry

/-- A non-CM rational elliptic curve has no rational prime-degree cyclic
isogeny outside Mazur's non-CM list. -/
theorem noncm_prime_isogeny_degrees (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (hCM : NonCM E) (p : ℕ) (hp : p.Prime) (h : HasCyclicIsogeny E p) :
    p ∈ ({2, 3, 5, 7, 11, 13, 17, 37} : Finset ℕ) := by sorry

/-- The Mazur–Kenku classification restricts every rational cyclic-isogeny
degree, including composite degrees and CM curves. -/
theorem cyclic_isogeny_degrees (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (n : ℕ) (h : HasCyclicIsogeny E n) :
    n ∈ Finset.Icc 1 19 ∪ ({21, 25, 27, 37, 43, 67, 163} : Finset ℕ) := by sorry

/-- All four points killed by two are rational. -/
def FullRationalTwo (E : WeierstrassCurve ℚ) [E.IsElliptic] : Prop :=
  Nat.card (AddSubgroup.torsionBy E.toAffine.Point (2 : ℤ)) = 4

/-- There is a nonzero rational point killed by two. -/
def RationalTwo (E : WeierstrassCurve ℚ) [E.IsElliptic] : Prop :=
  ∃ P : E.toAffine.Point, P ≠ 0 ∧ (2 : ℤ) • P = 0

/-- Full rational two-torsion forces irreducibility at every prime ell ≥ 5;
the absolute assertion uses the native scalar extension to the algebraic closure. -/
theorem full_two_irreducible (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (ell : ℕ) [Fact ell.Prime] (hell : 5 ≤ ell) (hE : FullRationalTwo E) :
    (torsionRepresentation E ell).IsIrreducible ∧
      ((torsionRepresentation E ell).baseChange (AlgebraicClosure (ZMod ell))).IsIrreducible := by sorry

/-- A rational point of order two forces irreducibility and absolute
irreducibility at every prime ell ≥ 11 (Bennett–Siksek, Lemma 3.5). -/
theorem rational_two_irreducible (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (ell : ℕ) [Fact ell.Prime] (hell : 11 ≤ ell) (hE : RationalTwo E) :
    (torsionRepresentation E ell).IsIrreducible ∧
      ((torsionRepresentation E ell).baseChange (AlgebraicClosure (ZMod ell))).IsIrreducible := by sorry

/-- Realization with full rational two-torsion at the deletion level: if `E/ℚ` has full
rational two-torsion and the prime `ell` exceeds `H♯(M₀)`, `M₀` the deletion level, there is an
elliptic curve `C/ℚ` with full rational two-torsion, conductor exactly `M₀`, and geometric
`ell`-torsion isomorphic to that of `E` as a Galois module. Since `H♯ ≥ 4`, `ell ≥ 5`, and
`E[ell]` is irreducible by `full_two_irreducible` (Bennett–Siksek, §2, Theorem 4, p. 360;
Kraus, §3.3, pp. 1145–1146, run at level `M₀`). -/
theorem deletion_level_full_two_realization (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (hE : FullRationalTwo E) (ell : ℕ) [Fact ell.Prime]
    (hH : sharpH (deletionLevel E ell) < ell) :
    ∃ (C : WeierstrassCurve ℚ) (_ : C.IsElliptic), FullRationalTwo C ∧
      Ideal.absNorm (WeierstrassCurve.algorithmicConductor ℤ C) = deletionLevel E ell ∧
      ∃ e : GeometricTorsion E ell ≃ₗ[ZMod ell] GeometricTorsion C ell,
        ∀ σ P, e (torsionRepresentation E ell σ P) = torsionRepresentation C ell σ (e P) := by
  sorry

/-! ## Layer 6: rational-isogeny uniformity -/

/-- The rational j-tables at levels 11, 17 and 37, in moduli form: the j-invariants of the
elliptic curves over ℚ with a rational cyclic isogeny of degree 11, 17 or 37 are exactly the
listed values (Lemos, §2, p. 5). No listed value is 0 or 1728, so these are also the j-images
of the noncuspidal rational points of `Y₀(r)`. -/
theorem rational_isogeny_j_tables :
    {j : ℚ | ∃ (E : WeierstrassCurve ℚ) (_ : E.IsElliptic), HasCyclicIsogeny E 11 ∧ E.j = j} =
        {-(11 * 131 ^ 3), -(2 ^ 15), -(11 ^ 2)} ∧
      {j : ℚ | ∃ (E : WeierstrassCurve ℚ) (_ : E.IsElliptic), HasCyclicIsogeny E 17 ∧ E.j = j} =
        {-(17 ^ 2 * 101 ^ 3) / 2, -(17 * 373 ^ 3) / 2 ^ 17} ∧
      {j : ℚ | ∃ (E : WeierstrassCurve ℚ) (_ : E.IsElliptic), HasCyclicIsogeny E 37 ∧ E.j = j} =
        {-(7 * 137 ^ 3 * 2083 ^ 3), -(7 * 11 ^ 3)} := by sorry

/-- The torsion image normalizes a quadratic finite subfield of its endomorphism
ring. The units of that field are a nonsplit Cartan subgroup. -/
def ImageInNonsplitCartanNormalizer (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (p : ℕ) [Fact p.Prime] : Prop :=
  ∃ C : Subring (Module.End (ZMod p) (GeometricTorsion E p)),
    IsField C ∧ Nat.card C = p ^ 2 ∧
      ∀ σ, ∀ c ∈ C,
        torsionRepresentation E p σ * c * torsionRepresentation E p σ⁻¹ ∈ C

/-- For a non-CM rational elliptic curve and p > 37, a proper torsion image
lies in a nonsplit Cartan normalizer (Lemos, Theorem 2.3, p. 6). -/
theorem nonsplit_of_not_surjective (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (hCM : NonCM E) (p : ℕ) [Fact p.Prime] (hp : 37 < p)
    (h : ¬ Function.Surjective (E.torsionGaloisAction (K := AlgebraicClosure ℚ) (p : ℤ))) :
    ImageInNonsplitCartanNormalizer E p := by sorry

/-- A rational cyclic isogeny of one of the five genus-zero prime degrees and
nonsplit-normalizer containment, at a prime outside that set, force integral j
(Lemos, Proposition 2.1, p. 4). No non-CM hypothesis is needed. -/
theorem lemos_integral_j (E : WeierstrassCurve ℚ) [E.IsElliptic] (r : ℕ)
    (hr : r ∈ ({2, 3, 5, 7, 13} : Finset ℕ)) (hisog : HasCyclicIsogeny E r)
    (p : ℕ) [Fact p.Prime] (hp : p ∉ ({2, 3, 5, 7, 13} : Finset ℕ))
    (hns : ImageInNonsplitCartanNormalizer E p) :
    ∃ m : ℤ, E.j = (m : ℚ) := by sorry

/-- Lemos's theorem: a non-CM rational elliptic curve with a nontrivial rational
cyclic isogeny has full automorphism image on p-torsion for every prime p > 37.
Automorphisms of this exponent-p group are automatically Fp-linear. -/
theorem lemos_surjectivity (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (hCM : NonCM E) (n : ℕ) (hn : 1 < n) (hisog : HasCyclicIsogeny E n)
    (p : ℕ) [Fact p.Prime] (hp : 37 < p) :
    Function.Surjective (E.torsionGaloisAction (K := AlgebraicClosure ℚ) (p : ℤ)) := by sorry

end TauCetiRoadmap.EllipticCurveModularityPartII
