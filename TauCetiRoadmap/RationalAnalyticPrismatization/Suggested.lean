module

import Mathlib

/-!
# Rational analytic prismatization: target signatures

The roadmap is `README.md`; this file is not the roadmap. It is the roadmap's acceptance test: it
states, against the pinned Mathlib and Tau Ceti, those headline theorems of the roadmap that are
statable at the pins.

None of the headline theorems is statable at the pins, so this file states nothing. Every one of
them is a statement about Gelfand stacks: the ∞-topos of analytic stacks on separable Gelfand rings
over the light solid analytic ring `ℚ_{p,■}`, its quasi-coherent six-functor formalism (obtained
by transmutation into Scholze–Stefanich Gestalten), and the Gelfand stacks built in it, namely the
relative Fargues–Fontaine curve `FF_{X^⋄}`, the p-adic twistor stack `X^{Div¹}`, the analytic
Hodge–Tate stack `X^HT`, the prismatization `X^Δ` and the locally analytic group stacks `G^la`.
The pinned libraries lack the carriers these are built from: light solid analytic rings and their
derived ∞-categories of modules (Mathlib has light condensed objects, `LightCondensed`, and the
solidity predicate `CondensedMod.IsSolid` on condensed modules, but no analytic rings and no
derived ∞-category of solid modules), presentable ∞-categories, six-functor formalisms, Stefanich
rings and Gestalten, analytic stacks and Gelfand rings, de Rham stacks of arc-stacks, and the
pro-étale and v-cohomology of rigid spaces. Mathlib has quasicategories but none of these
constructions; Tau Ceti has the adic Fargues–Fontaine space `𝒴/φ^ℤ` only as a
topological space of valuations (`TauCeti.FarguesFontaine.spaX`), not as a Gelfand stack or with
quasi-coherent sheaves on it.

The headline theorems, with what each lacks:

* The comparison with the relative Fargues–Fontaine curve (README §11.6, with the arithmetic case
  §11.1 and the perfectoid-base case §11.4): for a smooth partially proper rigid space `X` over a
  finite extension of `ℚ_p`, `α_X : FF_{X^⋄} → X^{Div¹}` is 0-proper with `O ≅ α_{X,*} O`, and
  pullback gives `Perf(Y) ≃ Perf(FF_{X^⋄} ×_{X^{Div¹}} Y)` for every Berkovich-étale
  `Y → X^{Div¹}`. Lacks Gelfand stacks, `X^{Div¹}`, `FF_{X^⋄}` as a Gelfand stack, 0-proper maps
  and perfect complexes on Gelfand stacks.
* Pro-étale cohomology as twistor cohomology (README §11.7): for `X` as in the previous item,
  `Γ(X^{Div¹}, O) ≅ RΓ(FF_{X^⋄}, O) ≅ RΓ_v(X^⋄, ℚ_p) ≅ RΓ_proét(X, ℚ_p)`. Lacks `X^{Div¹}`,
  coherent cohomology of Gelfand stacks, and pro-étale and v-cohomology of rigid spaces.
* Hodge–Tate stacks and Sen theory (README §§11.2, 11.5, 11.8): `Perf(X^HT) ≃ Perf(X̂^⋄)` for
  `X = GSpec(K)`, `K` finite over `ℚ_p`, with the arithmetic Sen operator (`θ_{O{n}} = n`,
  recovering Tate's computation of `H^i(Gal_K, C_p(n))`), and for `X` rigid smooth over a
  perfectoid space, with the geometric Sen operator as a Higgs field; for a smooth rigid space `X`
  over `K`, the inverse Faltings' extension `L_{X^HT/X}[1]`. Lacks `X^HT`, cotangent complexes of
  Gelfand stacks and Cartier duality for analytic vector groups.
* Decompletion (README §§10.12, 11.9, 11.10): for a Berkovich space `X` with a continuous action
  of a p-adic Lie group `G`, `h : X/G^cont → |X|^Betti/G^la` is 0-proper with pullback fully
  faithful on modules over `O^la_X = h_* O` (not on all quasi-coherent sheaves: for `G` trivial
  and `X` the closed unit disc, `O` has endomorphisms `ℚ_p` on the connected `|X|^Betti` and
  `ℚ_p⟨T⟩` on `X`), and `Perf(X′^la/G^la) ≃ Perf(X′/G^cont)` under
  strong decompletion; for a smooth rigid space `X` over `ℚ_p`, pro-étale `G`-torsors on `X^⋄`
  are `G^la`-torsors on `X^HT`, with their Sen operators. Lacks Berkovich spaces as Gelfand
  stacks, the group stacks `G^cont`, `G^la`, `G^sm`, Betti realization and `X^HT`.
* Twistor duality (README §§12.2–12.4): `Div¹ → GSpec(ℚ_p)` is cohomologically smooth with
  dualizing complex `O{1}[2]` (local Tate duality); for a rigid smooth map `f : Y → X` of
  Berkovich spaces of pure relative dimension `d`, `f^{Div¹}` is cohomologically smooth and its
  base change to `FF_{X^⋄}` has dualizing complex `O{d}[2d]`, and `f^{Div¹,!} O ≅ O{d}[2d]` when
  `X` is a smooth partially proper rigid space over `ℚ_p`; for a smooth proper map of smooth
  partially proper rigid spaces over `ℚ_p`, `f^{Div¹}_*` preserves perfect complexes and
  satisfies Poincaré duality. Lacks six-functor formalisms on Gelfand stacks, `Div¹` and the
  Breuil–Kisin twist `O{1}`.
* The projective bundle formula (README §12.5): the prismatic first Chern class
  `c^Δ_1 : BG^Δ_m → B²V(O{1})` gives `⊕_{k=0}^d O{d−k}[2d−2k] ≅ f^Δ_* O{d}[2d]` for
  `f : P^d_X → X`, every Gelfand stack `X` over `ℚ_p` and every `d ≥ 1`. Lacks the
  prismatization `X^Δ`, animated abelian group stacks over it and pushforward along `f^Δ`.
* The Riemann–Hilbert functor (README §12.6): for a smooth rigid space `X` over `ℚ_p`, pullback
  along `Spf(B⁺_pdR,X) → X^{cone^}`, restricted to vector bundles, is the base change of
  Scholze's functor `E ↦ Fil⁰(E ⊗_O OB_dR,X)^{∇=0}`, and
  `X^{HT^} → X^{cone^} ×_{Â¹/G_m} Q_p^{HT^}` is a `T^dR_X{1}`-torsor. Lacks formal cones and
  formal Hodge–Tate stacks of Gelfand stacks, and the period sheaves `OB_dR,X` and `B⁺_pdR,X` on
  the pro-étale site of a rigid space.
-/

namespace TauCetiRoadmap.RationalAnalyticPrismatization

end TauCetiRoadmap.RationalAnalyticPrismatization
