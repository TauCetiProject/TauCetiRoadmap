import Mathlib
import TauCeti.Algebra.Lie.AdjointAction.Frobenius
import TauCeti.RingTheory.Derivation.Localization

set_option autoImplicit false

/-!
# p-curvature, Cartier descent and rank-one algebraic solutions: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The statements here suggest Lean forms for particular milestones, so that contributors and
reviewers converge on names and signatures; discharging all of them finishes neither a layer nor
the roadmap. Definitions have real bodies; only theorem statements are `sorry`.

**The connection carrier is not constructed here.** The ordinary connection
`Crystalline.Connection` and its operations belong to CrystallineCohomology CR.1.3, and the
evaluation of a connection on derivations, `Derivation R A A →ₗ[A] Module.End R M` with
`∇_D (a • m) = a • ∇_D m + D a • m`, belongs to FormalConnectionsOpers F2.1. Neither exists at
the pins, so `DerivationConnection` below records exactly the data of F2.1's evaluation, only so
that this file compiles; the implementation states every target on F2.1's evaluation of the
CR.1.3 carrier and introduces no second connection type.

Conventions (README §Conventions): `p` is a prime, `A` is a commutative `R`-algebra of
characteristic `p`, `pPow p D` is the `p`-th iterate of `D`, and the `p`-curvature is
`ψ(D) = (∇_D) ^ p - ∇_{D^p}`, as in Katz 1970, (5.0.4).
-/

namespace TauCetiRoadmap.PCurvature

open Polynomial

/-! ## Layer 0: restricted Lie algebras and the `p`-th power of a derivation -/

section Jacobson

variable (R : Type*) [CommRing R] (p : ℕ)

/-- **Layer 0.1.** Jacobson's Lie polynomial `Λ_p(x, y) = Σ_{0<i<p} s_i(x, y)` in the free Lie
algebra on `x = of 0` and `y = of 1`, where `i • s_i(x, y)` is the coefficient of `t ^ (i - 1)` in
`ad(t x + y) ^ (p - 1) (x)`: the sum runs over the words `z` of length `p - 1`, and the word with
`i - 1` letters `x` carries the natural-number representative of `i⁻¹` modulo `p` (it is `0` for
`i = p`, where `ad(x) ^ (p - 1) (x)` vanishes anyway). In a Lie algebra where `p = 0` the image
does not depend on the representatives. -/
noncomputable def jacobsonLie : FreeLieAlgebra R (Fin 2) :=
  ∑ z : Fin (p - 1) → Fin 2,
    (((((Finset.univ.filter fun j => z j = 0).card + 1 : ℕ) : ZMod p)⁻¹).val) •
      (List.ofFn z).foldr (fun i v => ⁅FreeLieAlgebra.of R i, v⁆) (FreeLieAlgebra.of R 0)

section Associative

attribute [local instance 100] LieRing.ofAssociativeRing

/-- **Layer 0.1. Jacobson's formula** (Jacobson 1937; Katz 1970, (5.2.4)–(5.2.5)): in an
associative algebra of characteristic `p`, `(a + b) ^ p = a ^ p + b ^ p + Λ_p(a, b)`. -/
theorem add_pow_eq_jacobson [Fact p.Prime] {A : Type*} [Ring A] [Algebra R A] [CharP A p]
    (a b : A) :
    (a + b) ^ p = a ^ p + b ^ p + FreeLieAlgebra.lift R ![a, b] (jacobsonLie R p) := by
  sorry

end Associative

end Jacobson

