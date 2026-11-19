/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib

/-!
# Spectral manifolds and reconstruction: target signatures

This file is not the roadmap: README.md is. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`.

Stated here: the open mapping theorem and the closed graph theorem of SM3 for
complete metrizable Hausdorff topological vector spaces over `ℝ` or `ℂ`
(F-spaces; the Fréchet spaces of the roadmap are the locally convex ones).
The locally convex case over any complete nontrivially normed field, a
continuous linear surjection between Fréchet spaces given by countable seminorm
families, is LocallyAnalyticDistributions §0.2 and is consumed there; this
file states the extension to F-spaces, where no seminorm family is given, and
the closed graph theorem, which LocallyAnalyticDistributions does not state.
Mathlib at the pin proves the open mapping theorem for normed spaces
(`ContinuousLinearMap.isOpenMap`) and for σ-compact topological groups
(`AddMonoidHom.isOpenMap_of_sigmaCompact`); a Fréchet space is σ-compact only
when it is finite-dimensional, so neither covers the statement.

Not statable at the pins:
- the commutative reconstruction theorem (SM6): there is no Dixmier trace, no
  Hochschild orientation cycle and no regularity calculus (the objects of
  NoncommutativeGeometry N1, N4 and N5);
- the smooth Serre–Swan theorem (SM3): `ContMDiffSection` is a module over the
  scalar field only, not over the smooth functions, and there is no category of
  smooth vector bundles;
- Voiculescu's multiplicity formula (SM4): singular values exist only for maps
  between finite-dimensional spaces, and there is no Lorentz ideal `L^(p,1)`;
- the Weyl law and its Dixmier-trace comparison (SM7): there is no Dirac-type
  operator, no trace class and no Dixmier trace;
- the Spinᶜ and Spin reconstruction dictionaries (SM8): there is no spin
  structure or spinor bundle on a manifold;
- the fundamental class and the duality axiom (SM9): there is no KK theory;
- the parity and real products (SM10): there is no completed Hilbert tensor
  product and no spectral-triple carrier.
-/

namespace TauCetiRoadmap.SpectralManifolds

/-- **Open mapping theorem for F-spaces** (SM3; Rudin, *Functional Analysis*,
Theorem 2.11). Let `E` and `F` be complete metrizable Hausdorff topological vector
spaces over `𝕜 = ℝ` or `ℂ`; metrizability is expressed by a countably generated
uniformity of the additive group. Every continuous surjective linear map `E → F` is
open. Local convexity is not assumed: the locally convex case is
LocallyAnalyticDistributions §0.2. The Hausdorff hypothesis on `F` cannot be
dropped: the identity from `ℝ` to `ℝ` with the indiscrete topology is a continuous
linear surjection between complete pseudometrizable spaces and is not open. -/
theorem isOpenMap_of_surjective {𝕜 : Type*} [RCLike 𝕜] {E F : Type*}
    [AddCommGroup E] [Module 𝕜 E] [UniformSpace E] [IsUniformAddGroup E]
    [ContinuousSMul 𝕜 E] [CompleteSpace E] [Filter.IsCountablyGenerated (uniformity E)]
    [T2Space E]
    [AddCommGroup F] [Module 𝕜 F] [UniformSpace F] [IsUniformAddGroup F]
    [ContinuousSMul 𝕜 F] [CompleteSpace F] [Filter.IsCountablyGenerated (uniformity F)]
    [T2Space F]
    (f : E →L[𝕜] F) (hf : Function.Surjective f) : IsOpenMap f := by
  sorry

/-- **Closed graph theorem for F-spaces** (SM3; Rudin, *Functional Analysis*,
Theorem 2.15). Let `E` and `F` be complete metrizable Hausdorff topological vector
spaces over `𝕜 = ℝ` or `ℂ`. A linear map `E → F` whose graph is closed in `E × F`
is continuous. It follows from the open mapping theorem applied to the first
projection of the graph, which is itself an F-space. -/
theorem continuous_of_isClosed_graph {𝕜 : Type*} [RCLike 𝕜] {E F : Type*}
    [AddCommGroup E] [Module 𝕜 E] [UniformSpace E] [IsUniformAddGroup E]
    [ContinuousSMul 𝕜 E] [CompleteSpace E] [Filter.IsCountablyGenerated (uniformity E)]
    [T2Space E]
    [AddCommGroup F] [Module 𝕜 F] [UniformSpace F] [IsUniformAddGroup F]
    [ContinuousSMul 𝕜 F] [CompleteSpace F] [Filter.IsCountablyGenerated (uniformity F)]
    [T2Space F]
    (f : E →ₗ[𝕜] F) (hf : IsClosed (f.graph : Set (E × F))) : Continuous f := by
  sorry

end TauCetiRoadmap.SpectralManifolds
