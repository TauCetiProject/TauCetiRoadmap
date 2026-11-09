module

public import Mathlib
public import TauCeti.RepresentationTheory.Symmetric.TensorAction.Basic

/-!
# Cyclic homology, Lie algebra homology of matrices and quasi-free algebras: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
This file states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti, each
with `sorry`, together with the definitions their statements need, all with real bodies on native
carriers. The API around each target, the special cases and the Checks stay in the README.

Headlines stated, with their README targets:

* 2.2 `mem_range_permTensorActionAlgHom_of_commute_glAction`;
* 4.1 `IsQuasiFree.exists_lift_of_nilpotent`;
* 4.2 `isQuasiFree_freeAlgebra` and `not_isQuasiFree_mvPolynomial_fin_two`.

Headline owned elsewhere and not restated: 2.2's faithfulness threshold, that the permutations
of the factors of `(kʳ)^{⊗p}` are linearly independent exactly when `p ≤ r`, is Tau Ceti's
`TauCeti.permTensorActionAlgHom_injective_iff`, on the group-algebra map
`TauCeti.permTensorActionAlgHom` that 2.2 uses.

Headlines not stated, with the carrier each lacks at the pins:

* 1.1–1.3 (Connes' `Tor` description of cyclic homology, `Ext_Λ(k♮, k♮) ≅ k[u]`, the classifying
  space of `Λ`): Connes' cyclic category and cyclic modules, RefinedTraceMethods §1.1.
* 1.4 (cyclic homology of tensor algebras), 2.3–2.6 (the Loday–Quillen–Tsygan theorem, its
  low-degree corollary and the stability theorem), 3.1–3.2 (Goodwillie's theorems) and 4.4–4.6
  (the X-complex theorem, the Fedosov product, excision in periodic cyclic homology): cyclic,
  negative cyclic and periodic cyclic homology of an algebra, KTheoryFiniteLocalFields §4.0
  (`cyclicHomologyModel`) and RefinedTraceMethods §1.4.
* 2.1 and 2.6 (the Chevalley–Eilenberg complex and the stability theorem): Mathlib at the pins
  has neither the Chevalley–Eilenberg complex nor `Tor` over a noncommutative ring; the complex
  with its proof of `d² = 0` is target 2.1 itself.
* 5.1–5.3 (H-unitality, Wodzicki's excision, rational excision in K-theory): the bar complex
  `(A^⊗•, b′)` tensored with an arbitrary module (RefinedTraceMethods §1.2 has `b′` on cyclic
  modules only), Hochschild and cyclic homology (KTheoryFiniteLocalFields §4.0), and the K-theory
  of nonunital rings, GeneralAlgebraicKTheory §8.3.
* 5.4–5.5 (firm modules, Morita contexts): tensor products over noncommutative, nonunital rings,
  which Mathlib does not provide.
* 5.6 (Quillen's `K₀′` and its Morita invariance): reduced `K₀` of a nonunital ring,
  AlgebraicKTheory §3.4.
-/

@[expose] public section

universe u

open scoped TensorProduct

namespace TauCetiRoadmap.CyclicHomologyLieHomologyAndQuasiFreeAlgebras

/-! ## Layer 2: Lie algebra homology of matrices -/

section InvariantTheory

variable (k : Type u) [CommRing k] (r p : ℕ)

/-- **2.2.** The action of `x ∈ 𝔤𝔩_r(k)` on `(kʳ)^{⊗p}` as a derivation:
`x · (v₁ ⊗ ⋯ ⊗ v_p) = Σ_i v₁ ⊗ ⋯ ⊗ x v_i ⊗ ⋯ ⊗ v_p`. -/
noncomputable def glAction (x : Module.End k (Fin r → k)) :
    Module.End k (⨂[k] _ : Fin p, Fin r → k) :=
  ∑ i : Fin p, PiTensorProduct.map (Function.update (fun _ : Fin p => LinearMap.id) i x)

/-- **2.2.** Weyl's first fundamental theorem in Loday–Quillen's form: over a field of
characteristic zero, every endomorphism of `(kʳ)^{⊗p}` commuting with the action of `𝔤𝔩_r(k)` is
a linear combination of permutations of the tensor factors, that is, lies in the range of Tau
Ceti's `TauCeti.permTensorActionAlgHom`. -/
theorem mem_range_permTensorActionAlgHom_of_commute_glAction (K : Type u) [Field K] [CharZero K]
    (f : Module.End K (⨂[K] _ : Fin p, Fin r → K))
    (hf : ∀ x : Module.End K (Fin r → K), Commute f (glAction K r p x)) :
    f ∈ (TauCeti.permTensorActionAlgHom K r p).range := by
  sorry

end InvariantTheory

/-! ## Layer 4: quasi-free algebras -/

section QuasiFree

variable (k : Type u) [CommRing k] (A : Type u) [Ring A] [Algebra k A]

/-- **4.1.** A `k`-algebra `A` is quasi-free if every algebra map from `A` to the base of a
square-zero extension lifts: for every surjective `π : R →ₐ[k] S` whose kernel has zero
products, every `f : A →ₐ[k] S` is `π ∘ g` for some `g : A →ₐ[k] R`. -/
def IsQuasiFree : Prop :=
  ∀ (R S : Type u) [Ring R] [Algebra k R] [Ring S] [Algebra k S] (π : R →ₐ[k] S),
    Function.Surjective π → (∀ x y : R, π x = 0 → π y = 0 → x * y = 0) →
    ∀ f : A →ₐ[k] S, ∃ g : A →ₐ[k] R, π.comp g = f

variable {k A}

/-- **4.1.** A quasi-free algebra lifts along every surjection with nilpotent kernel: if every
product of `n` elements of the kernel of `π` vanishes, every `f : A →ₐ[k] S` lifts through `π`. -/
theorem IsQuasiFree.exists_lift_of_nilpotent (hA : IsQuasiFree k A) {R S : Type u} [Ring R]
    [Algebra k R] [Ring S] [Algebra k S] (π : R →ₐ[k] S) (hπ : Function.Surjective π) (n : ℕ)
    (hn : ∀ l : List R, l.length = n → (∀ x ∈ l, π x = 0) → l.prod = 0)
    (f : A →ₐ[k] S) : ∃ g : A →ₐ[k] R, π.comp g = f := by
  sorry

variable (k)

/-- **4.2.** Free algebras are quasi-free. -/
theorem isQuasiFree_freeAlgebra (X : Type u) : IsQuasiFree k (FreeAlgebra k X) := by
  sorry

/-- **4.2.** The polynomial algebra in two variables over a field is not quasi-free: its
Hochschild cohomological dimension is two. -/
theorem not_isQuasiFree_mvPolynomial_fin_two (K : Type u) [Field K] :
    ¬ IsQuasiFree K (MvPolynomial (Fin 2) K) := by
  sorry

end QuasiFree

end TauCetiRoadmap.CyclicHomologyLieHomologyAndQuasiFreeAlgebras