/-- **Layer 0.2.** A restricted Lie algebra in Jacobson's sense: a `p`-map that is `p`-homogeneous,
is compatible with the adjoint action, and satisfies Jacobson's formula. -/
class RestrictedLieAlgebra (R L : Type*) [CommRing R] [LieRing L] [LieAlgebra R L] (p : ℕ) where
  /-- The `p`-map `x ↦ x^[p]`. -/
  pMap : L → L
  pMap_smul (c : R) (x : L) : pMap (c • x) = c ^ p • pMap x
  ad_pMap (x : L) : LieAlgebra.ad R L (pMap x) = LieAlgebra.ad R L x ^ p
  pMap_add (x y : L) :
    pMap (x + y) = pMap x + pMap y + FreeLieAlgebra.lift R ![x, y] (jacobsonLie R p)

section Associative

attribute [local instance 100] LieRing.ofAssociativeRing

/-- **Layer 0.2.** An associative algebra of characteristic `p` is a restricted Lie algebra with
`a ↦ a ^ p`; `ad (a ^ p) = (ad a) ^ p` is Tau Ceti's `TauCeti.LieAlgebra.ad_pow_expChar_pow`.
A definition, not an instance, because the commutator Lie ring is only a local instance. -/
@[instance_reducible]
noncomputable def RestrictedLieAlgebra.ofAssociative (R A : Type*) [CommRing R] [Ring A]
    [Algebra R A] (p : ℕ) [Fact p.Prime] [CharP A p] : RestrictedLieAlgebra R A p where
  pMap a := a ^ p
  pMap_smul c a := smul_pow c a p
  ad_pMap a := by
    have : ExpChar A p := ExpChar.prime Fact.out
    simpa using TauCeti.LieAlgebra.ad_pow_expChar_pow (R := R) p a 1
  pMap_add a b := add_pow_eq_jacobson R p a b

end Associative

