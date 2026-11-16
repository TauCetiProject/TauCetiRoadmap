module

import Mathlib
import TauCeti.RingTheory.HochschildCohomology.Coboundary
import TauCeti.RingTheory.CyclicCohomology.Normalized.Chains
import TauCeti.RingTheory.CyclicCohomology.Normalized.Basic

/-!
# Hochschild homology and the Hochschild–Kostant–Rosenberg theorem: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
real-bodied definitions those statements need: the Hochschild cocycles, coboundaries and
cohomology `HHⁿ(A, M) = Zⁿ(A, M) / Bⁿ(A, M)` of an algebra with coefficients in a bimodule, built on
Tau Ceti's coboundary `TauCeti.hochschildBimoduleCoboundary` (README §1.2); the cup product of
cochains (§5.1); and, for a commutative algebra, the cup product of derivations and the
determinant cochain (§7.5). Hochschild homology with coefficients in the algebra is read on Tau
Ceti's normalised chains `TauCeti.normalizedHochschildChains.chainComplex k R`, which §2.1 identifies
with the normalised complex `N_•(R, R)`, homotopy equivalent to `C_•(R, R)`, so that their homology
is `HH_•(R, R)`. The README carries every target, API list and Check.

Stated here:

* `exists_homotopyEquiv_normalizedHochschildCochainComplexι` (§2.2): over every `k`, the inclusion
  of Tau Ceti's normalised Hochschild cochains into its Hochschild cochain complex
  `TauCeti.hochschildCochainComplex k A N` is a homotopy equivalence, the case
  `M = A →ₗ[k] N` (the dual bimodule) of the normalisation theorem for cochains;
* `homology_one_linearEquiv_kaehler` (§3.4): for every commutative `R`, `HH₁(R, R) ≅ Ω¹_{R/k}`,
  the class of `r₀ ⊗ r₁` going to `r₀ dr₁`;
* `nonempty_linearEquiv_ext` (§4.4): for `A` projective over `k`, `HHⁿ(A, M) ≅ Extⁿ_{Aᵉ}(A, M)`
  as `k`-modules, `Ext` taken in `ModuleCat (A ⊗[k] Aᵐᵒᵖ)`;
* `cupProduct_graded_comm` (§6.2): the cup product on `HH^•(A, A)` is graded commutative;
* `detCochain_sub_factorial_smul_cupDerivations_mem` (§7.5): for every commutative `R`, the
  determinant cocycle `⟨D₁, …, Dₙ⟩` represents `n!` times the class of `D₁ ∪ ⋯ ∪ Dₙ`;
* `cohomological_hkr_hom_kaehler` and `cohomological_hkr` (§7.6): for `R` smooth and projective
  over `k`, `HHⁿ(R, M) ≅ Hom_R(Ωⁿ_{R/k}, M)` with its explicit formula, and
  `⋀ⁿ_R Der_k(R) ≅ HHⁿ(R, R)`, `D₁ ∧ ⋯ ∧ Dₙ ↦ [D₁ ∪ ⋯ ∪ Dₙ]`;
* `homological_hkr_mvPolynomial` (§8.4 in homology): for `R = MvPolynomial (Fin m) k` over every
  `k`, the antisymmetrisation `r₀ dr₁ ∧ ⋯ ∧ drₙ ↦ [Σ_σ sgn(σ) r₀ ⊗ r_{σ(1)} ⊗ ⋯ ⊗ r_{σ(n)}]` is an
  isomorphism `Ωⁿ_{R/k} ≅ HHₙ(R, R)`.

The pins give neither `HHⁿ(R, M)` nor the homology of the pinned normalised chains an `R`-module
structure (§1.5 constructs it on the complexes of Layer 1), so the isomorphisms of §3.4, §7.6 and
§8.4 are stated as `k`-linear equivalences with prescribed values on generators, which determine
them; a class in homology is written as the image under `HomologicalComplex.homologyπ` of a cycle
whose image under `HomologicalComplex.iCycles`, followed by the identification
`TauCeti.normalizedHochschildChains.chainComplexXIso` of the terms with the normalised chains, is
the given chain. Clauses (3)–(5) of §7.6 (the
factor `n!`, the normalised HKR map when `n!` is invertible, and the vanishing above the number of
generators of `Ω¹_{R/k}`) follow from `cohomological_hkr_hom_kaehler`, `cohomological_hkr` and
`detCochain_sub_factorial_smul_cupDerivations_mem`; the polynomial case of the cohomological HKR
theorem (§8.4 in cohomology) and the Jacobian determinant of §8.5 are the instances
`R = MvPolynomial (Fin m) k` of `cohomological_hkr` and of
`detCochain_sub_factorial_smul_cupDerivations_mem`.

