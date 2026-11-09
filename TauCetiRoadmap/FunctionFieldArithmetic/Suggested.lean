import Mathlib
import TauCeti.FieldTheory.FunctionField.Place.Extension.Inertia
import TauCeti.FieldTheory.FunctionField.RiemannRoch.ClassNumber
import TauCeti.NumberTheory.ClassFieldTheory.Local.ArtinMap
import TauCeti.NumberTheory.ClassFieldTheory.LocalExistence.NormSubgroup

/-!
# FunctionFieldArithmetic: target signatures

The roadmap is README.md; this file is not the roadmap. It states its headline theorems
against the pinned Mathlib and Tau Ceti APIs, using the few simple definitions they need.

The degree-one divisor theorem, reduced-basis theorem, Witt-vector additive Hilbert 90,
finite- and infinite-length Artin–Schreier–Witt character classification, local abelian
existence and injectivity of the local Artin map for every nonarchimedean local field (on the
pinned Tau Ceti Artin map and norm subgroups, and for `k((T))` with field carriers), divisor zeta
identities, the recovery of the `L`-polynomial from `g` point counts and the degree-sensitive
Chebotarev estimate (on the pinned decomposition groups of places, through Mathlib's
`IsArithFrobAt`) are statable below.
The remaining headline theorems lack the following carriers at the pins:
divisor-lattice Fourier duality and volumes (§2) need completed adelic divisor lattices
and the differential's self-dual measure; reduced Witt–Laurent representatives (§3.2) need
convergent sums in `W(k((T)))`, which carries no topology at the pins; the Schmid–Witt symbol
and its residue formula (§4.3) need the Artin–Schreier–Witt character of a class as a map,
whose construction is the duality theorem of §3.1 (asserted below only as an existence), and
the completed ring `lim_m W_m(k)((T))` with its residue; the Kosters–Wan conductor formula
(§4.4) needs those reduced representatives and the field `K(℘⁻¹x)` as a finite separable
extension carrying the pinned conductor exponent. Lubin–Tate torsion (§4.1) and local
Kronecker–Weber (§4.2) need the Lubin–Tate formal module with its coefficient action and the
Lubin–Tate tower. The perfect-field fixed-modulus universal property and finite-abelian
ray-cover classification (§§4.7, 4.10) need generalized Picard schemes, Abel maps and Lang
covers. The finite-coefficient cohomological
L-function identity (§5.7) needs constructible étale
sheaves with derived compact-support cohomology and Frobenius. Harder finiteness (§§6.4–6.5)
needs reductive adelic automorphic function modules; Yu's degree-zero nonvanishing (§6.7)
needs their cuspidal representation and Whittaker interfaces. The inducing-character
obstruction and existence theorems (§7.1) need the idele class group of a function field (the
divisor pullback is the pinned `TauCeti.Divisor.conorm`) and adelic unitary-character
interfaces. Unitary cuspidal and
discrete-data Eisenstein continuation and Levi discrete decomposition (§7.2) need smooth
induced sections, Eisenstein series and their L² realizations; the Whittaker–density
identity, density interpolation and global Fourier coefficient formulas (§§7.4–7.6)
also need Hermitian local representation densities. Their full statements are in the README.
-/

namespace TauCetiRoadmap.FunctionFieldArithmetic

open TauCeti

/-! ## Layer 0: finite constant fields, degrees and normalisations -/

section Constants

variable {k F : Type*} [Field k] [Field F] [Algebra k F]

/-- **Divisors of degree one** (README 0.2): the divisor form of F. K. Schmidt's theorem. No
place of degree one, and no rational point of the model, is asserted. -/
theorem exists_divisor_degree_eq_one [Finite k] (hF : IsFunctionField k F)
    (hk : IsIntegrallyClosedIn k F) : ∃ D : Divisor k F, Divisor.degree D = 1 := by
  sorry

end Constants

/-! ## Layer 1: Riemann–Roch spaces over a polynomial subring -/

