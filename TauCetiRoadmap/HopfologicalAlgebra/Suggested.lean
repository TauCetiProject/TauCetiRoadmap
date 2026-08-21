-- This file contains suggested target signatures only.  The roadmap in README.md is definitive;
-- these declarations are deliberately non-exhaustive, and proving them does not finish the roadmap.
import Mathlib.LinearAlgebra.Dual.Basis
import Mathlib.LinearAlgebra.Dual.Lemmas
import Mathlib.Algebra.Module.Injective
import Mathlib.Algebra.DirectSum.Basic
import Mathlib.Algebra.DirectSum.Decomposition
import Mathlib.CategoryTheory.Preadditive.Yoneda.Basic
import Mathlib.CategoryTheory.Limits.Preserves.Shapes.Products
import Mathlib.RingTheory.Bialgebra.GroupLike
import Mathlib.RingTheory.HopfAlgebra.Convolution
import Mathlib.RingTheory.Polynomial.Cyclotomic.Basic
import TauCeti.Algebra.Bialgebra.Primitive
import TauCeti.Algebra.Bialgebra.Quotient
import TauCeti.Algebra.Coalgebra.Comodule.Basic
import TauCeti.Algebra.HopfAlgebra.Antipode

open TauCeti
open CategoryTheory CategoryTheory.Limits
open scoped Coalgebra DirectSum TensorProduct

namespace TauCetiRoadmap.HopfologicalAlgebra

universe u v w x y

/-! ## Integrals and the finite-Hopf/Frobenius bridge -/

section Integrals

variable (k : Type u) (H : Type v) [Field k] [Ring H] [HopfAlgebra k H]

/-- The convention used throughout the roadmap: a left integral satisfies
`h * Λ = ε(h) Λ`. -/
def LeftIntegral : Submodule k H where
  carrier := {Λ | ∀ h : H, h * Λ = Coalgebra.counit (R := k) h • Λ}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

/-- Right integrals use the mirror convention. -/
def RightIntegral : Submodule k H where
  carrier := {Λ | ∀ h : H, Λ * h = Coalgebra.counit (R := k) h • Λ}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

@[simp] theorem mem_leftIntegral_iff (Λ : H) :
    Λ ∈ LeftIntegral k H ↔
      ∀ h : H, h * Λ = Coalgebra.counit (R := k) h • Λ :=
  by sorry

@[simp] theorem mem_rightIntegral_iff (Λ : H) :
    Λ ∈ RightIntegral k H ↔
      ∀ h : H, Λ * h = Coalgebra.counit (R := k) h • Λ :=
  by sorry

/-- Larson--Sweedler: the space of left integrals of a nonzero finite-dimensional Hopf
algebra over a field is one-dimensional. The right-integral theorem is a separate target. -/
theorem finrank_leftIntegral [FiniteDimensional k H] [Nontrivial H] :
    Module.finrank k (LeftIntegral k H) = 1 := by
  sorry

/-- A right cointegral is the elementwise form of a right integral in the finite dual. -/
def IsRightCointegral (phi : Module.Dual k H) : Prop :=
  ∀ h : H, ∑ i ∈ (ℛ k h).index,
    phi ((ℛ k h).left i) • (ℛ k h).right i = phi h • (1 : H)

/-- The multiplication pairing associated to a linear functional. -/
def mulPairing (phi : Module.Dual k H) : H →ₗ[k] Module.Dual k H :=
  LinearMap.mk₂ k (fun x y => phi (x * y))
    (fun x₁ x₂ y => by simp [add_mul])
    (fun r x y => by simp)
    (fun x y₁ y₂ => by simp [mul_add])
    (fun r x y => by simp)

/-- A nonzero cointegral gives the Frobenius functional. This target asks for the actual
nondegeneracy map, not a field named `isFrobenius`. -/
theorem cointegral_mulPairing_bijective [FiniteDimensional k H]
    (phi : Module.Dual k H) (hphi : IsRightCointegral k H phi) (hphi0 : phi ≠ 0) :
    Function.Bijective (mulPairing k H phi) := by
  sorry

/-- The finite-dimensional antipode is bijective. Infinite-dimensional uses must instead
carry bijectivity as a hypothesis. -/
theorem antipode_bijective [FiniteDimensional k H] :
    Function.Bijective (HopfAlgebra.antipode k (A := H)) := by
  sorry

/-- Handed Nakayama data for a chosen right cointegral `phi`.  Our defining convention is
`phi (x*y) = phi (nu y*x)`.  If `Λ` is a left integral and
`Λ*h = alpha(h)Λ`, then `nu(h)=Σ alpha(h₁)S²(h₂)`; the second displayed formula records the
equivalent `S⁻²` expression involving the distinguished group-like element. -/
structure NakayamaData [FiniteDimensional k H] where
  phi : Module.Dual k H
  phi_cointegral : IsRightCointegral k H phi
  phi_ne_zero : phi ≠ 0
  integral : LeftIntegral k H
  integral_normalized : phi (integral : H) = 1
  alpha : H →ₐ[k] k
  modular_equation : ∀ h, (integral : H) * h = alpha h • (integral : H)
  invAntipode : H →ₗ[k] H
  invAntipode_left : invAntipode.comp (HopfAlgebra.antipode k) = LinearMap.id
  invAntipode_right : (HopfAlgebra.antipode k).comp invAntipode = LinearMap.id
  distinguished : Hˣ
  distinguished_groupLike : IsGroupLikeElem k (distinguished : H)
  distinguished_equation : ∀ h,
    ∑ i ∈ (ℛ k h).index,
      phi ((ℛ k h).right i) • (ℛ k h).left i =
        phi h • (↑(distinguished⁻¹) : H)
  nakayama : H ≃ₐ[k] H
  defining_equation : ∀ x y, phi (x * y) = phi (nakayama y * x)
  winding_S_sq : ∀ h, nakayama h =
    ∑ i ∈ (ℛ k h).index,
      alpha ((ℛ k h).left i) •
        HopfAlgebra.antipode k (HopfAlgebra.antipode k ((ℛ k h).right i))
  winding_S_inv_sq : ∀ h, nakayama h =
    (↑(distinguished⁻¹) : H) *
      (∑ i ∈ (ℛ k h).index,
        alpha ((ℛ k h).right i) •
          invAntipode (invAntipode ((ℛ k h).left i))) *
      (distinguished : H)

/-- The stable/Frobenius prerequisite uses the opposite handed convention
`phi (a*b) = phi (b*nuStable a)`.  For the Hopf convention above its automorphism is
therefore the inverse, not the same map. -/
noncomputable def NakayamaData.stableNakayama [FiniteDimensional k H]
    (N : NakayamaData k H) : H ≃ₐ[k] H :=
  N.nakayama.symm

theorem NakayamaData.stableNakayama_defining_equation [FiniteDimensional k H]
    (N : NakayamaData k H) (a b : H) :
    N.phi (a * b) = N.phi (b * NakayamaData.stableNakayama k H N a) := by
  simpa [NakayamaData.stableNakayama] using
    (N.defining_equation b (N.nakayama.symm a)).symm

/-- Orientation bridge consumed by the stable-category dependency:
`nuHopf = nuStable⁻¹`.  Uniqueness follows from nondegeneracy of the multiplication pairing. -/
theorem NakayamaData.hopfNakayama_eq_stableNakayama_symm [FiniteDimensional k H]
    (N : NakayamaData k H) :
    N.nakayama = (NakayamaData.stableNakayama k H N).symm := by
  rfl

/-- Nondegeneracy makes the stable handed automorphism unique, so the inverse relation above
is mathematical content rather than a naming convention. -/
theorem NakayamaData.stableNakayama_unique [FiniteDimensional k H]
    (N : NakayamaData k H) (sigma : H ≃ₐ[k] H)
    (hsigma : ∀ a b, N.phi (a * b) = N.phi (b * sigma a)) :
    sigma = NakayamaData.stableNakayama k H N := by
  sorry

/-- A concrete symmetric-Frobenius condition: a nondegenerate multiplication functional
which is a trace. -/
def IsSymmetricFrobenius : Prop :=
  ∃ phi : Module.Dual k H,
    Function.Bijective (mulPairing k H phi) ∧ ∀ x y, phi (x * y) = phi (y * x)

/-- Unimodularity means that the one-dimensional left and right integral subspaces agree. -/
def IsUnimodular : Prop := LeftIntegral k H = RightIntegral k H

/-- `S²` is inner with the handed conjugation convention shown here. -/
def AntipodeSquareIsInner : Prop :=
  ∃ u : Hˣ, ∀ h,
    HopfAlgebra.antipode k (HopfAlgebra.antipode k h) =
      (u : H) * h * (↑(u⁻¹) : H)

/-- The exact finite-dimensional criterion: a Hopf algebra is symmetric iff it is
unimodular and its antipode square is inner. -/
theorem symmetric_iff_unimodular_and_antipodeSquare_inner
    [FiniteDimensional k H] [Nontrivial H] :
    IsSymmetricFrobenius k H ↔ IsUnimodular k H ∧ AntipodeSquareIsInner k H := by
  sorry

end Integrals

/-! ## Left module algebras and the left smash-product convention -/

section ModuleAlgebra

variable (k : Type u) (H : Type v) (A : Type w)
variable [Field k] [Ring H] [HopfAlgebra k H] [Ring A] [Algebra k A]

/-- A left action of an algebra `H` on a `k`-module. It is kept explicit here because the
Hopf-module API is one of the targets of the roadmap. -/
structure LeftAction (M : Type x) [AddCommGroup M] [Module k M] where
  act : H →ₗ[k] M →ₗ[k] M
  one_act : ∀ m, act 1 m = m
  mul_act : ∀ h l m, act (h * l) m = act h (act l m)

/-- Our primary convention is a **left** `H`-module algebra. The coproduct equation is
stated using Mathlib's finite `Coalgebra.Repr`, so it is a literal Sweedler-sum equation. -/
structure LeftModuleAlgebra extends LeftAction k H A where
  act_one : ∀ h, act h 1 = algebraMap k A (Coalgebra.counit h)
  act_mul : ∀ h a b,
    act h (a * b) =
      ∑ i ∈ (ℛ k h).index, act ((ℛ k h).left i) a * act ((ℛ k h).right i) b

