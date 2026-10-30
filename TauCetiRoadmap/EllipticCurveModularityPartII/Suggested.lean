import Mathlib
import TauCeti.NumberTheory.ModularForms.Newforms.Basic
import TauCeti.NumberTheory.ModularForms.DiamondOperators
import TauCeti.NumberTheory.ModularForms.Newforms.Newform
import TauCeti.AlgebraicGeometry.EllipticCurve.Affine.Point.Galois
import TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.Kernel
import TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.BaseChange.Basic
import TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.Hom.Add
import TauCeti.RepresentationTheory.BaseChange

/-!
# EllipticCurveModularityPartII: target signatures

The roadmap is README.md; this file is not the roadmap. It states its headline
theorems against the pinned Mathlib and Tau Ceti APIs.

Headlines: Martin's dimension formula and sharp equality criterion; the integral
norm bound; sharp Kraus rational and full-two-torsion realization; uniform
irreducibility and absolute irreducibility with rational two-torsion; the prime,
non-CM prime and composite rational cyclic-isogeny degree classifications; finite-prime
coefficient rationality; integral ideal-congruence Sturm; Cartan integrality,
the proper-image classification and Lemos's rational-isogeny surjectivity theorem;
unconditional modular abelian rank zero and weight-two modular class reciprocity;
the quantitative elliptic isogeny-degree bound.

The removed-prime bound and Kraus realization are not statable at the pins: the elliptic arithmetic conductor,
residual Artin conductor and Serre weight interfaces are missing. The Cartan
correspondence, winding quotient and formal immersion headlines
lack the modular curves with their moduli/j maps, modular Jacobians with integral
Hecke quotients, and their canonical integral models. They remain README targets;
no replacement predicates or admitted constructions are used here. The Bilu–Parent–Rebolledo rational-point theorem, normalized modular coordinates
and rational-point tables are not statable:
the corresponding modular curves with their moduli and j maps are missing. The
unconditional modular abelian rank-zero theorem lacks the attached modular quotient
and its L-function; the integral winding comparison lacks its Hecke quotient and
Néron cotangent realization. The coefficient-prime reduction alternative and
exceptional projective-image bound lack the local reduction/weight and projective
image interfaces. Full Néron torsion specialization lacks the Néron reduction map.
The finite-j exceptional-prime divisibility theorem lacks the good-reduction trace
and local inertia interfaces. The quantitative elliptic isogeny-degree theorem is
not statable because the stable Faltings-height carrier is missing. Weight-two
modular class reciprocity lacks the normalized modular-unit symbols, their
cup-normalized étale classes and the attached filtered de Rham eigenform line.
These are README targets, not assumed suppliers.
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

/-! ## Layer 2: removed-prime exponent bounds -/

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

/-! ## Layer 3: rationality and exact-conductor realization -/

/-- A primitive weight-two trivial-character newform has integral coefficients
if its prime coefficients through the Sturm bound are integers
(Kraus, Lemma 1, pp. 1144–1145). -/
theorem rationality_of_small_prime_coefficients (N : ℕ) [NeZero N]
    (f : HeckeRing.GL2.Newform N 2) (hχ : f.χ = 1)
    (hsmall : ∀ q : ℕ, q.Prime → 6 * q ≤ (CongruenceSubgroup.Gamma0 N).index →
      ∃ z : ℤ, (UpperHalfPlane.qExpansion 1 f.toCuspForm).coeff q = (z : ℂ)) :
    ∀ n : ℕ, ∃ z : ℤ, (UpperHalfPlane.qExpansion 1 f.toCuspForm).coeff n = (z : ℂ) := by sorry

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

/-! ## Layer 6: rational-isogeny uniformity -/

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