/-- Reduced bases simultaneously describe every pole shift of a divisor, with uniquely
determined sorted invariants (README 1.2; Hess, Theorem 7 and Corollary 11). The chosen
rational subfield need not be separating, and the constant field need not be exact. -/
theorem riemannRoch_reducedBasis
    {k F : Type*} [Field k] [Field F] [Algebra k F]
    [Algebra (RatFunc k) F] [IsScalarTower k (RatFunc k) F]
    [FiniteDimensional (RatFunc k) F]
    (hF : IsFunctionField k F) (D : Divisor k F) (x : Fˣ)
    (hx : (x : F) = algebraMap (RatFunc k) F RatFunc.X) :
    ∃! d : Fin (Module.finrank (RatFunc k) F) → ℤ,
      Antitone d ∧
        ∃ v : Fin (Module.finrank (RatFunc k) F) → F,
          LinearIndependent (RatFunc k) v ∧
          ∀ r : ℤ,
            let w := fun a : {a : Fin (Module.finrank (RatFunc k) F) × ℕ //
                (a.2 : ℤ) ≤ d a.1 + r} =>
              (x : F) ^ a.val.2 * v a.val.1
            LinearIndependent k w ∧
              Submodule.span k (Set.range w) =
                riemannRochSpace (D + r • Divisor.poles hF x) := by
  sorry

/-! ## Layer 3: Artin–Schreier–Witt theory -/

section ArtinSchreierWitt

variable (p : ℕ) [Fact p.Prime] (F : Type*) [Field F]

/-- **The Artin–Schreier–Witt operator** `℘ = Frob − id` on the Witt vectors of a field of
characteristic `p` (README 3.1). It is additive for the Witt group law. -/
noncomputable def artinSchreierWitt [CharP F p] : WittVector p F →+ WittVector p F :=
  (WittVector.frobenius : WittVector p F →+* WittVector p F).toAddMonoidHom -
    AddMonoidHom.id (WittVector p F)

/-- **The Artin–Schreier–Witt group of length `n`** (README 3.1):
`W_n(F) / ℘ W_n(F) = W(F) / (℘ W(F) + ker (truncate n))`. -/
abbrev aswQuotient [CharP F p] (n : ℕ) : Type _ :=
  WittVector p F ⧸ ((artinSchreierWitt p F).range ⊔
    (RingHom.ker (WittVector.truncate (p := p) (R := F) n)).toAddSubgroup)

variable [CharP F p]

/-- Witt additive Hilbert 90 for a finite cyclic Galois extension (README 3.1;
Kosters–Wan, Proposition 3.1). The automorphisms act coefficientwise, while the
difference and trace use Witt subtraction and addition, at every length including zero. -/
theorem witt_additiveHilbert90 {L : Type*} [Field L] [CharP L p] [Algebra F L]
    [FiniteDimensional F L] [IsGalois F L]
    (σ : L ≃ₐ[F] L) (hσ : Subgroup.zpowers σ = ⊤) (n : ℕ) :
    let σW : TruncatedWittVector p n L → TruncatedWittVector p n L :=
      fun a => TruncatedWittVector.mk p fun i => σ (a.coeff i)
    let iW : TruncatedWittVector p n F → TruncatedWittVector p n L :=
      fun a => TruncatedWittVector.mk p fun i => algebraMap F L (a.coeff i)
    let TW : TruncatedWittVector p n L → TruncatedWittVector p n L :=
      fun a => ∑ τ : L ≃ₐ[F] L, TruncatedWittVector.mk p fun i => τ (a.coeff i)
    {a | a - σW a = 0} = Set.range iW ∧
      Set.range (fun a => a - σW a) = {a | TW a = 0} ∧
      Set.range TW = Set.range iW := by
  sorry

