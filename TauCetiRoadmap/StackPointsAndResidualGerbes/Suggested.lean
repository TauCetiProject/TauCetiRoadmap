module

import Mathlib

/-!
# Points of algebraic stacks, stabilisers and residual gerbes: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline theorems
against the pinned Mathlib and Tau Ceti when their carriers can be expressed with those APIs and a
few simple definitions.

The headline theorems are:

* finite type points (1.1, 4.1): a point of an algebraic stack is a finite type point iff it is the
  image of a closed point of a scheme smooth over the stack, iff its residual gerbe exists and is
  locally of finite type over the stack;
* the inertia criterion and the dense open gerbe (2.4, 2.6): an algebraic stack is a gerbe iff its
  inertia is flat and locally of finite presentation, and a reduced algebraic stack with
  quasi-compact inertia has a dense open substack which is a gerbe;
* existence of residual gerbes (4.2–4.4): on stacks with a flat, locally finitely presented,
  locally quasi-finite presentation (algebraic spaces, Deligne–Mumford and quasi-DM stacks), on
  gerbes, on stacks with quasi-compact inertia and on locally Noetherian stacks;
* closed points (4.5): on a locally Noetherian stack a point is closed iff its residual gerbe is a
  closed immersion, and it is then the reduced induced closed substack on the point;
* the residue field (5.3): on a decent stack a residual gerbe, where it exists, is a gerbe over the
  spectrum of a field `κ(x)`, unique up to unique isomorphism;
* algebraicity of points (5.4): through every point of a decent stack with quasi-compact inertia
  passes an immersed gerbe over an integral affine scheme, quasi-compactly immersed when the
  diagonal is quasi-compact;
* the residual gerbe at a representative (6.2, 6.3): on a decent stack, `𝒵_x ×_{κ(x)} k ≃ BG_x`
  for every representative `Spec k → 𝒳` of a point whose residual gerbe exists, and the canonical
  morphism `BG_x → 𝒵_x` is an equivalence exactly when `κ(x) → k` is an isomorphism;
* rational points (6.4): for a stack over a field `k` and a point `x` with `p ∘ x = id`, the
  residual gerbe exists and the canonical morphism `BG_x → 𝒵_x` is an equivalence, with
  `BG_x → 𝒳` a closed immersion when the stack is locally Noetherian and the point is closed;
* the tangent–normal sequence (7.3): at a closed rational point with affine stabiliser of a stack
  locally of finite type over a field, `0 → T_{BG_x} → T_{𝒳,x} → N_x → 0` is exact, so the
  comparison map `T_{𝒳,x} → N_x` is an isomorphism iff `G_x` is smooth.

None of them is statable at the pins. Every one is a statement about algebraic stacks, and the
pinned libraries have no algebraic stack: Tau Ceti's `TauCeti.AlgebraicGeometry.SchPseudofunctor`
is a `Cat`-valued pseudofunctor on schemes with no stack condition, Mathlib's
`CategoryTheory.Pseudofunctor.IsStack` is the descent condition alone, and Tau Ceti's
`TauCeti.AlgebraicGeometry.Spaces.IsAlgebraicSpace` concerns presheaves of sets. Missing at the
pins, and owned by SchemeAndStackFoundations §§1.8–1.9 and 1.18–1.22: the 2-fibre product of
stacks in groupoids, morphisms of stacks representable by algebraic spaces and their properties (so
smooth surjective atlases, flatness, local finite type and presentation), the predicate of being an
algebraic stack, the inertia stack and the automorphism group sheaves of its objects (from which
the README builds `G_x`), the topological space `|𝒳|`, quotient and classifying stacks `[U/R]` and
`BG`, and quasi-coherent modules on a stack. The tangent space of 7.3 also needs the framed deformation functor of
AlgebraicModuliForArithmeticGeometry §8.1, and gerbes of algebraic stacks the relative gerbes of
its §4.1, neither of which exists at the pins. Encoding these carriers here would be a long ad hoc
development of objects another roadmap owns, so nothing is stated in their place.
-/

namespace TauCetiRoadmap.StackPointsAndResidualGerbes

end TauCetiRoadmap.StackPointsAndResidualGerbes