namespace LeftModuleAlgebra

variable {k H A}

/-- The pinned left smash-product formula
`(a # h)(b # l) = Σ a (h₁ · b) # h₂ l`, on pure tensors. -/
noncomputable def smashMulPure (X : LeftModuleAlgebra k H A)
    (a b : A) (h l : H) : A ⊗[k] H :=
  ∑ i ∈ (ℛ k h).index,
    (a * X.act ((ℛ k h).left i) b) ⊗ₜ[k] ((ℛ k h).right i * l)

/-- The unit convention for `A # H` is `1 # 1`. -/
def smashOne : A ⊗[k] H := 1 ⊗ₜ[k] 1

theorem smashMulPure_one_left (X : LeftModuleAlgebra k H A) (a : A) (h : H) :
    X.smashMulPure 1 a 1 h = a ⊗ₜ[k] h := by
  sorry

theorem smashMulPure_one_right (X : LeftModuleAlgebra k H A) (a : A) (h : H) :
    X.smashMulPure a 1 h 1 = a ⊗ₜ[k] h := by
  sorry

/-- A bundled left smash product.  The carrier is linearly equivalent to `A ⊗ H`, while its
ring multiplication is part of the object and is pinned by `mul_pure`.  In particular this
cannot be inhabited merely by choosing the tensor-product algebra and forgetting `X`. -/
structure SmashProduct (X : LeftModuleAlgebra k H A) where
  Carrier : Type max v w
  [instRing : Ring Carrier]
  [instAlgebra : Algebra k Carrier]
  carrierEquiv : Carrier ≃ₗ[k] A ⊗[k] H
  pure : A → H → Carrier
  pure_equiv : ∀ a h, carrierEquiv (pure a h) = a ⊗ₜ[k] h
  one_eq : (1 : Carrier) = pure 1 1
  mul_pure : ∀ a b h l,
    pure a h * pure b l = carrierEquiv.symm (X.smashMulPure a b h l)
  includeA : A →ₐ[k] Carrier
  includeH : H →ₐ[k] Carrier
  includeA_apply : ∀ a, includeA a = pure a 1
  includeH_apply : ∀ h, includeH h = pure 1 h
  pure_eq_embeddings : ∀ a h, pure a h = includeA a * includeH h
  pure_span :
    Submodule.span k (Set.range fun z : A × H => pure z.1 z.2) = ⊤

attribute [instance] SmashProduct.instRing SmashProduct.instAlgebra

/-- The construction target: extend the pure formula bilinearly, prove associativity from the
module-algebra axioms and package the resulting `k`-algebra. -/
noncomputable def smashProduct (X : LeftModuleAlgebra k H A) : SmashProduct X := by
  sorry

/-- The bundled ring really supplies associativity, not just a proposed multiplication. -/
theorem SmashProduct.pure_mul_assoc {X : LeftModuleAlgebra k H A}
    (S : SmashProduct X) (a b c : A) (h l r : H) :
    (S.pure a h * S.pure b l) * S.pure c r =
      S.pure a h * (S.pure b l * S.pure c r) := by
  exact mul_assoc _ _ _

/-- The covariance relation which characterizes maps out of the left smash product. -/
def SmashCompatible {X : LeftModuleAlgebra k H A} {C : Type x}
    [Ring C] [Algebra k C] (fA : A →ₐ[k] C) (fH : H →ₐ[k] C) : Prop :=
  ∀ h a, fH h * fA a =
    ∑ i ∈ (ℛ k h).index,
      fA (X.act ((ℛ k h).left i) a) * fH ((ℛ k h).right i)

/-- Universal property target for the algebra constructed above. -/
theorem SmashProduct.lift_unique {X : LeftModuleAlgebra k H A}
    (S : SmashProduct X) {C : Type x} [Ring C] [Algebra k C]
    (fA : A →ₐ[k] C) (fH : H →ₐ[k] C)
    (hcompat : SmashCompatible (X := X) fA fH) :
    ∃! f : S.Carrier →ₐ[k] C,
      (∀ a, f (S.includeA a) = fA a) ∧ (∀ h, f (S.includeH h) = fH h) := by
  sorry

end LeftModuleAlgebra

end ModuleAlgebra

/-! ## Right comodule algebras and the finite-dual bridge -/

section ComoduleAlgebra

variable (k : Type u) (C : Type v) (A : Type w)
variable [Field k] [Ring C] [Bialgebra k C] [Ring A] [Algebra k A]
variable [TauCeti.Comodule k C A]

/-- Tau Ceti's comodules are right comodules, `ρ : A → A ⊗ C`. The multiplication
below is the tensor-product algebra multiplication supplied by the `Algebra k A` and
`Bialgebra k C` instances; constructing and stabilizing that instance is an explicit roadmap
target before this predicate becomes public API. -/
structure RightComoduleAlgebra : Prop where
  coact_one : TauCeti.Comodule.coact (R := k) (C := C) (M := A) 1 = 1 ⊗ₜ[k] 1
  coact_mul : ∀ a b,
    TauCeti.Comodule.coact (R := k) (C := C) (M := A) (a * b) =
      TauCeti.Comodule.coact a * TauCeti.Comodule.coact b

variable {k C A}

end ComoduleAlgebra

section FiniteDual

variable {k : Type u} {H : Type v} {A : Type w}
variable [Field k] [Ring H] [HopfAlgebra k H] [FiniteDimensional k H]
variable [Ring A] [Algebra k A]

/-- With a finite basis `e`, a left `H`-action gives the right `H*`-coaction
`a ↦ Σ (eᵢ · a) ⊗ eᵢ*`. This is the finite-dual bridge; it is not asserted without finite
projectivity/finite-dimensionality. -/
noncomputable def coactionFromFiniteDual {ι : Type*} [Fintype ι] [DecidableEq ι]
    (e : Module.Basis ι k H) (X : LeftModuleAlgebra k H A) (a : A) :
    A ⊗[k] Module.Dual k H :=
  ∑ i, X.act (e i) a ⊗ₜ[k] e.dualBasis i