/-- **Artin–Schreier–Witt duality at length `n`** (README 3.1; Kosters–Wan, Theorem 3.4,
pp. 8–9). The solution pairing is an isomorphism of `Q_n(F)` with the continuous characters of
the absolute Galois group with values in `ℤ/p^n`: if `℘ y = x` for a Witt vector `y` over the
algebraic closure, the class of `x` goes to the character `σ ↦ σ y − y`. That difference lies in
`W(𝔽_p) = ℤ_p`, and it is read in `ℤ/p^n` through any integer with the same length-`n`
truncation. The equation fixes the equivalence, so its negative (the geometric convention) and
its other unit multiples are excluded. -/
theorem exists_addEquiv_aswQuotient_characters (n : ℕ) :
    ∃ e : aswQuotient p F n ≃+
        Additive (ContinuousMonoidHom (Field.absoluteGaloisGroup F)
          (Multiplicative (ZMod (p ^ n)))),
      ∀ (x : WittVector p F) (y : WittVector p (AlgebraicClosure F)),
        WittVector.frobenius y - y = WittVector.map (algebraMap F (AlgebraicClosure F)) x →
        ∀ (σ : Field.absoluteGaloisGroup F) (m : ℤ),
          WittVector.truncate n
              (WittVector.map (σ : AlgebraicClosure F ≃ₐ[F] AlgebraicClosure F).toRingHom y -
                y) =
            WittVector.truncate n (m : WittVector p (AlgebraicClosure F)) →
          Multiplicative.toAdd (Additive.toMul (e (QuotientAddGroup.mk x)) σ) =
            (m : ZMod (p ^ n)) := by
  sorry

/-- **Artin–Schreier–Witt duality at infinite length** (README 3.1; Kosters–Wan, Theorem 3.4
and its inverse-limit argument, pp. 8–9). The solution pairing is an isomorphism of
`W(F) / ℘ W(F)` with the continuous characters of the absolute Galois group with values in the
additive group of `ℤ_p`: the class of `x = ℘ y` goes to `σ ↦ σ y − y ∈ W(𝔽_p) = ℤ_p`, pinned by
its reductions modulo every `p^n`. No perfectness assumption on the field is needed. -/
theorem exists_addEquiv_aswQuotient_padicCharacters :
    ∃ e : (WittVector p F ⧸ (artinSchreierWitt p F).range) ≃+
        Additive (ContinuousMonoidHom (Field.absoluteGaloisGroup F)
          (Multiplicative (PadicInt p))),
      ∀ (x : WittVector p F) (y : WittVector p (AlgebraicClosure F)),
        WittVector.frobenius y - y = WittVector.map (algebraMap F (AlgebraicClosure F)) x →
        ∀ (σ : Field.absoluteGaloisGroup F) (n : ℕ) (m : ℤ),
          WittVector.truncate n
              (WittVector.map (σ : AlgebraicClosure F ≃ₐ[F] AlgebraicClosure F).toRingHom y -
                y) =
            WittVector.truncate n (m : WittVector p (AlgebraicClosure F)) →
          PadicInt.toZModPow n
              (Multiplicative.toAdd (Additive.toMul (e (QuotientAddGroup.mk x)) σ)) =
            (m : ZMod (p ^ n)) := by
  sorry

end ArtinSchreierWitt

/-! ## Layer 4: equal-characteristic class field theory and ray geometry -/