/-- **Layer 0.2.** Morphisms of restricted Lie algebras. -/
structure RestrictedLieHom (R L L' : Type*) [CommRing R] [LieRing L] [LieAlgebra R L]
    [LieRing L'] [LieAlgebra R L'] (p : ℕ) [RestrictedLieAlgebra R L p]
    [RestrictedLieAlgebra R L' p] extends L →ₗ⁅R⁆ L' where
  map_pMap (x : L) :
    toFun (RestrictedLieAlgebra.pMap R p x) = RestrictedLieAlgebra.pMap R p (toFun x)

section Derivations

variable {R A : Type*} [CommRing R] [CommRing A] [Algebra R A]
  (p : ℕ) [Fact p.Prime] [CharP A p]

/-- **Layer 0.3** (Katz 1970, (5.0)). In characteristic `p` the `p`-th iterate of a derivation
satisfies the Leibniz rule. -/
theorem iterate_leibniz (D : Derivation R A A) (a b : A) :
    D^[p] (a * b) = a * D^[p] b + b * D^[p] a := by
  sorry

/-- **Layer 0.3.** The `p`-th power `D^[p]` of a derivation, as a derivation. -/
noncomputable def pPow (D : Derivation R A A) : Derivation R A A :=
  Derivation.mk' ((D : Module.End R A) ^ p) fun a b => by
    simp only [Module.End.pow_apply, Derivation.coeFn_coe, smul_eq_mul]
    exact iterate_leibniz p D a b

theorem pPow_apply (D : Derivation R A A) (a : A) : pPow p D a = D^[p] a := by
  simp [pPow, Module.End.pow_apply]

/-- **Layer 0.3.** Scalars of `R` commute with derivations, so `(c • D) ^ p = c ^ p • D ^ p`. -/
theorem pPow_smul_const (c : R) (D : Derivation R A A) : pPow p (c • D) = c ^ p • pPow p D := by
  sorry

/-- **Layer 0.3** (Hochschild's formula; Katz 1970, Proposition 5.3, Deligne). For `a : A`,
`(a D) ^ p = a ^ p D ^ p + (a D)^{p-1}(a) D`. -/
theorem pPow_smul (a : A) (D : Derivation R A A) :
    pPow p (a • D) = a ^ p • pPow p D + ((⇑(a • D))^[p - 1] a) • D := by
  sorry

/-- **Layer 0.3.** `ad (D ^ p) = (ad D) ^ p` on derivations. -/
theorem ad_pPow (D : Derivation R A A) :
    LieAlgebra.ad R (Derivation R A A) (pPow p D) = LieAlgebra.ad R (Derivation R A A) D ^ p := by
  sorry

/-- **Layer 0.3.** Jacobson's formula for the `p`-th power of a sum of derivations. -/
theorem pPow_add (D E : Derivation R A A) :
    pPow p (D + E) =
      pPow p D + pPow p E + FreeLieAlgebra.lift R ![D, E] (jacobsonLie R p) := by
  sorry

/-- **Layer 0.3.** Derivations of a commutative algebra of characteristic `p` form a restricted
Lie algebra (Katz 1970, (5.0)). -/
noncomputable instance : RestrictedLieAlgebra R (Derivation R A A) p where
  pMap := pPow p
  pMap_smul := pPow_smul_const p
  ad_pMap := ad_pPow p
  pMap_add := pPow_add p

end Derivations

/-! ## Layer 1: the `p`-curvature -/

section Connections

variable {R A M : Type*} [CommRing R] [CommRing A] [Algebra R A]
  [AddCommGroup M] [Module A M] [Module R M] [IsScalarTower R A M]

/-- Stand-in for FormalConnectionsOpers F2.1: the evaluation of a connection on derivations. Not
a carrier of this roadmap (see the module docstring). -/
structure DerivationConnection (R A M : Type*) [CommRing R] [CommRing A] [Algebra R A]
    [AddCommGroup M] [Module A M] [Module R M] [IsScalarTower R A M] where
  /-- `D ↦ ∇_D`. -/
  toLinearMap : Derivation R A A →ₗ[A] Module.End R M
  leibniz (D : Derivation R A A) (a : A) (m : M) :
    toLinearMap D (a • m) = a • toLinearMap D m + D a • m

namespace DerivationConnection

/-- Flatness in the vector-field form `∇_{[D, E]} = [∇_D, ∇_E]` (FormalConnectionsOpers F2.3,
which compares it with zero curvature when `Ω¹_{A/R}` is finite projective). -/
def IsFlat (nabla : DerivationConnection R A M) : Prop :=
  ∀ D E : Derivation R A A, nabla.toLinearMap ⁅D, E⁆ =
    nabla.toLinearMap D * nabla.toLinearMap E - nabla.toLinearMap E * nabla.toLinearMap D

/-- The horizontal sections, as an `R`-submodule. -/
def horizontal (nabla : DerivationConnection R A M) : Submodule R M where
  carrier := {m | ∀ D : Derivation R A A, nabla.toLinearMap D m = 0}
  add_mem' hm hn D := by simp [hm D, hn D]
  zero_mem' D := by simp
  smul_mem' c m hm D := by simp [hm D]

end DerivationConnection

variable (p : ℕ) [Fact p.Prime] [CharP A p]

/-- **Layer 1.1** (Katz 1970, (5.0.4)). The `p`-curvature `ψ(D) = (∇_D) ^ p - ∇_{D^p}`. -/
noncomputable def pCurvature (nabla : DerivationConnection R A M) (D : Derivation R A A) :
    Module.End R M :=
  nabla.toLinearMap D ^ p - nabla.toLinearMap (pPow p D)

/-- **Layer 1.1** (Katz 1970, (5.0.9)). `ψ(D)` is `A`-linear, for every connection. -/
theorem pCurvature_smul_apply (nabla : DerivationConnection R A M) (D : Derivation R A A)
    (a : A) (m : M) : pCurvature p nabla D (a • m) = a • pCurvature p nabla D m := by
  sorry

/-- **Layer 1.2** (Katz 1970, (5.2.0) and (5.4)). `ψ` is `p`-linear in `D`:
`ψ(a D) = a ^ p ψ(D)`, for every connection. -/
theorem pCurvature_smul (nabla : DerivationConnection R A M) (a : A) (D : Derivation R A A) :
    pCurvature p nabla (a • D) = a ^ p • pCurvature p nabla D := by
  sorry

/-- **Layer 1.2** (Katz 1970, (5.2.0), (5.2.6)–(5.2.8)). For a flat connection `ψ` is additive. -/
theorem pCurvature_add (nabla : DerivationConnection R A M) (hnabla : nabla.IsFlat)
    (D E : Derivation R A A) :
    pCurvature p nabla (D + E) = pCurvature p nabla D + pCurvature p nabla E := by
  sorry

/-- **Layer 1.2** (Katz 1970, (5.2.1)). For a flat connection, `∇_D`, `∇_{D^p}` and `ψ(D)`
commute. -/
theorem commute_pCurvature (nabla : DerivationConnection R A M) (hnabla : nabla.IsFlat)
    (D : Derivation R A A) :
    Commute (nabla.toLinearMap D) (pCurvature p nabla D) ∧
      Commute (nabla.toLinearMap (pPow p D)) (pCurvature p nabla D) := by
  sorry

/-- **Layer 1.2** (Katz 1970, (5.2.2)–(5.2.3)). With coordinates `s` (`Ω¹_{A/R}` free on the
`d s i`) and a flat connection, the `ψ(D)` commute with each other and with every `∇_E`. -/
theorem commute_pCurvature_of_basis {ι : Type*} (s : ι → A)
    (b : Module.Basis ι A (Ω[A⁄R])) (hb : ∀ i, b i = KaehlerDifferential.D R A (s i))
    (nabla : DerivationConnection R A M) (hnabla : nabla.IsFlat) (D E : Derivation R A A) :
    Commute (pCurvature p nabla D) (pCurvature p nabla E) ∧
      Commute (nabla.toLinearMap E) (pCurvature p nabla D) := by
  sorry

/-- **Layer 1.3.** A horizontal `A`-linear map intertwines the `p`-curvatures. -/
theorem pCurvature_comp_of_horizontal {N : Type*} [AddCommGroup N] [Module A N] [Module R N]
    [IsScalarTower R A N] (nabla : DerivationConnection R A M)
    (nabla' : DerivationConnection R A N) (f : M →ₗ[A] N)
    (hf : ∀ (D : Derivation R A A) (m : M), f (nabla.toLinearMap D m) =
      nabla'.toLinearMap D (f m)) (D : Derivation R A A) (m : M) :
    f (pCurvature p nabla D m) = pCurvature p nabla' D (f m) := by
  sorry

/-- **Layer 1.3** (the easy direction, locally). A basis of horizontal sections forces `ψ = 0`. -/
theorem pCurvature_eq_zero_of_basis {ι : Type*} (nabla : DerivationConnection R A M)
    (b : Module.Basis ι A M) (hb : ∀ i, b i ∈ nabla.horizontal) (D : Derivation R A A) :
    pCurvature p nabla D = 0 := by
  sorry

/-- **Layer 1.4.** The connection `∇_D = D + ω(D)` on `A` attached to a form
`ω : Der_R(A) →ₗ[A] A`. -/
noncomputable def ofForm (ω : Derivation R A A →ₗ[A] A) : DerivationConnection R A A where
  toLinearMap :=
    { toFun := fun D => (D : Module.End R A) + LinearMap.mulLeft R (ω D)
      map_add' := fun D E => by ext x; simp [add_mul]; ring
      map_smul' := fun a D => by ext x; simp }
  leibniz D a m := by simp [Derivation.leibniz, smul_eq_mul]; ring

/-- **Layer 1.4** (Jacobson's formula in rank one; Katz 1970, (5.0.4)). The `p`-curvature of
`d + ω` is multiplication by `ω(D) ^ p + D^{p-1}(ω(D)) - ω(D^p)`. -/
theorem pCurvature_ofForm (ω : Derivation R A A →ₗ[A] A) (D : Derivation R A A) :
    pCurvature p (ofForm ω) D =
      LinearMap.mulLeft R (ω D ^ p + D^[p - 1] (ω D) - ω (pPow p D)) := by
  sorry

/-- **Layer 1.5** (Katz 1970, (5.6)). Nilpotence of exponent `≤ n`: every product of `n`
values of `ψ` vanishes (condition (5.5.1)). -/
def IsNilpotentPCurvature (nabla : DerivationConnection R A M) (n : ℕ) : Prop :=
  ∀ D : Fin n → Derivation R A A, (List.ofFn fun i => pCurvature p nabla (D i)).prod = 0

end Connections

/-! ## Layer 2: Cartier descent -/

section Cartier

variable (R A : Type*) [CommRing R] [CommRing A] [Algebra R A] (p : ℕ)

/-- The image of the relative Frobenius `A ⊗_{R, Frob} R → A`, `a ⊗ r ↦ r a ^ p`: the
`R`-subalgebra generated by the `p`-th powers. -/
def frobeniusImage : Subalgebra R A :=
  Algebra.adjoin R (Set.range fun a : A => a ^ p)

variable {R A} [Fact p.Prime] [CharP A p]

/-- **Layer 2.0.** Every derivation vanishes on `frobeniusImage R A p`. -/
theorem apply_eq_zero_of_mem_frobeniusImage (D : Derivation R A A) {a : A}
    (ha : a ∈ frobeniusImage R A p) : D a = 0 := by
  sorry

/-- **Layer 2.0.** For `A` smooth over a ring `R` of characteristic `p`, the relative Frobenius of
SchemeAndStackFoundations §0.29 identifies the Frobenius twist with `frobeniusImage R A p`, and
the kernel of `d : A → Ω¹_{A/R}` is `frobeniusImage R A p` (degree `0` of the Cartier
isomorphism, DerivedDeRhamCohomology §3.6). -/
theorem kaehlerD_eq_zero_iff [CharP R p] [Algebra.Smooth R A] (a : A) :
    KaehlerDifferential.D R A a = 0 ↔ a ∈ frobeniusImage R A p := by
  sorry

variable {M : Type*} [AddCommGroup M] [Module A M] [Module R M] [IsScalarTower R A M]

/-- The horizontal sections of a connection, as a module over `frobeniusImage R A p`. -/
def horizontalFrob (nabla : DerivationConnection R A M) : Submodule (frobeniusImage R A p) M where
  carrier := {m | ∀ D : Derivation R A A, nabla.toLinearMap D m = 0}
  add_mem' hm hn D := by simp [hm D, hn D]
  zero_mem' D := by simp
  smul_mem' c m hm D := by
    change nabla.toLinearMap D ((c : A) • m) = 0
    rw [nabla.leibniz, hm D, apply_eq_zero_of_mem_frobeniusImage p D c.2]
    simp

/-- **Layer 2.1. Cartier descent** (Katz 1970, Theorem 5.1). For `A` smooth over a ring of
characteristic `p` and a flat connection of `p`-curvature zero, the horizontal sections span
`M` without relations: `A ⊗_{A'} M^∇ → M` is bijective, `A' = frobeniusImage R A p`. -/
theorem cartier_descent [CharP R p] [Algebra.Smooth R A] (nabla : DerivationConnection R A M)
    (hnabla : nabla.IsFlat) (hψ : ∀ D, pCurvature p nabla D = 0) :
    Function.Bijective (LinearMap.liftBaseChange A (horizontalFrob p nabla).subtype) := by
  sorry

/-- **Layer 2.3** (Cartier in rank one and one variable). Over a local ring of characteristic
`p`, with a derivation `D` such that `D ^ p = 0` and an `x` with `D x = 1`, the connection
`D + a` has a horizontal unit if and only if its `p`-curvature `a ^ p + D^{p-1}(a)` vanishes. -/
theorem exists_unit_horizontal_iff [IsLocalRing A] (D : Derivation R A A)
    (hD : ∀ y, D^[p] y = 0) (x : A) (hx : D x = 1) (a : A) :
    (∃ y : Aˣ, D y + a * y = 0) ↔ a ^ p + D^[p - 1] a = 0 := by
  sorry

end Cartier

/-! ## Layer 4: rank one over a number field -/

section RankOne

/-- The derivation `d/dx` of `K(x)`, extended from `K[x]` by Tau Ceti's
`Derivation.extendOfIsLocalization`. -/
noncomputable def ratFuncD (K : Type*) [Field K] : Derivation K (RatFunc K) (RatFunc K) :=
  Derivation.extendOfIsLocalization (nonZeroDivisors K[X])
    ((Algebra.linearMap K[X] (RatFunc K)).compDer (Polynomial.derivative' (R := K)))

/-- The rank-one `p`-curvature `a ^ p + a^{(p-1)}` of `d/dx + a` on `κ(x)`, `p = char κ`. -/
noncomputable def ratFuncPCurvature {κ : Type*} [Field κ] (a : RatFunc κ) : RatFunc κ :=
  a ^ ringChar κ + (ratFuncD κ)^[ringChar κ - 1] a

open NumberField IsDedekindDomain

/-- **Layer 4.1** (Kronecker's theorem, from Chebotarev). An algebraic integer whose reduction
lies in the prime field at almost every prime is a rational integer. -/
theorem exists_intCast_eq_of_forall_pow_sub_mem (L : Type*) [Field L] [NumberField L] (c : 𝓞 L)
    (h : ∀ᶠ P in (Filter.cofinite : Filter (HeightOneSpectrum (𝓞 L))),
      c ^ ringChar (𝓞 L ⧸ P.asIdeal) - c ∈ P.asIdeal) :
    ∃ n : ℤ, c = n := by
  sorry

variable (K : Type*) [Field K] [NumberField K]

/-- The rational function `P / Q` over `K`, for `P Q : (𝓞 K)[X]`. -/
noncomputable def ratFuncOfInt (P Q : (𝓞 K)[X]) : RatFunc K :=
  algebraMap K[X] (RatFunc K) (P.map (algebraMap (𝓞 K) K)) /
    algebraMap K[X] (RatFunc K) (Q.map (algebraMap (𝓞 K) K))

/-- The reduction of `P / Q` at a prime `𝔭` of `𝓞 K`, in `κ(𝔭)(x)`. -/
noncomputable def ratFuncMod (P Q : (𝓞 K)[X]) (v : HeightOneSpectrum (𝓞 K)) :
    RatFunc (v.asIdeal.ResidueField) :=
  algebraMap _ (RatFunc _) (P.map (algebraMap (𝓞 K) v.asIdeal.ResidueField)) /
    algebraMap _ (RatFunc _) (Q.map (algebraMap (𝓞 K) v.asIdeal.ResidueField))

/-- **Layer 4.3. Honda's theorem over a number field** (Honda 1981, §1, over `ℚ`; Chudnovsky
1985, Theorem 8.1, for rank one over curves). The connection `d + a dx`, `a = P / Q ∈ K(x)`, has
vanishing `p`-curvature at almost every prime of `K` if and only if `n a` is a logarithmic
derivative `f' / f` for some `n ≥ 1`. -/
theorem honda (P Q : (𝓞 K)[X]) (hQ : Q ≠ 0) :
    (∀ᶠ v in (Filter.cofinite : Filter (HeightOneSpectrum (𝓞 K))),
      ratFuncPCurvature (ratFuncMod K P Q v) = 0) ↔
    ∃ (n : ℕ) (f : RatFunc K), 0 < n ∧ f ≠ 0 ∧
      (n : RatFunc K) * ratFuncOfInt K P Q = ratFuncD K f / f := by
  sorry

end RankOne

end TauCetiRoadmap.PCurvature
