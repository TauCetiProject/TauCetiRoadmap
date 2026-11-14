module

import Mathlib

/-!
# The Galois action on étale cohomology of geometric fibres: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, so that the finished roadmap
is tested against them.

Stated below: the identification of the absolute Galois group `G_K` of a complete
non-archimedean field `K`, of any characteristic, with the continuous `K`-algebra automorphisms
of the completed algebraic closure `C`, together with the joint continuity of the action
(README §0.2). It needs two simple definitions: `SpectralAlgClosure K`, Mathlib's
`AlgebraicClosure K` carrying the spectral norm, and `CompletedAlgClosure K`, its uniform
completion.

Headline theorems that are not statable at the pins, and the carrier each lacks:

* The rigid action `ρ(σ) = c_σ ∘ σ_X^*` on `H^i(X_C, ℱ_C)` as a left action by `Λ`-linear
  automorphisms, with its functoriality (README §§1.1–1.3), lacks the small étale site of an
  adic space with its base-change functoriality and sheaf cohomology (AdicEtaleGeometry A1.6):
  Tau Ceti has adic spaces (`TauCeti.AdicSpace`) but no étale site on them.
* The scheme action on `H^i(X_{k^sep}, M)` (README §1.4), its discreteness for qcqs `X`
  (§2.2) and the dictionary with higher direct images to `Spec k` (§2.4) lack the morphism of
  small étale sites induced by a morphism of schemes. Mathlib's `MorphismProperty.Over.pullback`
  gives the base-change functor between categories `Scheme.Etale`, but not its continuity for
  `Scheme.smallEtaleTopology`, so there is no exact inverse image on abelian sheaves and no
  comparison of constant sheaves, which are the inputs of Tau Ceti's `Sheaf.H.pullback`. The
  dictionary also lacks higher direct images and the equivalence between sheaves on
  `(Spec k)_ét` and discrete `G_k`-modules.
* Discreteness for rigid spaces (README §2.1) and the dictionary between `R^i f_* M` and
  `(H^i(X_C, M_C), ρ)` (§2.3) lack, besides the étale site of an adic space, higher direct
  images on it and the equivalence between sheaves on `Spa(K, 𝒪_K)_ét` and discrete
  `G_K`-modules.
* The identification of the Hochschild–Serre `E_2` term (README §2.5) lacks the Leray spectral
  sequence of a morphism of étale sites.
* Agreement with the scheme-side continuous action and the Frobenius normalisation
  (README §2.6) lacks the normalised adic systems with descent data and their continuous
  action (EtaleCohomologyFoundations §§F.4.1, F.4.6), as well as the scheme action above.
* The `ℓ`-adic and rational groups `H^i(X_C, ℤ_ℓ(j))`, `H^i(X_C, ℚ_ℓ(j))` as continuous
  representations (README §§3.1–3.3) lack the finite-level groups `H^i(X_C, ℤ/ℓ^n(j))`, that is,
  the étale cohomology of rigid spaces with twisted coefficients.
* Equivariant twisting (README §4.1) lacks the sheaf `μ_n` and its twists on the étale site of
  an adic space.
* The equivariant comparison with analytifications (README §4.2), for proper schemes with
  torsion coefficients and for schemes of finite type with constructible coefficients of order
  invertible in `K`, lacks the analytification of a scheme as an adic space and Huber's
  comparison morphism, besides the étale cohomology of adic spaces.
* The passage from finiteness to finitely generated and finite-dimensional continuous
  representations, and its instances (README §§4.3–4.4), lack the groups of README §3.1.
-/

noncomputable section

namespace TauCetiRoadmap.GaloisActionOnEtaleCohomology

universe u

/-! ## Layer 0: The Galois group and the completed algebraic closure -/