/-- **Local abelian existence for every nonarchimedean local field** (README 4.2): every open
subgroup of finite index of `Kˣ` is the norm subgroup of a finite abelian extension, that is, of
an abelian class-field layer of `Gal(Kˢ/K)`. In characteristic zero this is the pinned
`TauCeti.ClassFieldTheory.localAbelianExistence`, where openness is automatic; the content is
`char K = p`, where it is not (Yoshida, Theorem A and §5.3(iv)). Uniqueness and the equality of
degree and index are the pinned `localClassField_unique` and `index_localNormSubgroup`. -/
theorem localAbelianExistence_all (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (H : Subgroup Kˣ) (hH : IsOpen (H : Set Kˣ))
    [H.FiniteIndex] :
    ∃ V : OpenNormalSubgroup (AbsoluteGaloisGroup K),
      V.IsAbelianClassFieldLayer ∧ ClassFieldTheory.localNormSubgroup K V = H := by
  sorry

/-- **Injectivity of the local Artin map for every nonarchimedean local field** (README 4.2):
the absolute local Artin map `Kˣ →* G_K^ab` is injective. In characteristic zero this is the
pinned `TauCeti.ClassFieldTheory.injective_artinMap`; in characteristic `p` the kernel, the
intersection of all norm subgroups, is trivial once every open subgroup of finite index is a
norm subgroup (`localAbelianExistence_all`). -/
theorem injective_artinMap_all (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] :
    Function.Injective (ClassFieldTheory.artinMap K) := by
  sorry

/-- **Local abelian existence for `k((T))` with field carriers** (README 4.2; Yoshida,
§5.3(iv)): the case `K = k((T))` of `localAbelianExistence_all`, stated with intermediate fields
of an algebraic closure and the field norm. Every open finite-index subgroup of `k((T))ˣ`, for a
finite field `k`, is the norm group of a unique finite abelian extension in a fixed algebraic
closure, whose degree is that index. -/
theorem localAbelianExistence_laurentSeries (k : Type*) [Field k] [Finite k]
    (H : Subgroup (LaurentSeries k)ˣ)
    (hH : IsOpen (H : Set (LaurentSeries k)ˣ)) [H.FiniteIndex] :
    ∃! L : IntermediateField (LaurentSeries k) (AlgebraicClosure (LaurentSeries k)),
      FiniteDimensional (LaurentSeries k) L ∧ IsGalois (LaurentSeries k) L ∧
      (∀ σ τ : L ≃ₐ[LaurentSeries k] L, σ * τ = τ * σ) ∧
      Subgroup.map (Units.map (Algebra.norm (LaurentSeries k) : L →* LaurentSeries k)) ⊤ = H ∧
      Module.finrank (LaurentSeries k) L = H.index := by
  sorry

/-! ## Layer 5: zeta functions and `L`-polynomials of function fields -/

section Zeta

variable (k F : Type*) [Field k] [Field F] [Algebra k F]

/-- The number of effective divisors of degree `n` (finite over a finite constant field by
`TauCeti.Divisor.finite_setOf_isEffective_degree_le`). -/
noncomputable def effectiveDivisorCount (n : ℕ) : ℕ :=
  Nat.card {D : Divisor k F // AlgebraicGeometry.WeilDivisor.IsEffective D ∧ Divisor.degree D = n}

/-- **The zeta function of a function field** (README 5.1): `Σ_n A_n T^n`, with `A_n` the number of
effective divisors of degree `n`. -/
noncomputable def zeta : PowerSeries ℤ :=
  PowerSeries.mk fun n => (effectiveDivisorCount k F n : ℤ)

/-- The number of places of degree `d`. -/
noncomputable def placeCount (d : ℕ) : ℕ :=
  Nat.card {P : Place k F // P.degree = d}

/-- The extension-field point count `N_r = Σ_{d ∣ r} d · #{places of degree d}` (README 5.1). -/
noncomputable def pointCount (r : ℕ) : ℕ :=
  ∑ d ∈ r.divisors, d * placeCount k F d

variable {k F}

open scoped PowerSeries.WithPiTopology

/-- The divisor zeta series is the coefficientwise convergent Euler product over all places
(README 5.1). Each factor is the geometric series in the place degree. -/
theorem zeta_eulerProduct [Finite k] (hF : IsFunctionField k F)
    (hk : IsIntegrallyClosedIn k F) :
    HasProd (fun v : Place k F =>
      PowerSeries.invOfUnit
        (1 - (PowerSeries.X : PowerSeries ℤ) ^ v.degree) (1 : ℤˣ))
      (zeta k F) := by
  sorry

/-- **Logarithmic derivative of the zeta function** (README 5.1):
`r A_r = Σ_{i=1}^{r} N_i A_{r−i}`, equivalently `T Z′/Z = Σ_r N_r T^r`. -/
theorem zeta_logDeriv [Finite k] (hF : IsFunctionField k F) (hk : IsIntegrallyClosedIn k F)
    (r : ℕ) (hr : 0 < r) :
    (r : ℤ) * PowerSeries.coeff r (zeta k F) =
      ∑ i ∈ Finset.range r,
        (pointCount k F (i + 1) : ℤ) * PowerSeries.coeff (r - 1 - i) (zeta k F) := by
  sorry

/-- **Effective divisors in large degree** (README 5.2): for `n > 2g − 2`,
`(q − 1) A_n = h (q^(n + 1 − g) − 1)`. -/
theorem effectiveDivisorCount_of_large [Finite k] (hF : IsFunctionField k F)
    (hk : IsIntegrallyClosedIn k F) (n : ℕ) (hn : 2 * genus k F ≤ n + 1) :
    ((Nat.card k : ℤ) - 1) * effectiveDivisorCount k F n =
      Divisor.classNumber hF * ((Nat.card k : ℤ) ^ (n + 1 - genus k F) - 1) := by
  sorry

/-- **Rationality, functional equation and the class number** (README 5.3). The `L`-polynomial
`(1 − T)(1 − qT) Z(T)` has degree `2g`, constant term `1`, leading coefficient `q^g`, the
reciprocal symmetry `a_{2g−j} = q^(g−j) a_j`, linear coefficient `N_1 − (q + 1)` and value `h`
at `1`. -/
theorem zeta_rationality [Finite k] (hF : IsFunctionField k F) (hk : IsIntegrallyClosedIn k F) :
    ∃ P : Polynomial ℤ,
      zeta k F * ((1 - PowerSeries.X) * (1 - PowerSeries.C (Nat.card k : ℤ) * PowerSeries.X)) =
        (P : PowerSeries ℤ) ∧
      P.coeff 0 = 1 ∧ P.natDegree = 2 * genus k F ∧
      P.leadingCoeff = (Nat.card k : ℤ) ^ genus k F ∧
      (∀ j ≤ genus k F,
        P.coeff (2 * genus k F - j) = (Nat.card k : ℤ) ^ (genus k F - j) * P.coeff j) ∧
      P.coeff 1 = (pointCount k F 1 : ℤ) - (Nat.card k + 1) ∧
      P.eval 1 = Divisor.classNumber hF := by
  sorry

end Zeta

/-! ### 5.6 Recovering the `L`-polynomial from `g` point counts -/

section LPolynomial

open Polynomial

/-- **`L`-polynomial data** (README 5.6) for `q`, `g` and counts `N`: constant term `1`, degree at
most `2g`, the reciprocal symmetry, and the first `g` Newton identities
`r a_r = Σ_{i=1}^{r} (N_i − q^i − 1) a_{r−i}`. -/
def IsLPolynomialData (q g : ℕ) (N : ℕ → ℤ) (P : Polynomial ℤ) : Prop :=
  P.coeff 0 = 1 ∧ P.natDegree ≤ 2 * g ∧
  (∀ j ≤ g, P.coeff (2 * g - j) = (q : ℤ) ^ (g - j) * P.coeff j) ∧
  ∀ r, 0 < r → r ≤ g →
    (r : ℤ) * P.coeff r =
      ∑ i ∈ Finset.range r, (N (i + 1) - (q : ℤ) ^ (i + 1) - 1) * P.coeff (r - 1 - i)

/-- **The first `g` point counts determine the `L`-polynomial** (README 5.6): for a function
field with finite exact constants and `P = L_F = (1 − T)(1 − qT) Z_F`, a polynomial satisfies the
`L`-polynomial data for `q = #k`, the genus and the point counts exactly when it is `L_F`. The
reverse direction says that `L_F` satisfies the Newton identities and the functional equation;
the forward direction is the uniqueness of polynomials with the same data. -/
theorem isLPolynomialData_iff_eq_lPolynomial {k F : Type*} [Field k] [Finite k] [Field F]
    [Algebra k F] (hF : IsFunctionField k F) (hk : IsIntegrallyClosedIn k F) (P : Polynomial ℤ)
    (hP : zeta k F * ((1 - PowerSeries.X) *
      (1 - PowerSeries.C (Nat.card k : ℤ) * PowerSeries.X)) = (P : PowerSeries ℤ))
    (P' : Polynomial ℤ) :
    IsLPolynomialData (Nat.card k) (genus k F) (fun r => pointCount k F r) P' ↔ P' = P := by
  sorry

end LPolynomial

/-! ### 5.8 Quantitative Chebotarev in each degree -/

section Chebotarev

/-- **Arithmetic Frobenius at a place** (README 5.8): `σ ∈ Gal(M/F)` preserves the valuation ring
`𝒪_P` of the place `P` of `M` and is an arithmetic Frobenius at its maximal ideal in Mathlib's
sense, `σ x ≡ x ^ #κ(v) (mod 𝔪_P)` for every `x ∈ 𝒪_P`, where `v` is the place of `F` below `P`.
Equivalently `TauCeti.Place.residueAut` sends `σ` to `x ↦ x ^ #κ(v)`; at a ramified place the
elements satisfying it form a coset of the inertia group. -/
def IsArithFrobAtPlace {k F M : Type*} [Field k] [Field F] [Field M] [Algebra k F]
    [Algebra k M] [Algebra F M] [IsScalarTower k F M] [FiniteDimensional F M]
    (σ : M ≃ₐ[F] M) (P : Place k M) : Prop :=
  ∃ h : σ ∈ P.integers.decompositionSubgroup F,
    IsArithFrobAt (P.restrict k F).integers
      (⟨σ, h⟩ : P.integers.decompositionSubgroup F) (IsLocalRing.maximalIdeal P.integers)

/-- **The degree-`r` Frobenius count** (README 5.8): the number of places `v` of `F` of degree `r`
at which every place of `M` above `v` is unramified and has an arithmetic Frobenius in the
conjugacy class `C`. This is ArithmeticGaloisRepresentations §5.13's `π_B(r)` for the cover
attached to `M/F` over its unramified locus, on the pinned place carriers. -/
noncomputable def frobeniusPlaceCount (k : Type*) {F M : Type*} [Field k] [Field F] [Field M]
    [Algebra k F] [Algebra k M] [Algebra F M] [IsScalarTower k F M] [FiniteDimensional F M]
    (C : ConjClasses (M ≃ₐ[F] M)) (r : ℕ) : ℕ :=
  Nat.card {v : Place k F // v.degree = r ∧ ∀ P : Place k M, P.restrict k F = v →
    P.ramificationIdx F = 1 ∧ ∃ σ ∈ C.carrier, IsArithFrobAtPlace σ P}

/-- **Degree-sensitive Chebotarev with an explicit error** (README 5.8; Kosters, Theorem 1.1 and
Corollary 1.2). Let `M/F` be a finite Galois extension of function fields over `k = 𝔽_q`, with
exact constants `k` for `F` and `k_M` for `M`, geometric subgroup `N = Gal(M/F k_M)` and a
conjugacy class `C` whose elements act on `k_M` by `x ↦ x ^ (q ^ r)` (a compatible degree; in
the others the count vanishes by ArithmeticGaloisRepresentations §5.13). Then
`|r π_C(r) − (|C|/|N|)(q^r + 1)| ≤ (2 g_M + r (1 + 2 g_X)) q^(r/2) + r + R`, with
`π_C(r) = frobeniusPlaceCount k C r`, `g_M` the genus of `M` over `k_M`, `g_X` the genus of `F`
over `k` and `R` the sum of the degrees of the places of `F` ramified in `M`. -/
theorem degree_sensitive_chebotarev {k F M : Type*} [Field k] [Finite k] [Field F] [Field M]
    [Algebra k F] [Algebra k M] [Algebra F M] [IsScalarTower k F M] [FiniteDimensional F M]
    [IsGalois F M] (hF : IsFunctionField k F) (hk : IsIntegrallyClosedIn k F)
    (hM : IsFunctionField k M) (C : ConjClasses (M ≃ₐ[F] M)) (r : ℕ) (hr : 0 < r)
    (hC : ∀ σ ∈ C.carrier, ∀ x ∈ algebraicClosure k M, σ x = x ^ (Nat.card k ^ r)) :
    |(r : ℝ) * frobeniusPlaceCount k C r -
        (Nat.card C.carrier / Nat.card {σ : M ≃ₐ[F] M //
          ∀ x ∈ algebraicClosure k M, σ x = x} : ℝ) * ((Nat.card k : ℝ) ^ r + 1)| ≤
      (2 * genus (algebraicClosure k M) M + r * (1 + 2 * genus k F)) *
          (Nat.card k : ℝ) ^ ((r : ℝ) / 2) + r +
        ∑ᶠ v ∈ {v : Place k F | ∃ P : Place k M, P.restrict k F = v ∧
          P.ramificationIdx F ≠ 1}, (v.degree : ℝ) := by
  sorry

end Chebotarev

end TauCetiRoadmap.FunctionFieldArithmetic
