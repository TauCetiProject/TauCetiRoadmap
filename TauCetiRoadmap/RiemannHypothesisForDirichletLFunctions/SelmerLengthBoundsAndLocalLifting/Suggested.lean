import Mathlib

/-!
# Selmer length bounds and local lifting: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti. None of them is
statable at the pins, so nothing is stated here.

The global headlines are statements about Selmer groups of `p`-adic Galois lattices over a number
field `F`: subgroups of the continuous cohomology of `G_F` with coefficients `T ⊗_O B`, for an
`O`-lattice `T` and a discrete `p`-power-torsion module `B` over a group ring, cut out by a local
condition at every place through the restrictions to the decomposition groups: the image of a
saturated submodule `ℒ_v ⊆ H¹(F_v, T)` above `p`, no condition at finitely many other places, and
the unramified classes elsewhere (SelmerIwasawaCohomology §§2.1, 2.9, 2.13). The local headlines are
statements about lattices in crystalline representations of `G_K`, for finite extensions `K` of
`ℚ_p`, their Hodge–Tate weights at the embeddings of `K`, and the Bloch–Kato finite classes
`H¹_f(K, T)` (SelmerIwasawaCohomology §4.9). Mathlib has continuous cohomology
(`continuousCohomology` of a `TopRep`, a module over the coefficient ring) with its functoriality
`ContinuousCohomology.map` along continuous group homomorphisms and coefficient maps, the absolute
Galois group `Field.absoluteGaloisGroup` with its functoriality `Field.absoluteGaloisGroup.map` along
field maps, the Tate–Shafarevich group `ContinuousCohomology.tateShafarevich` along a family of
field extensions, the algebraic tensor product of representations (`Representation.tprod`), the
`p`-adic cyclotomic character, CM fields (`NumberField.IsCMField`), `Module.length`, and the de Rham
period rings `BDeRhamPlus` and `BDeRham` of a perfectoid ring; Mathlib's
`IsDedekindDomain.selmerGroup` is the group `K(S, n)` inside `K^×/K^{×n}`, not a Selmer group of a
Galois lattice. Tau Ceti has Selmer structures `TauCeti.ContCohomology.SelmerStructure`, whose
Selmer group `TauCeti.ContCohomology.SelmerStructure.selmerGroup` is cut out by an arbitrary
subgroup of each local `H¹`, localised along continuous group maps such as
`Field.absoluteGaloisGroup.map` to the completions at the places of a number field; the inertia
subgroup `TauCeti.inertiaSubgroup` of the absolute Galois group of a nonarchimedean local field,
which gives the unramified conditions; local Tate duality for finite `ZMod n`-coefficients; and
Fitting ideals (`TauCeti.fittingIdeal`). So a Selmer group of a continuous Galois module over a
number field, with prescribed local conditions, is expressible at the pins. What neither library
has is the coefficient module of the global headlines as a continuous representation: the tensor
product `T ⊗_O B` of a lattice `T` with a discrete `p`-power-torsion module `B`, with the Galois
action twisted by a character, as a topological module with continuous Galois action (a `TopRep`,
or the coefficients that Tau Ceti's `H1` takes), and with it the maps on `H¹(F_v, ·)` induced by
`t ↦ t ⊗ b`, through which the local condition above `p`, the image of `ℒ_v ⊗_O B`, is defined.
Neither has `B_cris`, crystalline or de Rham representations, `D_cris` and `D_dR` with the Hodge
filtration, Hodge–Tate weights, or the Bloch–Kato subgroup `H¹_f`.

* Lengths of twisted Selmer groups (3.22 (2), 3.23): if the local condition `ℒ` above `p` is
  balanced and `T/λT` and its Tate dual have no `G_F`-invariants, the Selmer functor over the group
  ring `O[(ℤ/p^M)^J]` of characters `d_j` trivial above `p` and unramified outside a finite set `Q`
  is the kernel of one square matrix `Φ` over the maximal ideal, and the length of the Selmer group
  of the twist by `∏_j u_j^{d_j}` is the valuation of a lift of `det Φ` at `(u_j − 1)_j`. It lacks
  the coefficient modules `T ⊗_O B` twisted by `κ^{−1}`, for discrete `p`-power-torsion modules `B`
  over the group ring, and `T ⊗_O E′/O′` twisted by `ψ_u^{−1}`, as continuous representations of
  `G_F`, and the maps `H¹(F_v, T) → H¹(F_v, T ⊗_O B)` that carry `ℒ_v` into them; without these the
  Selmer groups of the statement have no local condition above `p`. Given the coefficient module and
  its local conditions, the Selmer group itself is a
  `TauCeti.ContCohomology.SelmerStructure.selmerGroup`. The presentation `Φ` is itself the content
  of 3.22 (2).
* Twist selection (3.26): over a CM field, for finitely many residually absolutely irreducible,
  conjugate self-dual lattices with balanced conditions and a common element of
  `G_{F(μ_{p^∞})}` acting by scalars `ϑ_s` with `ϑ_s² ≠ 1`, one anticyclotomic character `ψ` of
  `p`-power order, ramified at a bounded number of places, makes every Selmer group of a twist by
  `ψ^m` (`m` prime to `p`) of length at most `(ν_s + ε′)·length(O′/p)`, and at most
  `ε′·length(O′/p)` in the residually non-self-twisted case. It lacks the same carrier: the
  coefficient modules `T_s ⊗_O E′/O′`, with the action twisted by `ψ^m`, as continuous
  representations of `G_F`, and the maps carrying the conditions `ℒ_{s,v}` into their `H¹`.
* Invariants modulo a lattice (4.9d): for `V` crystalline over `K₀(μ_{p^s})` with Hodge–Tate
  weights in `[−M₀, h₀]` and `0` not a weight at an embedding `τ`, `p^c` kills `H⁰(K, V/T)` for every
  stable lattice `T`, with `c = 2 + Σ_u(2s + n₀ + 1 + v_p(u))` over the distinct weights `u` at `τ`.
  It lacks crystalline representations and their Hodge–Tate weights at an embedding.
* Lifting with loss (4.10c (3), 4.10e (1′)): for a surjection `f : T₁ ↠ T₂` of lattices in
  crystalline representations, `p^{e°}·H¹_f(K, T₂) ⊆ f(H¹_f(K, T₁))` with
  `e° ≤ 23(2 + H/p + log_p(H + 1))` over an unramified `K` and `p` odd, and with the exponent
  `32(2h·s_N + 1) + s_N + ⌊log_p 2h⌋ + ⌊log_p N⌋ + 1` over the subfields of `ℚ_p(μ_{lcm(p,N)})`. It
  lacks, besides crystalline representations and their weights, the Bloch–Kato subgroup `H¹_f` of a
  lattice; the exact exponent `e°` is defined through Wach lattices
  (WachLatticesOverTheCyclotomicTower §6.10), which are absent as well.

The specialisation lemma 3.25b, on the values at roots of unity of finitely many polynomials over
the integers of a finite extension of `ℚ_p`, and the square presentation of a left-exact functor on
torsion modules over a complete Noetherian local ring, 3.22 (3), are statements of algebra close to
the pins; each is a step of the route to twist selection, not a headline, and neither is stated
here.
-/

namespace TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.SelmerLengthBoundsAndLocalLifting

end TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.SelmerLengthBoundsAndLocalLifting