Headline theorems that are not statable at the pins, and what each lacks:

* `HHₙ(A, M) ≅ Torₙ^{Aᵉ}(M, A)` for `A` flat over `k` (§4.5): the pins have no Hochschild chain
  complex with bimodule coefficients (Tau Ceti's normalised chains
  `TauCeti.normalizedHochschildChains` have coefficients in `A` only, and the chain complex
  `C_•(A, M)` is the alternating face complex of a simplicial module whose simplicial identities
  are §1.1's theorem), and no `Tor` over the noncommutative ring `Aᵉ` (Mathlib's `Tor` is for
  commutative rings; the left derived functors of `M ⊗_{Aᵉ} −` are §4.5's construction);
* the normalisation theorem for chains, and for cochains with coefficients in an arbitrary
  bimodule (§§2.1–2.2), that the normalised complexes are homotopy equivalent to the full ones: the
  pins have no unnormalised Hochschild chain complex (Tau Ceti's
  `TauCeti.normalizedHochschildChains` is the normalised one) and no normalised cochain complex with
  bimodule coefficients (Tau Ceti's `TauCeti.normalizedHochschildCochainComplex` has coefficients in
  a dual bimodule only); `N_•(A, M)` and `N^•(A, M)` are constructions whose differentials need the
  simplicial identities of §§1.1–1.2;
* the description of the isomorphism of §4.4 as `ProjectiveResolution.extMk` on the bar
  resolution, its naturality in `M`, and the comparison of the cup product with the Yoneda product
  (§5.4): the bar resolution as a `ProjectiveResolution` of `A` in `ModuleCat Aᵉ` is §4.2's
  construction, and the sign `s(p, q)` of §5.3 for `p, q ≥ 1` is fixed by Mathlib's shift
  conventions with no closed form at the pins;
* the classification of `k`-split square-zero extensions by `HH²(A, M)` (§3.6): its carriers, the
  twisted extension `A ⊕_f M` as a `k`-algebra (whose associativity is the cocycle identity,
  §3.5) and the class of a `k`-split extension of a possibly noncommutative algebra (Tau Ceti's
  `TauCeti.SquareZeroExtension` is commutative), are constructions whose definitions are theorems.
-/

namespace TauCetiRoadmap.HochschildHomologyAndHKR

open CategoryTheory MulOpposite TensorProduct

universe u

/-! ## Layer 1: Hochschild complexes with bimodule coefficients -/

/-- The Hochschild `n`-cocycles `Zⁿ(A, M)` of a `k`-algebra `A` with coefficients in an
`A`-bimodule `M` (a left `A`-module and a left `Aᵐᵒᵖ`-module, the right action of `a` being
`op a • m`; the definition does not ask the two actions to commute): the `k`-multilinear maps `Aⁿ → M` killed by the Hochschild coboundary
`(δf)(a₁, …, aₙ₊₁) = a₁ f(a₂, …, aₙ₊₁) + Σᵢ (-1)ⁱ f(…, aᵢaᵢ₊₁, …) + (-1)ⁿ⁺¹ f(a₁, …, aₙ) aₙ₊₁`
(README §1.2; Ginzburg, *Lectures on noncommutative geometry*, §5.2). -/
def hochschildBimoduleCocycles (k A M : Type u) [CommRing k] [Ring A] [Algebra k A]
    [AddCommGroup M] [Module k M] [Module A M] [Module Aᵐᵒᵖ M] [IsScalarTower k A M]
    [IsScalarTower k Aᵐᵒᵖ M] (n : ℕ) : Submodule k ((Fin n → A) →ₘₗ[k] M) :=
  LinearMap.ker (TauCeti.hochschildBimoduleCoboundary k A M n)

/-- The Hochschild `n`-coboundaries `Bⁿ(A, M)`: `0` in degree `0`, and in degree `n + 1` the image
of the coboundary of `n`-cochains (README §1.2). -/
def hochschildBimoduleCoboundaries (k A M : Type u) [CommRing k] [Ring A] [Algebra k A]
    [AddCommGroup M] [Module k M] [Module A M] [Module Aᵐᵒᵖ M] [IsScalarTower k A M]
    [IsScalarTower k Aᵐᵒᵖ M] : (n : ℕ) → Submodule k ((Fin n → A) →ₘₗ[k] M)
  | 0 => ⊥
  | n + 1 => LinearMap.range (TauCeti.hochschildBimoduleCoboundary k A M n)

/-- Hochschild cohomology `HHⁿ(A, M) = Zⁿ(A, M) / Bⁿ(A, M)` of a `k`-algebra `A` with coefficients
in an `A`-bimodule `M`, defined as the quotient of `Zⁿ` by `Bⁿ ∩ Zⁿ`. When the two actions commute
(`SMulCommClass A Aᵐᵒᵖ M`, part of the bimodule convention of README §1.2), `Bⁿ ≤ Zⁿ` and this is
the cohomology in degree `n` of the Hochschild cochain complex (README §1.2; Loday, *Cyclic
homology*, §1.5); without that hypothesis `δ ∘ δ` need not vanish, and no statement below uses the
definition there. -/
abbrev hochschildBimoduleCohomology (k A M : Type u) [CommRing k] [Ring A] [Algebra k A]
    [AddCommGroup M] [Module k M] [Module A M] [Module Aᵐᵒᵖ M] [IsScalarTower k A M]
    [IsScalarTower k Aᵐᵒᵖ M] (n : ℕ) : Type u :=
  hochschildBimoduleCocycles k A M n ⧸
    (hochschildBimoduleCoboundaries k A M n).comap (hochschildBimoduleCocycles k A M n).subtype

/-! ## Layer 2: Normalisation -/

/-- The normalisation theorem on Tau Ceti's Hochschild cochains (README §2.2): for every commutative
ring `k`, every `k`-algebra `A` and every `k`-module `N`, the inclusion of the normalised cochains
(the multilinear maps in `n + 1` arguments that vanish whenever an argument other than the zeroth
is `1`) into the full Hochschild cochain complex `TauCeti.hochschildCochainComplex k A N` is a
homotopy equivalence. Under currying of the zeroth argument it is the inclusion
`N^•(A, A →ₗ[k] N) → C^•(A, A →ₗ[k] N)` of the normalised cochains with coefficients in the dual
bimodule (Loday, *Cyclic homology*, §§1.1 and 1.5). -/
theorem exists_homotopyEquiv_normalizedHochschildCochainComplexι (k A N : Type u) [CommRing k]
    [Ring A] [Algebra k A] [AddCommGroup N] [Module k N] :
    ∃ e : HomotopyEquiv (TauCeti.normalizedHochschildCochainComplex k A N)
        (TauCeti.hochschildCochainComplex k A N),
      e.hom = TauCeti.normalizedHochschildCochainComplexι k A N := by
  sorry

/-! ## Layer 3: Low degrees and square-zero extensions -/

/-- Hochschild homology in degree one of a commutative algebra is the module of Kähler differentials
(README §3.4): for every commutative `k`-algebra `R`, flat or not, there is a `k`-linear isomorphism
from the first homology of the normalised Hochschild chains of `R` with coefficients in `R` (Tau
Ceti's complex, whose homology is `HH_•(R, R)` by README §2.1) to `Ω¹_{R/k}`, sending the class of
`r₀ ⊗ r₁`, the coefficient in slot `0`, to `r₀ dr₁`; every such tensor is a cycle, the degree-one
boundary `r₀ ⊗ r₁ ↦ r₀r₁ − r₁r₀` being zero (Loday, *Cyclic homology*, §1.1; Ginzburg, *Lectures
on noncommutative geometry*, §8.1). -/
theorem homology_one_linearEquiv_kaehler (k R : Type u) [CommRing k] [CommRing R] [Algebra k R] :
    ∃ e : (TauCeti.normalizedHochschildChains.chainComplex k R).homology 1 ≃ₗ[k] Ω[R⁄k],
      ∀ r : Fin 2 → R, ∃ z : (TauCeti.normalizedHochschildChains.chainComplex k R).cycles 1,
        ((TauCeti.normalizedHochschildChains.chainComplex k R).iCycles 1 ≫
            (TauCeti.normalizedHochschildChains.chainComplexXIso k R 1).hom).hom z =
            TauCeti.normalizedHochschildChains.tensor k R 1 r ∧
          e (((TauCeti.normalizedHochschildChains.chainComplex k R).homologyπ 1).hom z) =
            r 0 • KaehlerDifferential.D k R (r 1) := by
  sorry

/-! ## Layer 4: The bar resolution, Ext and Tor -/

open scoped ModuleCat.Algebra in
/-- Hochschild cohomology is `Ext` over the enveloping algebra (README §4.4): for a `k`-algebra
`A` that is projective as a `k`-module and an `A`-bimodule `M`, regarded as a module over
`Aᵉ = A ⊗[k] Aᵐᵒᵖ` by `(a ⊗ op b) • m = a m b`, there is a `k`-linear isomorphism
`HHⁿ(A, M) ≅ Extⁿ_{Aᵉ}(A, M)`, `Ext` taken in `ModuleCat Aᵉ` with its `k`-linear structure
(Cartan–Eilenberg, *Homological algebra*, Chapter IX; Ginzburg, *Lectures on noncommutative
geometry*, §5.2). -/
theorem nonempty_linearEquiv_ext (k A M : Type u) [CommRing k] [Ring A] [Algebra k A]
    [AddCommGroup M] [Module k M] [Module A M] [Module Aᵐᵒᵖ M] [IsScalarTower k A M]
    [IsScalarTower k Aᵐᵒᵖ M] [SMulCommClass A Aᵐᵒᵖ M] [Module.Projective k A] (n : ℕ) :
    Nonempty (hochschildBimoduleCohomology k A M n ≃ₗ[k]
      Abelian.Ext (@ModuleCat.of (A ⊗[k] Aᵐᵒᵖ) _ A _ (instModuleTensorProductMop k A))
        (@ModuleCat.of (A ⊗[k] Aᵐᵒᵖ) _ M _ TensorProduct.Algebra.module) n) := by
  sorry

/-! ## Layer 5: The cup product -/

/-- The cup product of Hochschild cochains with coefficients in the algebra (README §5.1):
`(f ∪ g)(a₁, …, a_{p+q}) = f(a₁, …, a_p) · g(a_{p+1}, …, a_{p+q})`
(Gerstenhaber, *The cohomology structure of an associative ring*, §7). -/
def cupProduct (k A : Type u) [CommRing k] [Ring A] [Algebra k A] {p q : ℕ}
    (f : (Fin p → A) →ₘₗ[k] A) (g : (Fin q → A) →ₘₗ[k] A) : (Fin (p + q) → A) →ₘₗ[k] A :=
  ((LinearMap.mul' k A).compMultilinearMap (f.domCoprod g)).domDomCongr finSumFinEquiv

/-- The cup product feeds the first `p` arguments to `f` and the last `q` to `g`. -/
example (k A : Type u) [CommRing k] [Ring A] [Algebra k A] {p q : ℕ}
    (f : (Fin p → A) →ₘₗ[k] A) (g : (Fin q → A) →ₘₗ[k] A) (a : Fin (p + q) → A) :
    cupProduct k A f g a = f (fun i ↦ a (Fin.castAdd q i)) * g (fun j ↦ a (Fin.natAdd p j)) := by
  simp [cupProduct]

/-! ## Layer 6: Comparison with the graded and derived carriers -/

/-- Graded commutativity of Hochschild cohomology (README §6.2, from Gerstenhaber's homotopy
formula `g ∪ f − (−1)^{pq} f ∪ g = δf ∘ g + (−1)^q (δ(f ∘ g) − f ∘ δg)`): for cocycles
`f ∈ Zᵖ(A, A)` and `g ∈ Z^q(A, A)` of a `k`-algebra `A`, `g ∪ f − (−1)^{pq} f ∪ g` is a
coboundary, so `[g] ∪ [f] = (−1)^{pq} [f] ∪ [g]` in `HH^{p+q}(A, A)` (Gerstenhaber, *The
cohomology structure of an associative ring*, §7; Loday, *Cyclic homology*, §1.5). -/
theorem cupProduct_graded_comm (k A : Type u) [CommRing k] [Ring A] [Algebra k A] {p q : ℕ}
    {f : (Fin p → A) →ₘₗ[k] A} {g : (Fin q → A) →ₘₗ[k] A}
    (hf : f ∈ hochschildBimoduleCocycles k A A p) (hg : g ∈ hochschildBimoduleCocycles k A A q) :
    cupProduct k A g f -
        (-1 : ℤ) ^ (p * q) • (cupProduct k A f g).domDomCongr (finCongr (add_comm p q)) ∈
      hochschildBimoduleCoboundaries k A A (q + p) := by
  sorry

/-! ## Layer 7: Polyvector fields and the cohomological HKR theorem -/

/-- The cup product `D₁ ∪ ⋯ ∪ Dₙ` of derivations of a commutative `k`-algebra `R`, the Hochschild
`n`-cochain `(r₁, …, rₙ) ↦ D₁(r₁) ⋯ Dₙ(rₙ)` (README §7.5). -/
def cupDerivations (k R : Type u) [CommRing k] [CommRing R] [Algebra k R] {n : ℕ}
    (D : Fin n → Derivation k R R) : (Fin n → R) →ₘₗ[k] R :=
  (MultilinearMap.mkPiAlgebra k (Fin n) R).compLinearMap fun i ↦ (D i).toLinearMap

/-- The determinant cochain `⟨D₁, …, Dₙ⟩ : (r₁, …, rₙ) ↦ det (Dⱼ(rᵢ))` of derivations of a
commutative `k`-algebra `R` (README §7.5): `D₁ ∪ ⋯ ∪ Dₙ` evaluated on the alternation
`Σ_σ sgn(σ) r_{σ(1)} ⊗ ⋯ ⊗ r_{σ(n)}` of Ginzburg, *Lectures on noncommutative geometry*, §9.2. -/
def detCochain (k R : Type u) [CommRing k] [CommRing R] [Algebra k R] {n : ℕ}
    (D : Fin n → Derivation k R R) : (Fin n → R) →ₘₗ[k] R :=
  (Matrix.detRowAlternating.toMultilinearMap.restrictScalars k).compLinearMap
    fun _ ↦ LinearMap.pi fun j ↦ (D j).toLinearMap

/-- The determinant cocycle represents `n!` times the cup product of the derivations (README §7.5),
for every commutative `k`-algebra `R`: `⟨D₁, …, Dₙ⟩ − n! · (D₁ ∪ ⋯ ∪ Dₙ)` is a Hochschild
coboundary, so `[⟨D₁, …, Dₙ⟩] = n! [D₁ ∪ ⋯ ∪ Dₙ]` in `HHⁿ(R, R)`: the determinant is the signed
sum of the cup products `D_{σ(1)} ∪ ⋯ ∪ D_{σ(n)}`, whose classes are `sgn(σ) [D₁ ∪ ⋯ ∪ Dₙ]` by graded
commutativity (Hochschild–Kostant–Rosenberg, *Differential forms on regular affine algebras*, §5,
the product formula for cup products of derivations). -/
theorem detCochain_sub_factorial_smul_cupDerivations_mem (k R : Type u) [CommRing k]
    [CommRing R] [Algebra k R] {n : ℕ} (D : Fin n → Derivation k R R) :
    detCochain k R D - (n.factorial : k) • cupDerivations k R D ∈
      hochschildBimoduleCoboundaries k R R n := by
  sorry

/-- The cohomological Hochschild–Kostant–Rosenberg theorem, dual form (README §7.6(1)): for a
commutative `k`-algebra `R` that is smooth and projective as a `k`-module, and an `R`-module `M`
regarded as a symmetric bimodule, there is a `k`-linear isomorphism
`HHⁿ(R, M) ≅ Hom_R(Ωⁿ_{R/k}, M)` sending the class of a cocycle `f` to the map
`dr₁ ∧ ⋯ ∧ drₙ ↦ Σ_σ sgn(σ) f(r_{σ(1)}, …, r_{σ(n)})`, the evaluation of `f` on the
antisymmetrised chain (Hochschild–Kostant–Rosenberg, *Differential forms on regular affine
algebras*, Lemma 4.1, Theorem 5.1, and Theorem 5.2 over a perfect field; the homological form,
which this dualises, is Loday, *Cyclic homology*, Theorem 3.4.4). -/
theorem cohomological_hkr_hom_kaehler (k R : Type u) [CommRing k] [CommRing R] [Algebra k R]
    [Algebra.Smooth k R] [Module.Projective k R] (M : Type u) [AddCommGroup M] [Module R M]
    [Module Rᵐᵒᵖ M] [IsCentralScalar R M] [SMulCommClass R Rᵐᵒᵖ M] [Module k M]
    [IsScalarTower k R M] [IsScalarTower k Rᵐᵒᵖ M] (n : ℕ) :
    ∃ e : hochschildBimoduleCohomology k R M n ≃ₗ[k] (⋀[R]^n Ω[R⁄k] →ₗ[R] M),
      ∀ (f : (Fin n → R) →ₘₗ[k] M) (hf : f ∈ hochschildBimoduleCocycles k R M n) (r : Fin n → R),
        e (Submodule.Quotient.mk ⟨f, hf⟩)
            (exteriorPower.ιMulti R n fun i ↦ KaehlerDifferential.D k R (r i)) =
          ∑ σ : Equiv.Perm (Fin n), Equiv.Perm.sign σ • f (r ∘ σ) := by
  sorry

/-- The cohomological Hochschild–Kostant–Rosenberg theorem (README §7.6(2)): for a commutative
`k`-algebra `R` that is smooth and projective as a `k`-module, the polyvector fields
`⋀ⁿ_R Der_k(R)` are isomorphic to `HHⁿ(R, R)` by `r · D₁ ∧ ⋯ ∧ Dₙ ↦ [r · (D₁ ∪ ⋯ ∪ Dₙ)]`
(Hochschild–Kostant–Rosenberg, *Differential forms on regular affine algebras*, Theorem 5.2, for a
regular affine algebra over a perfect field; the homological form over a field is Weibel, *An
introduction to homological algebra*, Theorem 9.4.7). -/
theorem cohomological_hkr (k R : Type u) [CommRing k] [CommRing R] [Algebra k R]
    [Algebra.Smooth k R] [Module.Projective k R] (n : ℕ) :
    ∃ Ψ : ⋀[R]^n (Derivation k R R) ≃ₗ[k] hochschildBimoduleCohomology k R R n,
      ∀ (r : R) (D : Fin n → Derivation k R R),
        ∃ h : r • cupDerivations k R D ∈ hochschildBimoduleCocycles k R R n,
          Ψ (r • exteriorPower.ιMulti R n D) =
            Submodule.Quotient.mk ⟨r • cupDerivations k R D, h⟩ := by
  sorry

/-! ## Layer 8: Polynomial algebras through the Koszul resolution -/

/-- The homological Hochschild–Kostant–Rosenberg theorem for polynomial algebras over every
commutative ring (README §8.4): for `R = MvPolynomial (Fin m) k`, the antisymmetrisation
`r₀ dr₁ ∧ ⋯ ∧ drₙ ↦ [Σ_σ sgn(σ) r₀ ⊗ r_{σ(1)} ⊗ ⋯ ⊗ r_{σ(n)}]` is a `k`-linear isomorphism from
`Ωⁿ_{R/k} = ⋀ⁿ_R Ω¹_{R/k}` to the `n`-th homology of the normalised Hochschild chains of `R` with
coefficients in `R` (Tau Ceti's complex, whose homology is `HH_•(R, R)` by README §2.1); the
antisymmetrised chain, with the coefficient `r₀` in slot `0`, is a cycle. The route is the Koszul
bimodule resolution of README §§8.1–8.3, with no smoothness input (Loday, *Cyclic homology*, §3.2;
Hochschild–Kostant–Rosenberg, *Differential forms on regular affine algebras*, the Koszul
computation in the proof of Theorem 3.1). -/
theorem homological_hkr_mvPolynomial (k : Type u) [CommRing k] (m n : ℕ) :
    ∃ e : ⋀[MvPolynomial (Fin m) k]^n Ω[MvPolynomial (Fin m) k⁄k] ≃ₗ[k]
        (TauCeti.normalizedHochschildChains.chainComplex k (MvPolynomial (Fin m) k)).homology n,
      ∀ (r₀ : MvPolynomial (Fin m) k) (r : Fin n → MvPolynomial (Fin m) k),
        ∃ z : (TauCeti.normalizedHochschildChains.chainComplex k
            (MvPolynomial (Fin m) k)).cycles n,
          ((TauCeti.normalizedHochschildChains.chainComplex k
              (MvPolynomial (Fin m) k)).iCycles n ≫
              (TauCeti.normalizedHochschildChains.chainComplexXIso k
                (MvPolynomial (Fin m) k) n).hom).hom z =
              ∑ σ : Equiv.Perm (Fin n), Equiv.Perm.sign σ •
                TauCeti.normalizedHochschildChains.tensor k (MvPolynomial (Fin m) k) n
                  (Fin.cons r₀ (r ∘ σ)) ∧
            e (r₀ • exteriorPower.ιMulti (MvPolynomial (Fin m) k) n
                (fun i ↦ KaehlerDifferential.D k (MvPolynomial (Fin m) k) (r i))) =
              ((TauCeti.normalizedHochschildChains.chainComplex k
                (MvPolynomial (Fin m) k)).homologyπ n).hom z := by
  sorry

end TauCetiRoadmap.HochschildHomologyAndHKR
