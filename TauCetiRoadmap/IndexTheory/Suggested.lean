import Mathlib

/-!
# Elliptic index theory: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems that are statable against the pinned Mathlib and Tau Ceti, each with `sorry`.

Stated here (Layer 1.6): the operator-norm path components of the Fredholm maps between two
complex Hilbert spaces are classified by the Fredholm index, and every integer is an index
when the two spaces are unitarily equivalent and infinite-dimensional.

Not statable at the pins, with the carrier each one lacks:

* the Atiyah–Singer equality `ind_a = ind_t` and its compact-Lie equivariant form (Layer 5.5):
  elliptic pseudodifferential operators on closed manifolds, the compactly supported K-group
  `K_c(T*M)` of the cotangent bundle and the representation ring `R(G)`;
* the cohomological index formula (Layer 6.1): compactly supported rational cohomology of
  `T*M`, its Thom isomorphism, the Chern character and the Todd class;
* the de Rham index `χ(M)`, the Hirzebruch signature theorem, Hirzebruch–Riemann–Roch for the
  Dolbeault operator, Riemann–Roch on compact Riemann surfaces, the twisted spin Dirac formula
  with its consequences `8 · ind D⁺ = −σ(M)`, `σ(M) = −16α` and Rokhlin's theorem, and the
  vanishing of the index of differential operators in odd dimensions (Layer 7): elliptic
  operators on manifolds, characteristic classes paired with the fundamental class, the
  cup-product signature of a closed oriented manifold, sheaf cohomology of holomorphic bundles
  and spin structures;
* the holomorphic Lefschetz fixed-map formula (Layer 8.3): Dolbeault cohomology of a holomorphic
  vector bundle on a compact complex manifold and the endomorphism a holomorphic map induces on
  it.
-/

namespace TauCetiRoadmap.IndexTheory

/-! ## Layer 1: Hilbert Fredholm connectors -/

/-- The Fredholm locus: the continuous linear maps `E → F` that are Fredholm in Mathlib's sense
(`ContinuousLinearMap.IsFredholm`), as a subtype of `E →L[ℂ] F` with the subspace topology of
the operator norm. -/
abbrev FredholmLocus (E F : Type*) [NormedAddCommGroup E] [NormedSpace ℂ E]
    [NormedAddCommGroup F] [NormedSpace ℂ F] :=
  {T : E →L[ℂ] F // T.IsFredholm}

/-- **Norm-path classification of Fredholm maps.** For complex Hilbert spaces `E` and `F`, two
Fredholm maps `E → F` are joined by an operator-norm continuous path of Fredholm maps if and only
if their Fredholm indices agree. No separability is assumed. The forward direction is the local
constancy of the index; the converse is the content of the theorem (Freed, *The Atiyah–Singer
index theorem*, display (3.13), for the injectivity of the index on path components). -/
theorem normPath_iff_index_eq {E F : Type*} [NormedAddCommGroup E] [InnerProductSpace ℂ E]
    [CompleteSpace E] [NormedAddCommGroup F] [InnerProductSpace ℂ F] [CompleteSpace F]
    (S T : FredholmLocus E F) :
    Nonempty (Path S T) ↔ (S.val : E →ₗ[ℂ] F).index = (T.val : E →ₗ[ℂ] F).index := by
  sorry

/-- **Every integer is a Fredholm index.** If the complex Hilbert spaces `E` and `F` are
unitarily equivalent (equivalently, have the same Hilbert dimension) and infinite-dimensional,
then every integer is the index of a Fredholm map `E → F`: compose the equivalence with a power
of a unilateral shift or of its adjoint on a countably infinite orthonormal family, extended by
the identity on its orthogonal complement. With `normPath_iff_index_eq` this makes the index a
bijection from the norm-path components of the Fredholm locus onto `ℤ` (Freed, display (3.13)). -/
theorem exists_index_eq {E F : Type*} [NormedAddCommGroup E] [InnerProductSpace ℂ E]
    [CompleteSpace E] [NormedAddCommGroup F] [InnerProductSpace ℂ F] [CompleteSpace F]
    (e : E ≃ₗᵢ[ℂ] F) (hE : ¬ FiniteDimensional ℂ E) (n : ℤ) :
    ∃ T : FredholmLocus E F, (T.val : E →ₗ[ℂ] F).index = n := by
  sorry

end TauCetiRoadmap.IndexTheory