theorem coactionFromFiniteDual_independent_of_basis
    {ι ι' : Type*} [Fintype ι] [DecidableEq ι] [Fintype ι'] [DecidableEq ι']
    (e : Module.Basis ι k H) (e' : Module.Basis ι' k H)
    (X : LeftModuleAlgebra k H A) (a : A) :
    coactionFromFiniteDual e X a = coactionFromFiniteDual e' X a := by
  sorry

end FiniteDual

/-! ## Concrete equations for the sign-sensitive examples -/

section PrimitiveObstruction

variable {k : Type u} {H : Type v}
variable [Field k] [Ring H] [Bialgebra k H]

/-- The roadmap reuses Tau Ceti's binomial coproduct theorem rather than rebuilding it. -/
theorem primitive_square_coproduct_binomial (d : H)
    (hprim : Coalgebra.comul d = d ⊗ₜ[k] 1 + 1 ⊗ₜ[k] d) :
    Coalgebra.comul (d ^ 2) =
      ∑ mn ∈ Finset.antidiagonal 2, (2 : ℕ).choose mn.1 •
        ((d ^ mn.1) ⊗ₜ[k] (d ^ mn.2)) :=
  TauCeti.Bialgebra.comul_pow_of_primitive d hprim 2

/-- In an ordinary tensor product, a square-zero primitive element forces the middle term
`2(d ⊗ d)` to vanish. This is the signature-level obstruction to making `k[d]/(d²)` an
ordinary characteristic-zero Hopf algebra with primitive `d`. -/
theorem primitive_square_zero_forces_two_tmul (d : H)
    (hprim : Coalgebra.comul d = d ⊗ₜ[k] 1 + 1 ⊗ₜ[k] d)
    (hsq : d ^ 2 = 0) :
    (2 : k) • (d ⊗ₜ[k] d) = 0 := by
  have hdmul : d * d = 0 := by simpa [pow_two] using hsq
  have hpow := Bialgebra.comul_pow (R := k) d 2
  rw [hsq, map_zero, hprim] at hpow
  simp [pow_two, mul_add, add_mul, Algebra.TensorProduct.tmul_mul_tmul, hdmul] at hpow
  rw [← two_smul k] at hpow
  exact hpow.symm

/-- A nonzero pure tensor over a field is nonzero. This closes the logical gap between the
binomial coproduct calculation and the characteristic-zero impossibility statement. -/
theorem self_tmul_ne_zero (d : H) (hd : d ≠ 0) : d ⊗ₜ[k] d ≠ 0 := by
  obtain ⟨f, hf⟩ := Module.Projective.exists_dual_eq_one k hd
  intro h
  have h' := congrArg
    (fun z => (TensorProduct.lid k k) (TensorProduct.map f f z)) h
  simp [hf] at h'

/-- Consequently an ordinary bialgebra over a field of characteristic different from two has
no nonzero square-zero primitive element. -/
theorem no_nonzero_square_zero_primitive (h2 : (2 : k) ≠ 0) (d : H) (hd : d ≠ 0)
    (hprim : Coalgebra.comul d = d ⊗ₜ[k] 1 + 1 ⊗ₜ[k] d)
    (hsq : d ^ 2 = 0) : False := by
  have h := primitive_square_zero_forces_two_tmul d hprim hsq
  exact (smul_ne_zero h2 (self_tmul_ne_zero d hd)) h

/-- In characteristic prime `p`, Tau Ceti's same binomial formula has no intermediate
terms. This is the load-bearing coproduct equation needed to descend through `(d^p)`. -/
theorem primitive_pow_coproduct_prime (p : ℕ) (hp : p.Prime) (hchar : ringChar k = p)
    (d : H) (hprim : Coalgebra.comul d = d ⊗ₜ[k] 1 + 1 ⊗ₜ[k] d) :
    Coalgebra.comul (d ^ p) = (d ^ p) ⊗ₜ[k] 1 + 1 ⊗ₜ[k] (d ^ p) := by
  sorry

end PrimitiveObstruction

section ExampleData

/-! The following structures expose the module-algebra equations carried by the examples.
The definitive roadmap additionally requires genuine `ℤ`-graded objects and homogeneous-map
degrees; these small signatures keep the nilpotence and Leibniz equations executable today. -/

/-- A multiplicative bicharacter supplies the braiding scalar between homogeneous degrees.
Taking `G = ℤ` gives the ambient needed by the cyclotomic construction; `G = ZMod 2` is only
the super specialization. -/
structure Bicharacter (G k : Type*) [AddCommGroup G] [Field k] where
  coeff : G → G → k
  coeff_zero_left : ∀ g, coeff 0 g = 1
  coeff_zero_right : ∀ g, coeff g 0 = 1
  coeff_add_left : ∀ g₁ g₂ h, coeff (g₁ + g₂) h = coeff g₁ h * coeff g₂ h
  coeff_add_right : ∀ g h₁ h₂, coeff g (h₁ + h₂) = coeff g h₁ * coeff g h₂
  coeff_ne_zero : ∀ g h, coeff g h ≠ 0

/-- An internal grading of an existing algebra.  `DirectSum.Decomposition` uses the canonical
inclusions of the displayed submodules, so the grading cannot be faked by an unrelated degree
function or an always-false homogeneity predicate. -/
structure InternalGrading (G k A : Type*) [AddCommGroup G] [DecidableEq G]
    [Field k] [Ring A] [Algebra k A] where
  Piece : G → Submodule k A
  decomposition : DirectSum.Decomposition Piece
  one_mem_degree : (1 : A) ∈ Piece 0
  mul_mem_degree : ∀ {g h} {a b : A},
    a ∈ Piece g → b ∈ Piece h → a * b ∈ Piece (g + h)

attribute [instance] InternalGrading.decomposition

/-- A nonvacuous algebra object in bicharacter-graded vector spaces.  The ring and algebra
instances are installed before the component submodules are formed, avoiding unrelated module
structures on the carrier. -/
structure GradedBicharacterDatum (G k : Type*) [AddCommGroup G] [DecidableEq G]
    [Field k] (chi : Bicharacter G k) where
  Carrier : Type*
  [instRing : Ring Carrier]
  [instAlgebra : Algebra k Carrier]
  Piece : G → Submodule k Carrier
  decomposition : DirectSum.Decomposition Piece
  one_mem_degree : (1 : Carrier) ∈ Piece 0
  mul_mem_degree : ∀ {g h} {a b : Carrier},
    a ∈ Piece g → b ∈ Piece h → a * b ∈ Piece (g + h)

attribute [instance] GradedBicharacterDatum.instRing
  GradedBicharacterDatum.instAlgebra GradedBicharacterDatum.decomposition

/-- The concrete bidegree `(g,h)` inside a tensor square. -/
def tensorBidegreePiece (G k E : Type*) [AddCommGroup G] [DecidableEq G] [Field k]
    [Ring E] [Algebra k E] (Piece : G → Submodule k E) (g h : G) :
    Submodule k (E ⊗[k] E) :=
  Submodule.map
    (TensorProduct.map (Piece g).subtype (Piece h).subtype) ⊤

/-- The total-degree `n` part of the tensor square is the sum of the actual bidegrees
`(g,h)` satisfying `g+h=n`. -/
def tensorTotalDegreePiece (G k E : Type*) [AddCommGroup G] [DecidableEq G] [Field k]
    [Ring E] [Algebra k E] (Piece : G → Submodule k E) (n : G) :
    Submodule k (E ⊗[k] E) :=
  ⨆ gh : {gh : G × G // gh.1 + gh.2 = n},
    tensorBidegreePiece G k E Piece gh.1.1 gh.1.2

/-- A Hopf-algebra object in the bicharacter-braided category.  In contrast with an ordinary
`HopfAlgebra`, multiplicativity of `comul` uses the explicitly braided `tensorMul`. -/
structure BraidedHopfObject (G k : Type*) [AddCommGroup G] [DecidableEq G] [Field k]
    (chi : Bicharacter G k) extends GradedBicharacterDatum G k chi where
  tensorMul :
    (Carrier ⊗[k] Carrier) →ₗ[k]
      (Carrier ⊗[k] Carrier) →ₗ[k] (Carrier ⊗[k] Carrier)
  tensorMul_pure : ∀ {gx gy gx' gy'} {x y x' y' : Carrier},
    x ∈ Piece gx → y ∈ Piece gy → x' ∈ Piece gx' → y' ∈ Piece gy' →
    tensorMul (x ⊗ₜ[k] y) (x' ⊗ₜ[k] y') =
      chi.coeff gy gx' • ((x * x') ⊗ₜ[k] (y * y'))
  comul : Carrier →ₗ[k] Carrier ⊗[k] Carrier
  comul_mem_degree : ∀ {g} {x : Carrier}, x ∈ Piece g →
    (tensorTotalDegreePiece G k Carrier Piece g).carrier (comul x)
  comul_one : comul 1 = 1 ⊗ₜ[k] 1
  comul_mul : ∀ x y, comul (x * y) = tensorMul (comul x) (comul y)
  coassoc : ∀ x,
    TensorProduct.assoc k Carrier Carrier Carrier
        (TensorProduct.map comul LinearMap.id (comul x)) =
      TensorProduct.map LinearMap.id comul (comul x)
  counit : Carrier →ₗ[k] k
  counit_of_degree_ne_zero : ∀ {g} {x : Carrier},
    x ∈ Piece g → g ≠ 0 → counit x = 0
  counit_one : counit 1 = 1
  counit_mul : ∀ x y, counit (x * y) = counit x * counit y
  counit_left : ∀ x,
    TensorProduct.lid k Carrier
        (TensorProduct.map counit LinearMap.id (comul x)) = x
  counit_right : ∀ x,
    TensorProduct.rid k Carrier
        (TensorProduct.map LinearMap.id counit (comul x)) = x
  mulTensor : Carrier ⊗[k] Carrier →ₗ[k] Carrier
  mulTensor_pure : ∀ x y, mulTensor (x ⊗ₜ[k] y) = x * y
  antipode : Carrier →ₗ[k] Carrier
  antipode_mem_degree : ∀ {g} {x : Carrier}, x ∈ Piece g → antipode x ∈ Piece g
  antipode_left : ∀ x,
    mulTensor (TensorProduct.map antipode LinearMap.id (comul x)) =
      algebraMap k Carrier (counit x)
  antipode_right : ∀ x,
    mulTensor (TensorProduct.map LinearMap.id antipode (comul x)) =
      algebraMap k Carrier (counit x)

/-- An actual internally graded module over an internally graded algebra.  The action law
records that a degree-`g` algebra element sends degree `h` to degree `g+h`. -/
structure GradedModuleDatum (G k H M : Type*) [AddCommGroup G] [DecidableEq G]
    [Field k] [Ring H] [Algebra k H] [AddCommGroup M] [Module k M]
    [Module H M] [IsScalarTower k H M] (HGrading : InternalGrading G k H) where
  Piece : G → Submodule k M
  decomposition : DirectSum.Decomposition Piece
  smul_mem_degree : ∀ {g h} {a : H} {m : M},
    a ∈ HGrading.Piece g → m ∈ Piece h → a • m ∈ Piece (g + h)

attribute [instance] GradedModuleDatum.decomposition

/-- The genuine internal shift: an element formerly in degree `g-r` lies in degree `g` of
`M{r}`. -/
noncomputable def GradedModuleDatum.shift
    {G k H M : Type*} [AddCommGroup G] [DecidableEq G]
    [Field k] [Ring H] [Algebra k H] [AddCommGroup M] [Module k M]
    [Module H M] [IsScalarTower k H M] {HGrading : InternalGrading G k H}
    (MGrading : GradedModuleDatum G k H M HGrading) (r : G) :
    GradedModuleDatum G k H M HGrading := by
  refine
    { Piece := fun g => MGrading.Piece (g - r)
      decomposition := ?_
      smul_mem_degree := ?_ }
  · sorry
  · intro g h a m ha hm
    simpa [add_sub_assoc] using MGrading.smul_mem_degree ha hm

/-- A degree-zero map of graded modules.  Its underlying map is genuinely `H`-linear. -/
structure GradedLinearMap
    {G k H M N : Type*} [AddCommGroup G] [DecidableEq G]
    [Field k] [Ring H] [Algebra k H]
    [AddCommGroup M] [Module k M] [Module H M] [IsScalarTower k H M]
    [AddCommGroup N] [Module k N] [Module H N] [IsScalarTower k H N]
    {HGrading : InternalGrading G k H}
    (MGrading : GradedModuleDatum G k H M HGrading)
    (NGrading : GradedModuleDatum G k H N HGrading) where
  toLinearMap : M →ₗ[H] N
  map_mem_degree : ∀ {g} {m : M}, m ∈ MGrading.Piece g →
    toLinearMap m ∈ NGrading.Piece g

/-- Pure multiplication in the tensor product of `G`-graded algebras braided by `chi`; both
degrees affecting the scalar are witnessed in the actual internal grading. -/
def braidedTensorMulPure (k E G : Type*) [Field k] [Ring E] [Algebra k E]
    [AddCommGroup G] [DecidableEq G] (chi : Bicharacter G k)
    (grading : InternalGrading G k E)
    (x y x' y' : E) (degreeY degreeX' : G)
    (_hy : y ∈ grading.Piece degreeY) (_hx' : x' ∈ grading.Piece degreeX') :
    E ⊗[k] E :=
  chi.coeff degreeY degreeX' • ((x * x') ⊗ₜ[k] (y * y'))

/-- The standard `ℤ`-graded braiding `χ(i,j)=q^(ij)`.  Laugwitz--Qi use this ambient,
with `q` a specified nonzero root of unity. -/
noncomputable def integerBicharacter (k : Type*) [Field k] (q : k) (hq : q ≠ 0) :
    Bicharacter ℤ k := by
  sorry

/-- The Koszul sign bicharacter is the `ℤ/2` specialization, not the general ambient. -/
noncomputable def superBicharacter (k : Type*) [Field k] : Bicharacter (ZMod 2) k := by
  sorry

/-- Pure multiplication in a super tensor product, with degrees witnessed by the genuine
internal `ZMod 2` grading. -/
noncomputable def superTensorMulPure (k E : Type*) [Field k] [Ring E] [Algebra k E]
    (grading : InternalGrading (ZMod 2) k E)
    (x y x' y' : E) (parityY parityX' : ZMod 2)
    (_hy : y ∈ grading.Piece parityY) (_hx' : x' ∈ grading.Piece parityX') :
    E ⊗[k] E :=
  (superBicharacter k).coeff parityY parityX' •
    ((x * x') ⊗ₜ[k] (y * y'))

/-- The cross terms in the square of an odd primitive coproduct cancel in the super tensor
product. This is the sign calculation which fails in the ordinary tensor product. -/
theorem odd_primitive_cross_terms_cancel
    (k E : Type*) [Field k] [Ring E] [Algebra k E]
    (grading : InternalGrading (ZMod 2) k E) (d : E)
    (hd : d ∈ grading.Piece 1) :
    superTensorMulPure k E grading d 1 1 d 0 0
        grading.one_mem_degree grading.one_mem_degree +
      superTensorMulPure k E grading 1 d d 1 1 1 hd hd = 0 := by
  sorry

/-- The exterior Hopf **super**algebra is an actual Hopf object in the `ZMod 2`-graded
bicharacter category, not a disconnected list of maps. -/
structure ExteriorOddPrimitiveDatum (k : Type*) [Field k]
    extends BraidedHopfObject (ZMod 2) k (superBicharacter k) where
  d : Carrier
  d_degree : d ∈ Piece 1
  d_ne_zero : d ≠ 0
  d_sq : d ^ 2 = 0
  comul_d : comul d = d ⊗ₜ[k] 1 + 1 ⊗ₜ[k] d
  counit_d : counit d = 0
  antipode_d : antipode d = -d

/-- An ordinary DG algebra: the sign is attached to the degree of a homogeneous left factor.
The exterior generator is odd and primitive in super vector spaces, not in ordinary vector spaces. -/
structure OrdinaryDGDatum (k A : Type*) [Field k] [Ring A] [Algebra k A] where
  grading : InternalGrading ℤ k A
  differential : A →ₗ[k] A
  differential_sq : differential.comp differential = 0
  differential_degree : ∀ {g} {a : A}, a ∈ grading.Piece g →
    differential a ∈ grading.Piece (g + 1)
  leibniz : ∀ (g : ℤ) {a : A}, a ∈ grading.Piece g → ∀ b,
    differential (a * b) =
      differential a * b + ((-1 : k) ^ g) • (a * differential b)

/-- A `p`-DG algebra over characteristic `p`: there is no Koszul sign in the Leibniz rule,
and the differential is nilpotent of order `p`. -/
structure PDGDatum (k A : Type*) [Field k] [Ring A] [Algebra k A] (p : ℕ) where
  prime : p.Prime
  characteristic : ringChar k = p
  grading : InternalGrading ℤ k A
  differential : A →ₗ[k] A
  differential_pow : differential ^ p = 0
  differential_degree : ∀ {g} {a : A}, a ∈ grading.Piece g →
    differential a ∈ grading.Piece (g + 1)
  leibniz : ∀ a b,
    differential (a * b) = differential a * b + a * differential b

/-- The `q`-Leibniz form of an `N`-complex algebra. This belongs to the braided/Taft model;
it is not the ordinary primitive truncated-polynomial Hopf algebra in characteristic zero. -/
structure QNComplexDatum (k A : Type*) [Field k] [Ring A] [Algebra k A]
    (N : ℕ) (q : k) where
  order : 2 ≤ N
  primitiveRoot : IsPrimitiveRoot q N
  characteristic_not_dvd : ¬ ringChar k ∣ N
  grading : InternalGrading ℤ k A
  differential : A →ₗ[k] A
  differential_pow : differential ^ N = 0
  differential_degree : ∀ {g} {a : A}, a ∈ grading.Piece g →
    differential a ∈ grading.Piece (g + 1)
  leibniz : ∀ (g : ℤ) {a : A}, a ∈ grading.Piece g → ∀ b,
    differential (a * b) =
      differential a * b + (q ^ g) • (a * differential b)

/-- The integral action in the exterior Hopf-superalgebra gives Qi's signed formula
`d_N h + (-1)^(|h|+1) h d_M`. For a degree `-1` chain homotopy the sign is positive. -/
def dgIntegralNullHomotopy {k M N : Type*} [Field k]
    [AddCommGroup M] [Module k M] [AddCommGroup N] [Module k N]
    (dM : M →ₗ[k] M) (dN : N →ₗ[k] N) (h : M →ₗ[k] N)
    (degreeH : ℤ) : M →ₗ[k] N :=
  dN.comp h + ((-1 : k) ^ (degreeH + 1)) • h.comp dM

theorem dgIntegralNullHomotopy_degree_neg_one {k M N : Type*} [Field k]
    [AddCommGroup M] [Module k M] [AddCommGroup N] [Module k N]
    (dM : M →ₗ[k] M) (dN : N →ₗ[k] N) (h : M →ₗ[k] N) :
    dgIntegralNullHomotopy dM dN h (-1) = dN.comp h + h.comp dM := by
  simp [dgIntegralNullHomotopy]

/-- The explicit `p`-complex null-homotopy operator
`Σ_{i=0}^{p-1} d_N^i h d_M^(p-1-i)`. For the usual DG case `p = 2`, the
super conventions turn this into the familiar signed chain-homotopy formula. -/
def pNullHomotopy {k M N : Type*} [Field k]
    [AddCommGroup M] [Module k M] [AddCommGroup N] [Module k N]
    (p : ℕ) (dM : M →ₗ[k] M) (dN : N →ₗ[k] N) (h : M →ₗ[k] N) : M →ₗ[k] N :=
  ∑ i ∈ Finset.range p, (dN ^ i).comp (h.comp (dM ^ (p - 1 - i)))

theorem pNullHomotopy_two {k M N : Type*} [Field k]
    [AddCommGroup M] [Module k M] [AddCommGroup N] [Module k N]
    (dM : M →ₗ[k] M) (dN : N →ₗ[k] N) (h : M →ₗ[k] N) :
    pNullHomotopy 2 dM dN h = h.comp dM + dN.comp h := by
  ext m
  simp [pNullHomotopy, Finset.sum_range_succ, add_comm]

/-- Slash cycles `ker(d^(j+1))`. -/
def slashCycles {k M : Type*} [Field k] [AddCommGroup M] [Module k M]
    (d : M →ₗ[k] M) (j : ℕ) : Submodule k M :=
  LinearMap.ker (d ^ (j + 1))

/-- The slash denominator `im(d^(p-j-1)) + ker(d^j)`. -/
def slashDenominator {k M : Type*} [Field k] [AddCommGroup M] [Module k M]
    (p : ℕ) (d : M →ₗ[k] M) (j : ℕ) : Submodule k M :=
  LinearMap.range (d ^ (p - j - 1)) ⊔ LinearMap.ker (d ^ j)

/-- For `d^p=0` and `0≤j≤p-2`, the stated denominator lies in the slash cycles. -/
theorem slashDenominator_le_cycles {k M : Type*} [Field k]
    [AddCommGroup M] [Module k M] (p : ℕ) (d : M →ₗ[k] M)
    (hd : d ^ p = 0) (j : ℕ) (hj : j ≤ p - 2) :
    slashDenominator p d j ≤ slashCycles d j := by
  sorry

/-- `H^{/j}(M)=ker(d^(j+1))/(im(d^(p-j-1))+ker(d^j))`, represented as a quotient of
the cycle submodule.  The nilpotence and range bound are inputs, so the `comap` is provably
the entire stated denominator viewed inside cycles, not an accidental intersection. -/
def SlashHomology {k M : Type*} [Field k] [AddCommGroup M] [Module k M]
    (p : ℕ) (d : M →ₗ[k] M) (hd : d ^ p = 0)
    (j : ℕ) (hj : j ≤ p - 2) : Type _ :=
  let _denominator_le := slashDenominator_le_cycles p d hd j hj
  (slashCycles d j) ⧸
    (slashDenominator p d j).comap (slashCycles d j).subtype

/-- If the structural differential has degree `delta`, a `p`-null-homotopy has degree
`(1-p)delta`. -/
def pNullHomotopyDegree (p : ℕ) (delta : ℤ) : ℤ := (1 - (p : ℤ)) * delta

@[simp] theorem pNullHomotopyDegree_one (p : ℕ) :
    pNullHomotopyDegree p 1 = 1 - p := by
  simp [pNullHomotopyDegree]

@[simp] theorem pNullHomotopyDegree_two (p : ℕ) :
    pNullHomotopyDegree p 2 = 2 - 2 * p := by
  simp [pNullHomotopyDegree]
  ring

/-- Equations for the ordinary characteristic-`p` truncated-primitive model. The roadmap
separately requires constructing the quotient Hopf algebra when `p` is prime and `char k = p`. -/
structure TruncatedPrimitiveDatum (k H : Type*) [Field k] [Ring H] [HopfAlgebra k H]
    (p : ℕ) where
  prime : p.Prime
  characteristic : ringChar k = p
  d : H
  primitive : Coalgebra.comul (R := k) d = d ⊗ₜ[k] 1 + 1 ⊗ₜ[k] d
  counit : Coalgebra.counit (R := k) d = 0
  antipode : HopfAlgebra.antipode k d = -d
  nilpotent : d ^ p = 0
  generated : Algebra.adjoin k ({d} : Set H) = ⊤
  /-- Recognition data for the quotient `k[d]/(d^p)`: these monomials are a basis, so the
  zero generator/trivial algebra cannot masquerade as the example.  The construction theorem
  must separately build this basis from the polynomial quotient. -/
  monomialBasis : Module.Basis (Fin p) k H
  monomialBasis_apply : ∀ i, monomialBasis i = d ^ (i : ℕ)

/-- The differential on an `H=k[d]/(d^p)`-module is multiplication by its genuine
primitive generator. -/
noncomputable def TruncatedPrimitiveDatum.moduleDifferential
    {k H M : Type*} [Field k] [Ring H] [HopfAlgebra k H]
    [AddCommGroup M] [Module k M] [Module H M] [IsScalarTower k H M]
    {p : ℕ} (P : TruncatedPrimitiveDatum k H p) : M →ₗ[k] M := by
  sorry

theorem TruncatedPrimitiveDatum.moduleDifferential_pow
    {k H M : Type*} [Field k] [Ring H] [HopfAlgebra k H]
    [AddCommGroup M] [Module k M] [Module H M] [IsScalarTower k H M]
    {p : ℕ} (P : TruncatedPrimitiveDatum k H p) :
    (P.moduleDifferential (M := M)) ^ p = 0 := by
  sorry

/-- Khovanov--Qi slash homology detects projectivity for finite-dimensional `p`-complexes:
all `H^{/j}`, `0≤j≤p-2`, vanish iff the underlying truncated-Hopf module is projective. -/
theorem slashHomology_zero_iff_projective
    {k H M : Type*} [Field k] [Ring H] [HopfAlgebra k H]
    [AddCommGroup M] [Module k M] [Module H M] [IsScalarTower k H M]
    [FiniteDimensional k M] {p : ℕ} (P : TruncatedPrimitiveDatum k H p) :
    (∀ j (hj : j ≤ p - 2),
      Subsingleton (SlashHomology p (P.moduleDifferential (M := M))
        P.moduleDifferential_pow j hj)) ↔
      Module.Projective H M := by
  sorry

/-- A primitive truncated generator acts by the unsigned Leibniz rule. -/
structure TruncatedPrimitiveModuleAlgebraEquations
    (k H A : Type*) [Field k] [Ring H] [HopfAlgebra k H] [Ring A] [Algebra k A]
    (X : LeftModuleAlgebra k H A) (p : ℕ) (P : TruncatedPrimitiveDatum k H p) : Prop where
  d_leibniz : ∀ a b,
    X.act P.d (a * b) = X.act P.d a * b + a * X.act P.d b

/-- Equations for Sweedler's four-dimensional Hopf algebra. At `char k ≠ 2`, the skew
primitive coproduct and `g d = -d g` are exactly the bosonized sign correction. -/
structure SweedlerDatum (k H : Type*) [Field k] [Ring H] [HopfAlgebra k H] where
  characteristic_ne_two : ringChar k ≠ 2
  grading : InternalGrading (ZMod 2) k H
  g : H
  d : H
  g_degree : g ∈ grading.Piece 0
  d_degree : d ∈ grading.Piece 1
  g_sq : g ^ 2 = 1
  d_sq : d ^ 2 = 0
  g_mul_d : g * d = -(d * g)
  comul_g : Coalgebra.comul (R := k) g = g ⊗ₜ[k] g
  comul_d : Coalgebra.comul (R := k) d = d ⊗ₜ[k] 1 + g ⊗ₜ[k] d
  counit_g : Coalgebra.counit (R := k) g = 1
  counit_d : Coalgebra.counit (R := k) d = 0
  antipode_g : HopfAlgebra.antipode k g = g
  antipode_d : HopfAlgebra.antipode k d = -(g * d)
  generated : Algebra.adjoin k ({g, d} : Set H) = ⊤
  /-- Recognition basis `g^i d^j`, enforcing dimension four.  A separate quotient
  constructor proves that the usual presentation has this basis. -/
  monomialBasis : Module.Basis (Fin 2 × Fin 2) k H
  monomialBasis_apply : ∀ i,
    monomialBasis i = g ^ (i.1 : ℕ) * d ^ (i.2 : ℕ)

/-- The two middle terms in `Δ(d)²` cancel in the Sweedler/bosonized model. -/
theorem SweedlerDatum.comul_d_sq_middle_cancel
    {k H : Type*} [Field k] [Ring H] [HopfAlgebra k H] (X : SweedlerDatum k H) :
    X.d * X.g + X.g * X.d = 0 := by
  rw [X.g_mul_d]
  simp

/-- With a genuine internal `ℤ`-grading, the Sweedler action makes `g` literally the parity
operator and `d` a degree-one `g`-skew derivation. -/
structure SweedlerModuleAlgebraEquations (k H A : Type*) [Field k] [Ring H]
    [HopfAlgebra k H] [Ring A] [Algebra k A]
    (X : LeftModuleAlgebra k H A) (S : SweedlerDatum k H)
    (grading : InternalGrading ℤ k A) : Prop where
  g_multiplicative : ∀ a b, X.act S.g (a * b) = X.act S.g a * X.act S.g b
  /-- `g` is literally the parity operator on the genuine internal `ℤ`-grading. -/
  g_on_degree : ∀ {r} {a : A}, a ∈ grading.Piece r →
    X.act S.g a = ((-1 : k) ^ r) • a
  d_degree : ∀ {r} {a : A}, a ∈ grading.Piece r →
    X.act S.d a ∈ grading.Piece (r + 1)
  d_signedLeibniz : ∀ a b,
    X.act S.d (a * b) = X.act S.d a * b + X.act S.g a * X.act S.d b

/-- Equations for the Taft convention used here. `zeta` is required to be primitive of exact
order `n` in the roadmap, and `n ≥ 2`, `char k ∤ n` are explicit hypotheses there. -/
structure TaftDatum (k H : Type*) [Field k] [Ring H] [HopfAlgebra k H]
    (n : ℕ) (zeta : k) where
  order : 2 ≤ n
  primitiveRoot : IsPrimitiveRoot zeta n
  characteristic_not_dvd : ¬ ringChar k ∣ n
  K : H
  d : H
  K_pow : K ^ n = 1
  d_pow : d ^ n = 0
  K_mul_d : K * d = algebraMap k H zeta * d * K
  comul_K : Coalgebra.comul (R := k) K = K ⊗ₜ[k] K
  comul_d : Coalgebra.comul (R := k) d = d ⊗ₜ[k] 1 + K ⊗ₜ[k] d
  counit_K : Coalgebra.counit (R := k) K = 1
  counit_d : Coalgebra.counit (R := k) d = 0
  Kinv : H
  Kinv_mul_K : Kinv * K = 1
  K_mul_Kinv : K * Kinv = 1
  antipode_K : HopfAlgebra.antipode k K = Kinv
  antipode_d : HopfAlgebra.antipode k d = -(Kinv * d)
  generated : Algebra.adjoin k ({K, d} : Set H) = ⊤
  /-- Recognition basis `K^i d^j`, enforcing dimension `n^2`.  The quotient presentation
  and proof of this basis are construction targets, not assumptions of that constructor. -/
  monomialBasis : Module.Basis (Fin n × Fin n) k H
  monomialBasis_apply : ∀ i,
    monomialBasis i = K ^ (i.1 : ℕ) * d ^ (i.2 : ℕ)

/-- The module-algebra equation forced by the Taft coproduct
`Δ(d) = d ⊗ 1 + K ⊗ d`. -/
structure TaftModuleAlgebraEquations (k H A : Type*) [Field k] [Ring H]
    [HopfAlgebra k H] [Ring A] [Algebra k A]
    (X : LeftModuleAlgebra k H A) (n : ℕ) (zeta : k)
    (T : TaftDatum k H n zeta) : Prop where
  K_multiplicative : ∀ a b, X.act T.K (a * b) = X.act T.K a * X.act T.K b
  d_skewLeibniz : ∀ a b,
    X.act T.d (a * b) = X.act T.d a * b + X.act T.K a * X.act T.d b

/-- Complete distinct-prime factorization data `n = ∏ p_k^{a_k}`.  The equality, primality,
positive exponents and pairwise distinctness jointly rule out an incomplete list of primes. -/
structure CyclotomicFactorization (n t : ℕ) where
  order : 2 ≤ n
  nonempty : 0 < t
  p : Fin t → ℕ
  exponent : Fin t → ℕ
  p_prime : ∀ i, (p i).Prime
  exponent_pos : ∀ i, 0 < exponent i
  p_distinct : ∀ i j, i ≠ j → p i ≠ p j
  complete : ∏ i, p i ^ exponent i = n

namespace CyclotomicFactorization

variable {n t : ℕ}

/-- `m = ∏ p_k`, the square-free radical of `n`. -/
def radical (F : CyclotomicFactorization n t) : ℕ := ∏ i, F.p i

/-- `N = n²/m`, the order of the bosonizing cyclic group. -/
def ambientOrder (F : CyclotomicFactorization n t) : ℕ := n ^ 2 / F.radical

/-- `n_k = n/p_k`. -/
def nDivPrime (F : CyclotomicFactorization n t) (i : Fin t) : ℕ := n / F.p i

/-- `m_k = m/p_k`. -/
def radicalDivPrime (F : CyclotomicFactorization n t) (i : Fin t) : ℕ :=
  F.radical / F.p i

theorem prime_dvd_order (F : CyclotomicFactorization n t) (i : Fin t) :
    F.p i ∣ n := by
  sorry

theorem radical_dvd_order (F : CyclotomicFactorization n t) : F.radical ∣ n := by
  sorry

theorem ambientOrder_pos (F : CyclotomicFactorization n t) : 0 < F.ambientOrder := by
  sorry

end CyclotomicFactorization

/-- Root data derived from the factorization: `q` has order `N`,
`ξ=q^(n/m)`, and `ξ_k=ξ^m_k=q^n_k`. -/
structure CyclotomicRootData (k : Type*) [Field k] {n t : ℕ}
    (F : CyclotomicFactorization n t) where
  q : k
  q_primitiveRoot : IsPrimitiveRoot q F.ambientOrder
  characteristic_not_dvd : ¬ ringChar k ∣ F.ambientOrder

namespace CyclotomicRootData

variable {k : Type*} [Field k] {n t : ℕ} {F : CyclotomicFactorization n t}

/-- `ξ=q^(n/m)`. -/
def xi (R : CyclotomicRootData k F) : k := R.q ^ (n / F.radical)

/-- `ξ_k=ξ^m_k`; arithmetic identifies this with `q^n_k`. -/
def xiAt (R : CyclotomicRootData k F) (i : Fin t) : k :=
  R.xi ^ F.radicalDivPrime i

theorem q_ne_zero (R : CyclotomicRootData k F) : R.q ≠ 0 := by
  sorry

/-- The `ℤ`-graded bicharacter actually used by the Laugwitz--Qi braided algebra. -/
noncomputable def braiding (R : CyclotomicRootData k F) : Bicharacter ℤ k :=
  integerBicharacter k R.q R.q_ne_zero

theorem xi_primitiveRoot (R : CyclotomicRootData k F) :
    IsPrimitiveRoot R.xi n := by
  sorry

/-- `ξ_k` has order `p_k·(n/m)`, which is `p_k` only when `n` is squarefree.  At `n = 4` with
`p₁ = 2` the value `ξ₁ = q²` has order `4`, so `IsPrimitiveRoot (R.xiAt i) (F.p i)` is false and
must not be stated. -/
theorem xiAt_primitiveRoot (R : CyclotomicRootData k F) (i : Fin t) :
    IsPrimitiveRoot (R.xiAt i) (F.p i * (n / F.radical)) := by
  sorry

/-- The self-braiding parameter of the generator `d_k`, of degree `n_k`, is `ξ_k^{n_k}=q^{n_k²}`.
Its order is `p_k` for every `n`, and that is what truncates the one-generator Nichols algebra at
`d_k^{p_k}`. -/
theorem xiAt_pow_nDivPrime_primitiveRoot (R : CyclotomicRootData k F) (i : Fin t) :
    IsPrimitiveRoot (R.xiAt i ^ F.nDivPrime i) (F.p i) := by
  sorry

theorem xiAt_eq_q_pow_nDivPrime (R : CyclotomicRootData k F) (i : Fin t) :
    R.xiAt i = R.q ^ F.nDivPrime i := by
  sorry

end CyclotomicRootData

/-- The braided Hopf algebra `H_n` itself, in the general `ℤ`-graded bicharacter ambient.
Its standard basis enforces dimension `m=∏p_k`; the ordinary bosonization below consumes this
object rather than copying a disconnected list of generators. -/
structure CyclotomicBraidedDatum (k : Type*) [Field k] {n t : ℕ}
    (F : CyclotomicFactorization n t) (R : CyclotomicRootData k F)
    extends BraidedHopfObject ℤ k R.braiding where
  d : Fin t → Carrier
  d_degree : ∀ i, d i ∈ Piece (F.nDivPrime i : ℤ)
  d_pow : ∀ i, d i ^ F.p i = 0
  d_comm : ∀ i j, d i * d j = d j * d i
  comul_d : ∀ i, comul (d i) = d i ⊗ₜ[k] 1 + 1 ⊗ₜ[k] d i
  counit_d : ∀ i, counit (d i) = 0
  antipode_d : ∀ i, antipode (d i) = -d i
  generated : Algebra.adjoin k (Set.range d) = ⊤
  monomialBasis : Module.Basis (∀ i, Fin (F.p i)) k Carrier
  monomialBasis_apply : ∀ a,
    monomialBasis a = (List.ofFn fun i => d i ^ (a i : ℕ)).prod

/-- The actual internal `ℤ`-grading carried by the cyclotomic braided algebra. -/
def CyclotomicBraidedDatum.internalGrading
    {k : Type*} [Field k] {n t : ℕ} {F : CyclotomicFactorization n t}
    {R : CyclotomicRootData k F} (Br : CyclotomicBraidedDatum k F R) :
    InternalGrading ℤ k Br.Carrier where
  Piece := Br.Piece
  decomposition := Br.toBraidedHopfObject.toGradedBicharacterDatum.decomposition
  one_mem_degree := Br.one_mem_degree
  mul_mem_degree := Br.mul_mem_degree

/-- Recognition data for the Laugwitz--Qi bosonization attached to the *derived* arithmetic
above. Each `d_k` is `K^n_k`-skew primitive and has nilpotence order `p_k`.  The monomial
basis enforces dimension `N · ∏p_k`; a separate quotient constructor must prove this data. -/
structure CyclotomicBosonizationDatum (k H : Type*) [Field k] [Ring H] [HopfAlgebra k H]
    {n t : ℕ} (F : CyclotomicFactorization n t) (R : CyclotomicRootData k F)
    (Br : CyclotomicBraidedDatum k F R) where
  includeBraided :
    letI := Br.toBraidedHopfObject.toGradedBicharacterDatum.instRing
    letI := Br.toBraidedHopfObject.toGradedBicharacterDatum.instAlgebra
    Br.Carrier →ₐ[k] H
  K : H
  d : Fin t → H
  d_eq : ∀ i, d i = includeBraided (Br.d i)
  K_pow : K ^ F.ambientOrder = 1
  d_pow : ∀ i, d i ^ F.p i = 0
  d_comm : ∀ i j, d i * d j = d j * d i
  K_mul_d : ∀ i, K * d i = algebraMap k H (R.xiAt i) * d i * K
  comul_K : Coalgebra.comul (R := k) K = K ⊗ₜ[k] K
  comul_d : ∀ i,
    Coalgebra.comul (R := k) (d i) =
      d i ⊗ₜ[k] 1 + (K ^ F.nDivPrime i) ⊗ₜ[k] d i
  counit_K : Coalgebra.counit (R := k) K = 1
  counit_d : ∀ i, Coalgebra.counit (R := k) (d i) = 0
  Kinv : H
  Kinv_mul_K : Kinv * K = 1
  K_mul_Kinv : K * Kinv = 1
  antipode_K : HopfAlgebra.antipode k K = Kinv
  antipode_d : ∀ i,
    HopfAlgebra.antipode k (d i) = -((Kinv ^ F.nDivPrime i) * d i)
  generated : Algebra.adjoin k ({K} ∪ Set.range d) = ⊤
  monomialBasis :
    Module.Basis (Fin F.ambientOrder × (∀ i, Fin (F.p i))) k H
  monomialBasis_apply : ∀ a,
    monomialBasis a = K ^ (a.1 : ℕ) *
      (List.ofFn fun i => d i ^ (a.2 i : ℕ)).prod

/-- Each Laugwitz--Qi differential is a `K^(n/pᵢ)`-skew derivation on a module algebra. -/
structure CyclotomicModuleAlgebraEquations (k H A : Type*) [Field k] [Ring H]
    [HopfAlgebra k H] [Ring A] [Algebra k A]
    (X : LeftModuleAlgebra k H A) {n t : ℕ} (F : CyclotomicFactorization n t)
    (R : CyclotomicRootData k F) (Br : CyclotomicBraidedDatum k F R)
    (LQ : CyclotomicBosonizationDatum k H F R Br) : Prop where
  K_multiplicative : ∀ a b, X.act LQ.K (a * b) = X.act LQ.K a * X.act LQ.K b
  d_skewLeibniz : ∀ i a b,
    X.act (LQ.d i) (a * b) =
      X.act (LQ.d i) a * b +
        X.act (LQ.K ^ F.nDivPrime i) a * X.act (LQ.d i) b

end ExampleData

/-! ## Relative hopfological homotopy and derived targets -/

section RelativeTheory

variable (k : Type u) (H : Type v) (A : Type w)
variable [Field k] [Ring H] [HopfAlgebra k H] [FiniteDimensional k H]
variable [Ring A] [Algebra k A]
variable (X : LeftModuleAlgebra k H A)

/-- An object of `C(A,H)` is genuinely a module over the chosen smash algebra `B=A#H`.
The `A`- and `k`-module structures are recorded with their scalar towers, and the final
equation pins the `A`-action to restriction along `A → B`. -/
structure SmashModule (S : X.SmashProduct) where
  Carrier : Type x
  [instAddCommGroup : AddCommGroup Carrier]
  [instModuleK : Module k Carrier]
  [instModuleA : Module A Carrier]
  [instModuleB : Module S.Carrier Carrier]
  [instScalarTowerKA : IsScalarTower k A Carrier]
  [instScalarTowerKB : IsScalarTower k S.Carrier Carrier]
  restrict_smul : ∀ (a : A) (m : Carrier), a • m = S.includeA a • m

attribute [instance] SmashModule.instAddCommGroup SmashModule.instModuleK
  SmashModule.instModuleA SmashModule.instModuleB SmashModule.instScalarTowerKA
  SmashModule.instScalarTowerKB

/-- Restriction along `H → A#H` constructs the actual `H`-action on a smash module. -/
noncomputable def SmashModule.hAction (S : X.SmashProduct)
    (M : SmashModule k H A X S) :
    LeftAction k H M.Carrier := by
  sorry

/-- On the genuine `Hom_A(M,N)`, Qi's convention uses the inverse antipode:
`(h · f)(m) = Σ h₂ · f(S⁻¹(h₁) · m)`.  The invariant maps are exactly the maps linear over
`B=A#H`; this prevents the relative layer from being populated without `C(A,H)` data. -/
structure HomActionFormula (S : X.SmashProduct)
    (M : SmashModule k H A X S) (N : SmashModule k H A X S) where
  invAntipode : H →ₗ[k] H
  invAntipode_left : invAntipode.comp (HopfAlgebra.antipode k) = LinearMap.id
  invAntipode_right : (HopfAlgebra.antipode k).comp invAntipode = LinearMap.id
  homAction : LeftAction k H (M.Carrier →ₗ[A] N.Carrier)
  homAct_apply : ∀ h f m,
    homAction.act h f m = ∑ i ∈ (ℛ k h).index,
      S.includeH ((ℛ k h).right i) •
        f (S.includeH (invAntipode ((ℛ k h).left i)) • m)
  invariant_iff_bLinear : ∀ f : M.Carrier →ₗ[A] N.Carrier,
    (∀ h m, homAction.act h f m =
      Coalgebra.counit (R := k) h • f m) ↔
    ∃ fB : M.Carrier →ₗ[S.Carrier] N.Carrier, ∀ m, fB m = f m

/-- The integral formula for the hopfological null ideal: a `B = A # H`-linear map is
null-homotopic exactly when it is `Λ · g` for an `A`-linear `g`. -/
def IsIntegralNull {S : X.SmashProduct} {M N : SmashModule k H A X S}
    (F : HomActionFormula k H A X S M N) (Λ : LeftIntegral k H)
    (f : M.Carrier →ₗ[S.Carrier] N.Carrier) : Prop :=
  ∃ g : M.Carrier →ₗ[A] N.Carrier,
    ∀ m, f m = F.homAction.act (Λ : H) g m

/-- An `A`-split short exact sequence. These are the conflations in the relative Frobenius
exact structure underlying `C(A,H)`; ordinary stable categories instead use all short exact
sequences in the abelian `A # H`-module category. -/
structure ASplitConflation (S : X.SmashProduct)
    (M E N : SmashModule k H A X S) where
  inclusion : M.Carrier →ₗ[S.Carrier] E.Carrier
  projection : E.Carrier →ₗ[S.Carrier] N.Carrier
  exact : Function.Exact inclusion projection
  inclusion_injective : Function.Injective inclusion
  projection_surjective : Function.Surjective projection
  /-- Only the chosen splitting is `A`-linear; the conflation maps above are `B`-linear. -/
  retraction : E.Carrier →ₗ[A] M.Carrier
  section_ : N.Carrier →ₗ[A] E.Carrier
  retraction_inclusion : ∀ m, retraction (inclusion m) = m
  projection_section : ∀ n, projection (section_ n) = n

/-- A chosen cellular witness for property (P).  The filtration consists of `B`-submodules,
so it is equivariant; its inclusions split only after restriction to `A`.  Each layer map is
actually `B`-linear and its target has the pinned diagonal smash action on `A ⊗ V`. -/
structure PropertyPData (S : X.SmashProduct) (P : SmashModule k H A X S) where
  /-- We index the filtration with a zero initial stage; `Fil (r + 1)` corresponds to Qi's
  `F_r`. -/
  Fil : ℕ → Submodule S.Carrier P.Carrier
  zero_stage : Fil 0 = ⊥
  monotone : Monotone Fil
  exhaustive : ⨆ r, Fil r = ⊤
  /-- Every filtration inclusion splits by a `k`-linear map satisfying literal `A`-linearity
  through `S.includeA`. -/
  split : ∀ r, Fil (r + 1) →ₗ[k] Fil r
  split_A_linear : ∀ r a z,
    split r (S.includeA a • z) = S.includeA a • split r z
  split_inclusion : ∀ r (z : Fil r),
    split r ⟨z.1, monotone (Nat.le_succ r) z.2⟩ = z
  /-- Using Qi's equivalent version of (P3), one arbitrary `H`-module records all cells in a
  layer (and may itself be a direct sum of indecomposables). -/
  Cell : ℕ → Type y
  cellAddCommGroup : ∀ r, AddCommGroup (Cell r)
  cellModule : ∀ r, letI := cellAddCommGroup r; Module k (Cell r)
  cellAction : ∀ r,
    letI := cellAddCommGroup r
    letI := cellModule r
    LeftAction k H (Cell r)
  /-- A genuine `B`-module model for the layer. -/
  cellSmashModule : ℕ → SmashModule.{u, v, w, x} k H A X S
  /-- The underlying `k`-module of the model is `A ⊗ Cell r`. -/
  cellEquiv : ∀ r,
    letI := cellAddCommGroup r
    letI := cellModule r
    (cellSmashModule r).Carrier ≃ₗ[k] A ⊗[k] Cell r
  /-- The equivalence exposes the smash action
  `(a#h)(b⊗v)=Σ a(h₁·b)⊗h₂·v`; this is the equivariant content of (P3). -/
  cell_action_pure : ∀ r,
    letI := cellAddCommGroup r
    letI := cellModule r
    ∀ a h b v,
      cellEquiv r
          (S.pure a h • (cellEquiv r).symm (b ⊗ₜ[k] v)) =
        ∑ i ∈ (ℛ k h).index,
          (a * X.act ((ℛ k h).left i) b) ⊗ₜ[k]
            (cellAction r).act ((ℛ k h).right i) v
  /-- Exactness and surjectivity identify the quotient layer with that cell module using an
  actual `B`-linear map. -/
  layerProjection : ∀ r,
    Fil (r + 1) →ₗ[S.Carrier] (cellSmashModule r).Carrier
  layer_exact : ∀ r,
    Function.Exact (Submodule.inclusion (monotone (Nat.le_succ r))) (layerProjection r)
  layer_surjective : ∀ r,
    Function.Surjective (layerProjection r)

/-- Compactness uses Mathlib's actual categorical coproducts.  The preadditive representable
`Hom(P,-) : C ⥤ AddCommGrpCat` must preserve every discrete colimit of the selected small
universe; this packages the canonical comparison induced by the coproduct injections, rather
than an arbitrary object-valued function and arbitrary bijection. -/
def IsCompactObject (C : Type u) [Category.{v} C] [Preadditive C]
    [HasCoproducts.{w} C] (P : C) : Prop :=
  ∀ Index : Type w,
    PreservesColimitsOfShape (Discrete Index)
      (preadditiveCoyoneda.obj (Opposite.op P))

/-! ### Laugwitz--Qi's filtered ideal (Definition 4.5 and Proposition 4.16) -/

/-- The literal balanced induced module `H_n ⊗_{H_{n_k}} k`, characterized by its full
bilinear balanced universal property and carrying the grading induced from `H_n`. -/
structure LQInducedCell (Hn : Type x) [Ring Hn] [Algebra k Hn]
    (HnGrading : InternalGrading ℤ k Hn)
    (Hnk : Type y) [Ring Hnk] [Algebra k Hnk]
    (incl : Hnk →ₐ[k] Hn) (augmentation : Hnk →ₐ[k] k) where
  Carrier : Type x
  [instAddCommGroup : AddCommGroup Carrier]
  [instModuleK : Module k Carrier]
  [instModuleHn : Module Hn Carrier]
  [instScalarTower : IsScalarTower k Hn Carrier]
  pure : Hn → k → Carrier
  balanced : ∀ (h : Hn) (r : Hnk) (c : k),
    pure (h * incl r) c = pure h (augmentation r * c)
  pure_add_left : ∀ h₁ h₂ c, pure (h₁ + h₂) c = pure h₁ c + pure h₂ c
  pure_add_right : ∀ h c₁ c₂, pure h (c₁ + c₂) = pure h c₁ + pure h c₂
  pure_zero_left : ∀ c, pure 0 c = 0
  pure_zero_right : ∀ h, pure h 0 = 0
  pure_smul_right : ∀ h r c, pure h (r * c) = r • pure h c
  pure_smul : ∀ h c, pure h c = h • pure 1 c
  grading : GradedModuleDatum ℤ k Hn Carrier HnGrading
  pure_mem_degree : ∀ {g} {h : Hn}, h ∈ HnGrading.Piece g → ∀ c,
    pure h c ∈ grading.Piece g
  /-- Universal property of the balanced tensor `H_n ⊗_{H_{n_k}} k`. -/
  lift_unique : ∀ {Q : Type x} [AddCommGroup Q] [Module k Q]
      [Module Hn Q] [IsScalarTower k Hn Q]
      (f : Hn → k → Q)
      (hbal : ∀ h r c, f (h * incl r) c = f h (augmentation r * c))
      (haddl : ∀ h₁ h₂ c, f (h₁ + h₂) c = f h₁ c + f h₂ c)
      (haddr : ∀ h c₁ c₂, f h (c₁ + c₂) = f h c₁ + f h c₂)
      (hscale : ∀ h r c, f h (r * c) = r • f h c)
      (hsmul : ∀ h c, f h c = h • f 1 c),
    let _laws := And.intro hbal
      (And.intro haddl (And.intro haddr (And.intro hscale hsmul)))
    ∃! g : Carrier →ₗ[Hn] Q, ∀ h c, g (pure h c) = f h c

attribute [instance] LQInducedCell.instAddCommGroup LQInducedCell.instModuleK
  LQInducedCell.instModuleHn LQInducedCell.instScalarTower

/-- The concrete generator subalgebras `H_{n_k}=k[d_k]/(d_k^{p_k})` inside the fixed
cyclotomic braided algebra, together with their literal induced cells.  There is no independent
choice of `H_n`, inclusion, or `W_k`. -/
structure LQCellFamily {n t : ℕ} (F : CyclotomicFactorization n t)
    (R : CyclotomicRootData k F) (Br : CyclotomicBraidedDatum k F R) where
  Hnk : Fin t → Type y
  [hnkRing : ∀ i, Ring (Hnk i)]
  [hnkAlgebra : ∀ i, Algebra k (Hnk i)]
  generator : ∀ i, Hnk i
  generator_degree : Fin t → ℤ
  generator_degree_eq : ∀ i, generator_degree i = F.nDivPrime i
  generator_pow : ∀ i, generator i ^ F.p i = 0
  monomialBasis : ∀ i, Module.Basis (Fin (F.p i)) k (Hnk i)
  monomialBasis_apply : ∀ i j,
    monomialBasis i j = generator i ^ (j : ℕ)
  incl : ∀ i, Hnk i →ₐ[k] Br.Carrier
  incl_injective : ∀ i, Function.Injective (incl i)
  incl_generator : ∀ i, incl i (generator i) = Br.d i
  incl_generator_degree : ∀ i,
    incl i (generator i) ∈ Br.Piece (generator_degree i)
  incl_range : ∀ i,
    (incl i).range = Algebra.adjoin k ({Br.d i} : Set Br.Carrier)
  augmentation : ∀ i, Hnk i →ₐ[k] k
  augmentation_generator : ∀ i, augmentation i (generator i) = 0
  induced : ∀ i,
    LQInducedCell k Br.Carrier Br.internalGrading
      (Hnk i) (incl i) (augmentation i)

attribute [instance] LQCellFamily.hnkRing LQCellFamily.hnkAlgebra

/-- A finite filtration whose layers are grading shifts of the fixed induced module `W_k`.
Every filtration stage is a genuinely graded `H_n`-submodule, and every layer projection is
a degree-zero `H_n`-linear map to the actual shift `W_k{r}`. -/
structure LQFilteredByCell {n t : ℕ} {F : CyclotomicFactorization n t}
    {R : CyclotomicRootData k F} {Br : CyclotomicBraidedDatum k F R}
    (Cells : LQCellFamily k F R Br) (cell : Fin t)
    (V : Type x) [AddCommGroup V] [Module k V] [Module Br.Carrier V]
    [IsScalarTower k Br.Carrier V]
    (VGrading : GradedModuleDatum ℤ k Br.Carrier V Br.internalGrading) where
  length : ℕ
  Fil : Fin (length + 1) → Submodule Br.Carrier V
  FilGrading : ∀ r,
    GradedModuleDatum ℤ k Br.Carrier (Fil r) Br.internalGrading
  filtration_piece : ∀ r g (z : Fil r),
    z ∈ (FilGrading r).Piece g ↔ (z : V) ∈ VGrading.Piece g
  zero_stage : Fil ⟨0, Nat.zero_lt_succ _⟩ = ⊥
  top_stage : Fil ⟨length, Nat.lt_succ_self _⟩ = ⊤
  monotone : ∀ i : Fin length,
    Fil i.castSucc ≤ Fil i.succ
  shift : Fin length → ℤ
  layerProjection : ∀ i : Fin length,
    GradedLinearMap (FilGrading i.succ)
      ((Cells.induced cell).grading.shift (shift i))
  layer_exact : ∀ i : Fin length,
    Function.Exact
      (Submodule.inclusion (monotone i)) (layerProjection i).toLinearMap
  layer_surjective : ∀ i : Fin length,
    Function.Surjective (layerProjection i).toLinearMap

/-- `I_k` recognition data: for `t>1`, a retract of a finite `W_k`-filtered module; for
`t=1`, the separate constructor is a projective-injective module. -/
inductive LQIdealPiece {n t : ℕ} {F : CyclotomicFactorization n t}
    {R : CyclotomicRootData k F} {Br : CyclotomicBraidedDatum k F R}
    (Cells : LQCellFamily k F R Br) (cell : Fin t)
    (U : Type x) [AddCommGroup U] [Module k U] [Module Br.Carrier U]
    [IsScalarTower k Br.Carrier U]
    (UGrading : GradedModuleDatum ℤ k Br.Carrier U Br.internalGrading)
  | multiplePrimes (ht : 1 < t)
      (V : Type x) [AddCommGroup V] [Module k V] [Module Br.Carrier V]
      [IsScalarTower k Br.Carrier V]
      (VGrading : GradedModuleDatum ℤ k Br.Carrier V Br.internalGrading)
      (filtered : LQFilteredByCell k Cells cell V VGrading)
      (section_ : GradedLinearMap UGrading VGrading)
      (retraction : GradedLinearMap VGrading UGrading)
      (retract : retraction.toLinearMap.comp section_.toLinearMap = LinearMap.id)
  | primePower (ht : t = 1)
      (projective : Module.Projective Br.Carrier U)
      (injective : Module.Injective Br.Carrier U)

/-- A chosen representative of an object of `I` is the literal finite direct sum of one graded
summand from every `I_k`; it is not an arbitrary carrier with an ungraded equivalence, nor a
mere union of the pieces. -/
structure LQIdealObject {n t : ℕ} {F : CyclotomicFactorization n t}
    {R : CyclotomicRootData k F} {Br : CyclotomicBraidedDatum k F R}
    (Cells : LQCellFamily k F R Br) where
  Piece : Fin t → Type x
  [pieceAddCommGroup : ∀ i, AddCommGroup (Piece i)]
  [pieceModuleK : ∀ i, Module k (Piece i)]
  [pieceModuleHn : ∀ i, Module Br.Carrier (Piece i)]
  [pieceScalarTower : ∀ i, IsScalarTower k Br.Carrier (Piece i)]
  pieceGrading : ∀ i,
    GradedModuleDatum ℤ k Br.Carrier (Piece i) Br.internalGrading
  piece_mem : ∀ i, LQIdealPiece k Cells i (Piece i) (pieceGrading i)

attribute [instance] LQIdealObject.pieceAddCommGroup LQIdealObject.pieceModuleK
  LQIdealObject.pieceModuleHn LQIdealObject.pieceScalarTower

/-- The underlying module of the chosen `I`-object representative. -/
abbrev LQIdealObject.Carrier {n t : ℕ} {F : CyclotomicFactorization n t}
    {R : CyclotomicRootData k F} {Br : CyclotomicBraidedDatum k F R}
    {Cells : LQCellFamily k F R Br} (I : LQIdealObject k Cells) :=
  DirectSum (Fin t) I.Piece

/-- A degree-zero map factors through a graded projective `H_n`-module. -/
def LQFactorsThroughProjective {n t : ℕ} {F : CyclotomicFactorization n t}
    {R : CyclotomicRootData k F} {Br : CyclotomicBraidedDatum k F R}
    {U V : Type x} [AddCommGroup U] [Module k U] [Module Br.Carrier U]
    [IsScalarTower k Br.Carrier U]
    [AddCommGroup V] [Module k V] [Module Br.Carrier V]
    [IsScalarTower k Br.Carrier V]
    (UGrading : GradedModuleDatum ℤ k Br.Carrier U Br.internalGrading)
    (VGrading : GradedModuleDatum ℤ k Br.Carrier V Br.internalGrading)
    (f : GradedLinearMap UGrading VGrading) : Prop :=
  ∃ (P : Type x) (_ : AddCommGroup P) (_ : Module k P)
      (_ : Module Br.Carrier P) (_ : IsScalarTower k Br.Carrier P)
      (PGrading : GradedModuleDatum ℤ k Br.Carrier P Br.internalGrading),
    Module.Projective Br.Carrier P ∧
      ∃ g : GradedLinearMap UGrading PGrading,
        ∃ h : GradedLinearMap PGrading VGrading,
          f.toLinearMap = h.toLinearMap.comp g.toLinearMap

/-- The concrete cross-freeness input: for distinct prime generators, maps between shifts of
the literal induced cells factor through projectives.  Its proof uses the standard multi-monomial
basis of `Br`, the concrete subalgebra ranges, and distinctness of the primes in `F`. -/
theorem lq_induced_cross_freeness {n t : ℕ} (F : CyclotomicFactorization n t)
    (R : CyclotomicRootData k F) (Br : CyclotomicBraidedDatum k F R)
    (Cells : LQCellFamily k F R Br) {i j : Fin t} (hij : i ≠ j) (r s : ℤ)
    (f : GradedLinearMap ((Cells.induced i).grading.shift r)
      ((Cells.induced j).grading.shift s)) :
    LQFactorsThroughProjective k _ _ f := by
  sorry

/-- Laugwitz--Qi Proposition 4.16: maps between distinct filtered pieces are already null in
the ordinary stable category.  Unlike an arbitrary-algebra statement, this theorem is indexed
by the fixed cyclotomic presentation and is proved by devissage from
`lq_induced_cross_freeness`. -/
theorem lq_cross_piece_factors_through_projective
    {n t : ℕ} (F : CyclotomicFactorization n t)
    (R : CyclotomicRootData k F) (Br : CyclotomicBraidedDatum k F R)
    (Cells : LQCellFamily k F R Br)
    {U V : Type x} [AddCommGroup U] [Module k U] [Module Br.Carrier U]
    [IsScalarTower k Br.Carrier U]
    [AddCommGroup V] [Module k V] [Module Br.Carrier V]
    [IsScalarTower k Br.Carrier V]
    (UGrading : GradedModuleDatum ℤ k Br.Carrier U Br.internalGrading)
    (VGrading : GradedModuleDatum ℤ k Br.Carrier V Br.internalGrading)
    {i j : Fin t} (hij : i ≠ j)
    (hU : LQIdealPiece k Cells i U UGrading)
    (hV : LQIdealPiece k Cells j V VGrading)
    (f : GradedLinearMap UGrading VGrading) :
    LQFactorsThroughProjective k UGrading VGrading f := by
  have crossFreeness :=
    lq_induced_cross_freeness k F R Br Cells (i := i) (j := j) hij
  sorry

end RelativeTheory

/-! ## Decategorified relation targets -/

section GrothendieckTargets

/-- For the characteristic-`p` primitive truncated Hopf algebra, with `p` prime and the
differential placed in grading degree one, the free-module relation is `[p]_q`. -/
noncomputable def primeStableRelation (p : ℕ) : Polynomial ℤ :=
  ∑ i ∈ Finset.range p, Polynomial.X ^ i

/-- Khovanov's Taft stable category has the geometric-sum relation for every `n`; for
composite `n` this quotient is generally not the cyclotomic integer ring. -/
noncomputable def taftStableRelation (n : ℕ) : Polynomial ℤ :=
  ∑ i ∈ Finset.range n, Polynomial.X ^ i

/-- Laugwitz--Qi's *Verdier quotient* imposes the exact cyclotomic relation. -/
noncomputable def cyclotomicVerdierRelation (n : ℕ) : Polynomial ℤ :=
  Polynomial.cyclotomic n ℤ

theorem prime_relation_eq_cyclotomic (p : ℕ) (hp : p.Prime) :
    primeStableRelation p = Polynomial.cyclotomic p ℤ := by
  sorry

end GrothendieckTargets

end TauCetiRoadmap.HopfologicalAlgebra
