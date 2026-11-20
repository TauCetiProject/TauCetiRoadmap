module

public import Mathlib

/-!
# p-adic local Langlands for GL₂(ℚ_p), Part II: target signatures

The roadmap is `README.md`; this file is not the roadmap. It is the acceptance test of the
roadmap: it states, against the pinned Mathlib and Tau Ceti, those headline theorems of the
roadmap that are statable at the pins. None of them is, so the file states nothing. Each
headline theorem, and the carrier it lacks, is listed below; the README states each one in full.

* The Galois-socle theorem (README §4.14): for an absolutely irreducible continuous representation
  `V` of `Gal(ℚ̄_p/ℚ_p)`, the multiplicity of `V` in the p-adic étale cohomology
  `H¹_ét(M^p_{n,C}, L(1))` of the p-central Drinfeld tower at level `n` is `Π(V)* ⊗ JL(M)` when
  `V ≅ V_{M,ℒ}` for a supercuspidal type `M` in `ΦNᵖ_n` (that is, `p` acts trivially on `JL(M)`
  and `JL(M)` is trivial on `K_D(n)`, where `K_D(0) = O_D^×` and `K_D(n) = 1 + ϖ_D^n O_D` for
  `n ≥ 1`), `(St^cont ⊗ δ∘det)* ⊗ δ∘Nrd` when `V = δ` is a character with `Sp ⊗ δ` in `ΦNᵖ_n`
  (that is, `δ(p)² = 1` and `δ∘Nrd` is trivial on `K_D(n)`), and `0` otherwise: in particular `0`
  when `dim V ≥ 3`, and `0` for `V ≅ V_{M,ℒ}` with `M` of level at most `n` and `p` acting
  nontrivially on `JL(M)`. Here `W*` is the continuous dual of a Banach space `W` with the
  topology of uniform convergence on compact subsets, on which `G` acts continuously; it does not
  act continuously on the norm dual. It lacks the Drinfeld tower as a rigid analytic space over
  `ℚ_p` with its `GL₂(ℚ_p) × D^× × Gal`-action, étale cohomology of rigid analytic spaces,
  admissible unitary Banach representations of `GL₂(ℚ_p)` and the correspondence `V ↦ Π(V)`.
* The Banach multiplicities (README §§4.12–4.13) of an absolutely irreducible admissible unitary
  Banach representation `Π` in differentials and in étale cohomology of the tower, counted by
  continuous `G`-maps out of `Π*`. They lack the same carriers, and the continuous dual of a
  Banach representation with the topology of compact convergence as a topological representation.
* The factorisation of the arithmetic completed cohomology (README §6.6): for `p > 3`,
  `H¹_ét(M^p_{n,ℚ̄_p}, L(1))` is the finite sum over the types `M` in `ΦNᵖ_n` of the completed
  sums over blocks `B` of `Π*(ρ_{B,M}) ⊗ ρ_{B,M} ⊗ Ř_{B,M}`, tensored with `JL(M)`. It lacks,
  besides the carriers above, the blocks of the category of locally admissible representations,
  their projective envelopes, the full Weil–Deligne type rings `R_{B,M}` with their universal
  Galois families, and the interpolated Banach dual `Π*(ρ_{B,M})`.
* The realisation for every supercuspidal type in the p-central sector (README §3.3): for a
  supercuspidal `M` in `ΦNᵖ_n` with `π = LL(M)`, the strong dual of the `M`-multiplicity of the
  functions on `M^p_n` is `Π_{M,ℒ}^an / π` for every line `ℒ`, and the de Rham multiplicity is
  `M_dR ⊗ π′` with the preimages of the lines the analytic duals, by the identification compatible
  with the Hyodo–Kato structure. It lacks rigid analytic functions and de Rham and Hyodo–Kato
  cohomology of the tower, locally analytic representations and the analytic vectors of a Banach
  representation.
* The discharge of the global hypotheses of the base comparison (README §3.1). It lacks, besides
  the carriers above, completed cohomology of definite quaternion algebras and the
  Čerednik–Drinfeld uniformisation of Shimura curves.
* The topological irreducibility of `Π(π,0)` (README §2.3) and Colmez's weight change (README
  §2.4). They lack locally analytic representations of `GL₂(ℚ_p)` on spaces of compact type, the
  Robba ring with its `(φ,Γ)`-modules and the sheaf `Δ ⊠ ℙ¹(ℚ_p)`.
* The weighted realisation and BGG row (README §7.2). Here and in the bullets on README §§7.4 and
  7.6, `π` is a supercuspidal representation of `GL₂(ℚ_p)` with trivial central character,
  `ρ = JL(π)`, `r ≥ 1` is such that `ρ` is trivial on `1 + p^r O_D`, and `V` is in the family of
  `π` (`Π(V)` has smooth vectors `π`); for a smaller `r` the `ρ`-parts vanish and the statements
  fail. For `k ≥ 0`, the row from `O(−k)(Σ_r)^ρ` to `O(k+2)(Σ_r)^ρ ⊗ det^(k+1)` has quotient
  `H¹_dR(Σ_r)^ρ ⊗ Sym^k`, and the inverse image of a period line is `Π(Δ_(k+1,ℒ))′_b ⊗ det^k`,
  including the unramified twist inside `Π(Δ_(k+1,ℒ))`. It lacks rigid functions on the Drinfeld
  covers, their weighted locally analytic actions, the BGG differential operator `(−d/dz)^(k+1)`,
  de Rham cohomology with its period-line quotient, and the locally analytic representation whose
  strong dual is that inverse image. The first-cover comparison of README §7.3 is its level-one
  specialisation and lacks the same carriers, together with the equivariant semistable model and
  its Hyodo–Kato comparison.
* The Iwasawa invariants of Drinfeld functions (README §7.4): `(O(Σ_r)^ρ)^{diag(p,1)=1}` is free
  of rank two over the distribution algebra `D(Γ)` and is the space of Iwasawa classes whose
  specialisations lie in the image of the Bloch–Kato exponential. It lacks rigid analytic
  functions on the tower, the distribution algebra of `ℤ_p^×` and Iwasawa cohomology of p-adic
  Galois representations with its Bloch–Kato exponential.
* The infinitely primitivable functions (README §7.5) on the cover `Σ_r` of DLB level `r` lie in
  `H⁰_dR(Σ_r) · O(Ω)`. It lacks the Drinfeld half-plane and its coverings as rigid analytic
  spaces with their functions.
* The filtered derived realisation (README §7.6): for `r` large,
  `Hom((Π(V)^an)′, RΓ_dR(Σ_r)^ρ[1]) ≅ D_dR(V)` as filtered spaces. It lacks the abelian category
  of coadmissible modules over the distribution algebra of `GL₂(ℚ_p)` (Mathlib's `DerivedCategory`
  is defined for every abelian category, so the category itself is what is missing), the de Rham
  complex of a rigid analytic space and the functor `D_dR` of a de Rham Galois representation.

The pinned Mathlib has the de Rham period rings `BDeRhamPlus` and `BDeRham` of a perfectoid ring
of integers and the linear-algebra and locally convex carriers the README cites, but none of the
carriers named above; the pinned Tau Ceti has none of them either. The extension lemma for a
partial operator with prescribed spectrum (README §4.3) and the rigidity of representations over
principal ideal domains (README §6.3) are statable at the pins, but they are steps of the routes,
not headline theorems, and the README states them.
-/

namespace TauCetiRoadmap.PadicLocalLanglandsForGL2QpPartII

end TauCetiRoadmap.PadicLocalLanglandsForGL2QpPartII