/-- The algebraic closure `K̄` of a field `K`, as a type synonym of `AlgebraicClosure K`. For a
complete non-archimedean `K` it carries the spectral norm, the unique power-multiplicative
extension of the absolute value of `K` (Mathlib's `spectralNorm_unique`). The synonym keeps that
norm from becoming an instance on `AlgebraicClosure K` itself. -/
def SpectralAlgClosure (K : Type u) [Field K] : Type u := AlgebraicClosure K

namespace SpectralAlgClosure

/-- The field structure of `AlgebraicClosure K`. -/
instance (K : Type u) [Field K] : Field (SpectralAlgClosure K) :=
  inferInstanceAs (Field (AlgebraicClosure K))

/-- The `K`-algebra structure of `AlgebraicClosure K`. -/
instance (K : Type u) [Field K] : Algebra K (SpectralAlgClosure K) :=
  inferInstanceAs (Algebra K (AlgebraicClosure K))

/-- `K̄` is algebraic over `K`. -/
instance (K : Type u) [Field K] : Algebra.IsAlgebraic K (SpectralAlgClosure K) :=
  inferInstanceAs (Algebra.IsAlgebraic K (AlgebraicClosure K))

/-- The spectral norm on `K̄`, for `K` complete for a nontrivial ultrametric absolute value. -/
instance (K : Type u) [NontriviallyNormedField K] [CompleteSpace K] [IsUltrametricDist K] :
    NormedField (SpectralAlgClosure K) :=
  spectralNorm.normedField K (SpectralAlgClosure K)

/-- `K̄` with the spectral norm is a normed `K`-algebra. -/
instance (K : Type u) [NontriviallyNormedField K] [CompleteSpace K] [IsUltrametricDist K] :
    NormedAlgebra K (SpectralAlgClosure K) :=
  spectralNorm.normedAlgebra K (SpectralAlgClosure K)

end SpectralAlgClosure

/-- The completed algebraic closure `C` of a complete non-archimedean field `K`: the uniform
completion of `K̄` for the spectral norm, a complete normed field and normed `K`-algebra
(README §0.1). For `K = ℚ_p` it agrees with Mathlib's `PadicComplex p`: Mathlib's
`PadicAlgCl p` is `AlgebraicClosure ℚ_[p]` with the same spectral norm, so the two completions
are the same normed field. -/
abbrev CompletedAlgClosure (K : Type u) [NontriviallyNormedField K] [CompleteSpace K]
    [IsUltrametricDist K] : Type u :=
  UniformSpace.Completion (SpectralAlgClosure K)

/-- **Galois automorphisms extend to `C`, and `G_K ≅ Aut_cont(C/K)`** (README §0.2). Let `K` be a
field complete for a nontrivial non-archimedean absolute value, of any characteristic. There is a
map `e` from the absolute Galois group `G_K = Field.absoluteGaloisGroup K` to the continuous
`K`-algebra automorphisms of the completed algebraic closure `C` such that

* `e σ` extends `σ` on `K̄ ⊆ C`;
* `e (σ * τ) = e σ ∘ e τ`, so that `e` is a homomorphism for composition;
* `e` is a bijection, so every continuous `K`-algebra automorphism of `C` comes from a unique
  element of `G_K`;
* the action map `G_K × C → C`, `(σ, x) ↦ e σ x`, is jointly continuous for the Krull topology.

The extension is the completion of `σ`, an isometry for the spectral norm; surjectivity holds
because a continuous `K`-endomorphism of `C` preserves `K̄`, and joint continuity because
fixing subgroups of finite subextensions are open (de Jong–van der Put, *Étale cohomology of
rigid analytic spaces*, §3.6). Mathlib's `ContinuousAlgEquiv` has no group structure at the pin,
so the group law is stated as composition. -/
theorem exists_galois_continuousAut_equiv (K : Type u) [NontriviallyNormedField K]
    [CompleteSpace K] [IsUltrametricDist K] :
    ∃ e : Field.absoluteGaloisGroup K → (CompletedAlgClosure K ≃A[K] CompletedAlgClosure K),
      (∀ (σ : Field.absoluteGaloisGroup K) (x : SpectralAlgClosure K),
        e σ (algebraMap (SpectralAlgClosure K) (CompletedAlgClosure K) x) =
          algebraMap (SpectralAlgClosure K) (CompletedAlgClosure K) (σ.toAlgHom x)) ∧
      (∀ (σ τ : Field.absoluteGaloisGroup K) (x : CompletedAlgClosure K),
        e (σ * τ) x = e σ (e τ x)) ∧
      Function.Bijective e ∧
      Continuous (fun p : Field.absoluteGaloisGroup K × CompletedAlgClosure K => e p.1 p.2) := by
  sorry

end TauCetiRoadmap.GaloisActionOnEtaleCohomology
