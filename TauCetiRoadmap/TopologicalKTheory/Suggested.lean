module

public import Mathlib

/-!
# Topological K-theory: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned
Mathlib and Tau Ceti, the roadmap's headline theorems that are statable now, each with
`sorry` as a mathematical target.

One headline theorem is statable at the pins and is stated: real Bott periodicity in the
homotopy of the orthogonal groups (T7.1), `π_k(O) ≅ KO^(−k−1)(pt)`, read on the finite
groups `Matrix.orthogonalGroup (Fin n) ℝ` in the stable range `n ≥ k + 2`
(`nonempty_homotopyGroup_orthogonalGroup_mulEquiv`).

The other headline theorems are not statable at the pins, and nothing is stated in their
place:

* complex Bott periodicity `K(X) ⊕ K(X) ≃ K(X × S²)` and the sphere ring
  `K(S²) ≃ ℤ[β]/(β²)` (T4): the pinned Tau Ceti has the constant-rank bundle category
  `TauCeti.FiniteRankBundleCore ℂ X` with its Whitney biproducts, so `TauCeti.SplitK0` of
  it is a group, and the tautological line on `TauCeti.finiteGrassmannian ℂ 1 2 ≅ ℂP¹` is
  an object of it by `TauCeti.FiniteRankBundleCore.ofBundle`; but the category has no
  tensor product and no external product of bundles, so neither `β² = 0` nor the
  periodicity map can be stated, and there is no variable-rank bundle category;
* the complex Thom isomorphism (T5.3): no K-group of a locally compact space with compact
  supports and no Koszul Thom class of a vector bundle in K-theory;
* the equivariant Thom isomorphism and the representation Bott theorem
  `R(G) ≃ K_(G,c)(V)` (T6): no equivariant K-group of a `G`-space;
* real Bott periodicity in K-theory, `KO^n(X,Y) ≃ KO^(n−8)(X,Y)` as the product with the
  degree −8 class `b`, and the coefficient ring `ℤ[η,a,b,b⁻¹]/(2η,η³,ηa,a²−4b)` (T7.1): no
  relative or negative-degree KO-group of a space and no product of real bundles;
* the (1,1)-periodicity of Real K-theory (T7.1): no KR-group of a space with involution;
* the eightfold stable Bott equivalence `ℤ × BO → Ω⁸(ℤ × BO)` (T7.1): no stable
  Grassmannian `BO`;
* numerable `BU(n)`/`BO(n)` classification (T1.6a): no stable Grassmannian colimit carriers
  `Gr_k∞(𝕜)`, `BO` and `BU`.

The finite Grassmannian carriers, the finite trivial embedding and complement, the gap
partition of unity, the finite oriented carriers and the principal-bundle class that T1.3,
T1.5, T1.6a and T6.4 consume are Tau Ceti declarations at the pin, cited by name in the
README and not restated here.
-/

@[expose] public section

namespace TauCetiRoadmap.TopologicalKTheory

/-! ## T7.1: real Bott periodicity in the homotopy of the orthogonal groups -/

/-- Real Bott periodicity for the orthogonal groups in the stable range: for `k = i + 1 ≥ 1`
and `n ≥ k + 2`, the homotopy group `π_k(O(n))` at the identity is `ℤ/2, ℤ/2, 0, ℤ, 0, 0, 0, ℤ`
according as `k ≡ 0, 1, …, 7 (mod 8)`, read off the table with `ZMod 0 = ℤ` and `ZMod 1`
trivial. This is T7.1's `π_k(O) ≅ KO^(−k−1)(pt)` on the finite stages, through the stable
range of the block inclusions (Hatcher, *Vector Bundles and K-Theory*, Introduction, p. 1,
for the table of reduced KO of spheres, and §4.1, p. 108, for the stable range). -/
theorem nonempty_homotopyGroup_orthogonalGroup_mulEquiv (i n : ℕ) (hn : i + 3 ≤ n) :
    Nonempty (HomotopyGroup.Pi (i + 1) (Matrix.orthogonalGroup (Fin n) ℝ) 1 ≃*
      Multiplicative (ZMod (![2, 2, 1, 0, 1, 1, 1, 0]
        ⟨(i + 1) % 8, Nat.mod_lt _ (by norm_num)⟩))) := by
  sorry

end TauCetiRoadmap.TopologicalKTheory
